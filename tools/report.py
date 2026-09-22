#!/usr/bin/env python3
"""Write a role's completion report into the shared, provider-neutral inbox.

THE PROBLEM. Brain can always see what execution left in the repository — a
branch, a diff, commits. It cannot see what execution *said*, because a
completion report is prose, not repository state, and repository state proves
that execution happened, never that a review happened, and never *why* nothing
changed. A round that correctly paused after finding nothing to do and a round
that silently crashed both leave an identical trace: no commit, no diff, a
clean checkout. Without the report, they are indistinguishable.

Claude Code's Stop hook solved this for one tool by mirroring a session's final
reply automatically. That is real, but it is provider-specific by construction
— it fires only for sessions run on that one tool, and a project's Worker or
Verifier seat is routinely run on whichever tool the owner chose *this* round.
A mechanism that only works for one provider is not a fix for the class.

THE MECHANISM THIS FILE IS. Not a hook, not a transcript scraper, not anything
that depends on a provider's internal storage format staying put. It is a
plain command a role's OWN CONTRACT tells it to run, as the last thing it does,
using the one capability every role in this framework already requires:
filesystem and git access. A tool-specific hook is a convenience that captures
a session from the *outside*. This is the role writing its own report from the
*inside*, which works identically whether the model is on Claude Code, Codex,
Antigravity, or a tool that does not exist yet — because it never asks what
tool is running. Provider-specific hooks are welcome to call the functions in
this module as their own writer, so a provider convenience and this baseline
never become two sources of truth for the same fact. See
`../framework/reports.md` for the full mechanism, the header format, and how
Brain reads what this writes.

Guarantees this module is responsible for, and how:

  * **Resolves the shared inbox from any worktree.** `git rev-parse
    --git-common-dir` names the same directory from every worktree of one
    clone, wherever it was cloned. The inbox lives inside it, which git treats
    as private and never version-controls.
  * **Identifies the role without asking anyone.** Never a CLI flag, never a
    provider's session metadata, never something a report could lie about.
    `git-and-isolation.md` puts one role per checkout; a linked worktree's own
    directory name already matches its role, and the primary checkout — where
    `--git-dir` and `--git-common-dir` coincide, which holds regardless of what
    either directory is called — is the coordinating role, tagged `brain`
    rather than guessed from a project's own name for that seat. A separate
    clone is coordinator-only because its inbox is private. Readers keep
    compatibility with older `coordinator-latest.md` reports.
  * **Writes atomically.** Write to a temp file beside the target, then
    `os.replace`, which is an atomic rename on both POSIX and Windows within one
    filesystem. A reader never observes a half-written report.
  * **Cannot silently overwrite another lane's report.** Two concurrently-active
    roles have two different checkouts by the isolation invariant, so their role
    tags differ by construction and they write to different files. This module
    does not enforce the isolation invariant; it relies on it, the same way
    every other role-per-checkout guarantee in this framework does.
  * **Carries provenance a reader can act on.** Every write is stamped with the
    task/brief this report is for, the exact HEAD SHA of the checkout at write
    time, the operating system reported by Python, and a timestamp. `status`
    compares that SHA against the checkout's
    *current* HEAD, so a reader does not have to parse the header by hand to
    tell a fresh report from a stale one.
  * **Finds reports by Brief-ID.** Each role/Brief-ID has an atomically replaced
    file under `by-task/`, keyed by a SHA-256 digest. The digest is a filesystem
    key only; the exact task remains in the provenance header. `latest` and
    `log` remain compatibility surfaces for adopted projects.

What this module deliberately does NOT do: decide whether a report is good,
guess a role's identity from anything self-reported, or make writing it
happen. Nothing here can force an agent to run this command — that remains the
role contract's job, the same as every other MUST in a contract an LLM reads
and decides whether to follow. A missing report is UNKNOWN, never evidence of
failure; see the constitution's *Unknown means unknown*.
"""

from __future__ import annotations

import argparse
import hashlib
import os
import platform
import re
import subprocess
import sys
import time
from urllib.parse import quote, unquote
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path

# `checkout.py` ships in this same `tools/` directory on every install --
# `adopt.py` adds both files unconditionally, as a matched pair, never one
# without the other. Importing it (rather than reimplementing its seat
# derivation here) is what makes role identity a SINGLE derivation both
# tools/checkout.py's first-action check and this writer use; see
# `checkout.checkout_seat`'s docstring and `git-and-isolation.md`.
sys.path.insert(0, str(Path(__file__).resolve().parent))
import checkout as _checkout  # noqa: E402

__all__ = [
    "ReportError",
    "Provenance",
    "git_common_dir",
    "role_tag",
    "head_sha",
    "write_report",
    "find_report",
    "latest_report_provenance",
    "check_status",
    "delivery_status",
]


class ReportError(Exception):
    """The repository state needed to write or check a report is unavailable.

    Raised, never swallowed, so a caller decides its own failure posture. The
    CLI's ``write`` command fails loudly on this, because the agent invoking it
    directly needs to know a report was not actually recorded. A provider hook
    calling `write_report` is free to catch this and stay silent, matching its
    own "never block a session" contract -- see
    `adapters/claude-code/hooks/save_agent_reply.py` for that shape.
    """


def _git(args: list[str], cwd: str | Path | None = None) -> str | None:
    try:
        return subprocess.check_output(
            ["git", *args], stderr=subprocess.DEVNULL, text=True, cwd=cwd,
        ).strip()
    except (subprocess.CalledProcessError, FileNotFoundError, OSError):
        return None


def _resolve(raw: str, cwd: str | Path | None) -> Path:
    path = Path(raw)
    if not path.is_absolute():
        base = Path(cwd) if cwd else Path.cwd()
        path = (base / path).resolve()
    return path


def git_common_dir(cwd: str | Path | None = None) -> Path:
    """The repository's shared git directory, resolved from any worktree."""
    raw = _git(["rev-parse", "--git-common-dir"], cwd=cwd)
    if not raw:
        raise ReportError(
            "not inside a git repository, or git is unavailable"
        )
    return _resolve(raw, cwd)


def role_tag(cwd: str | Path | None = None) -> str:
    """This checkout's role, derived structurally -- see the module docstring.

    Delegates to `checkout.checkout_seat` -- the exact function
    `tools/checkout.py`'s first-action check calls -- rather than
    re-deriving the seat here. Two independent implementations of the same
    rule drift; a linked worktree outside `.worktrees/` must resolve to the same
    seat whichever tool asks. A separate clone is coordinator-only and any
    non-coordinator `framework.checkout-seat` assignment is rejected before a
    report can be written. `coordinator="brain"` names the pre-seat
    compatibility tag: readers still fall back to `coordinator-latest.md`
    below.
    """
    try:
        role = _checkout.checkout_seat(cwd, coordinator="brain")
    except _checkout.CheckoutError as exc:
        raise ReportError(str(exc)) from exc
    try:
        return _checkout.validate_role_name(role)
    except _checkout.CheckoutError as exc:
        raise ReportError(str(exc)) from exc


def head_sha(cwd: str | Path | None = None) -> str | None:
    """The exact HEAD SHA of this checkout, or None if it cannot be read.

    Meaningful even for a round that made no commit: it names the state the
    checkout was actually at when the report was written, which is exactly what
    a later staleness check needs -- not "what changed", but "has this checkout
    moved since".
    """
    return _git(["rev-parse", "HEAD"], cwd=cwd)


#: The auto-seeded inbox README. Generalised from the Claude Code adapter's own
#: copy: this is now the canonical wording, and that adapter's hook reuses it
#: via `_seed_readme` rather than keeping a second copy that could drift.
README = """# agent-inbox

Auto-populated by `tools/report.py`, called either directly by a role's own
contract or by a provider-specific convenience hook that calls the same
writer. Each `<role>-latest.md` holds the most recent completion report from
the matching checkout. `brain-latest.md` is the coordinating role's own
report, from the project's primary checkout. The old `coordinator-latest.md`
filename remains readable for reports written by an earlier adoption.
Reports are also retained at `by-task/<role>/<sha256-of-brief>.md`, so a
reader can find an older report by its Brief-ID after a later report replaces
`latest`. The hash is only a filesystem key; the provenance header remains the
authoritative exact task value.

**A missing or stale file means UNKNOWN, never that a task did not happen or
that a review did not run.** Not every role runs this command every round --
see `framework/reports.md` for when it is expected and what its absence does
and does not prove. Check the `head=` field in a report's header against the
checkout's current `git rev-parse HEAD`, or run
`python tools/report.py status --cwd <checkout>`, before trusting a report
whose checkout may have moved on since it was written.

Not under version control: this lives inside git's own directory.
"""


def _atomic_write(path: Path, content: str) -> None:
    """Write-then-rename, retrying Windows' sharing violation briefly.

    Ported from edopro-retro-formats, `tools/report.py`, whose report writer
    handles a reader holding the destination open.
    """
    tmp = path.with_name(f"{path.name}.tmp-{os.getpid()}")
    tmp.write_text(content, encoding="utf-8")
    deadline = time.monotonic() + 5.0
    delay = 0.005
    while True:
        try:
            os.replace(tmp, path)
            return
        except PermissionError:
            if time.monotonic() >= deadline:
                try:
                    tmp.unlink()
                except FileNotFoundError:
                    pass
                raise
            time.sleep(delay)
            delay = min(delay * 2, 0.05)


def _seed_readme(inbox: Path) -> None:
    readme = inbox / "README.md"
    if not readme.exists():
        _atomic_write(readme, README)


def _header(*, role: str, task: str, sha: str, source: str, stamp: str,
            operating_system: str) -> str:
    # Header fields are space-delimited for compatibility with existing
    # reports.  Format 2 makes the task encoding unambiguous: readers decode
    # only headers carrying this marker.  A header without it is a literal
    # legacy header, because main's older writer stored percent sequences as
    # written.
    # ``:`` remains literal for compatibility with the hook's historical
    # session-tagged task values; it is not used as a filesystem key.
    encoded_task = quote(task, safe="-._~:")
    return (
        f"<!-- captured {stamp} format=2 role={role} task={encoded_task} head={sha} "
        f"os={operating_system} source={source} -->\n\n"
    )


def _canonical_task(task: str) -> str:
    if not isinstance(task, str) or not task:
        raise ReportError("a task/brief identifier is required")
    if not task.strip():
        raise ReportError("a task/brief identifier is required")
    if task != task.strip():
        raise ReportError(
            "a task/brief identifier may not have leading or trailing whitespace"
        )
    return task


def _task_key(task: str) -> str:
    return hashlib.sha256(task.encode("utf-8")).hexdigest()


def _archive_path(inbox: Path, role: str, task: str) -> Path:
    try:
        _checkout.validate_role_name(role)
    except _checkout.CheckoutError as exc:
        raise ReportError(str(exc)) from exc
    return inbox / "by-task" / role / f"{_task_key(task)}.md"


def _latest_path(inbox: Path, role: str) -> Path:
    return inbox / f"{role}-latest.md"


def _read_provenance(path: Path) -> Provenance | None:
    try:
        return _parse_header(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeDecodeError):
        return None


def write_report(
    text: str,
    *,
    task: str,
    cwd: str | Path | None = None,
    source: str = "report.py",
) -> Path:
    """Atomically write this checkout's completion report to the shared inbox.

    ``task`` is required: without it, two reports from the same role that left
    HEAD unchanged -- two consecutive investigative rounds, say -- would be
    indistinguishable by SHA alone. Use the brief's stable `Brief-ID` value,
    not the transient `active.md` filename.

    Returns the path written. Raises `ReportError` rather than writing a
    partial or misattributed report -- see that class's docstring for why
    callers should not swallow it uniformly.
    """
    body_text = text.strip()
    if not body_text:
        raise ReportError("report text is empty")
    task = _canonical_task(task)

    inbox = git_common_dir(cwd) / "agent-inbox"
    role = role_tag(cwd)
    sha = head_sha(cwd) or "unknown"
    stamp = datetime.now(timezone.utc).isoformat(timespec="seconds")

    inbox.mkdir(parents=True, exist_ok=True)
    _seed_readme(inbox)

    header = _header(
        role=role, task=task, sha=sha, source=source, stamp=stamp,
        operating_system=platform.system(),
    )
    body = header + body_text + "\n"

    archive = _archive_path(inbox, role, task)
    if archive.is_file():
        existing = _read_provenance(archive)
        if existing is None or existing.role != role or existing.task != task:
            raise ReportError(
                f"report task key collision at {archive}; refusing to overwrite it"
            )
    archive.parent.mkdir(parents=True, exist_ok=True)
    _atomic_write(archive, body)

    latest = _latest_path(inbox, role)
    _atomic_write(latest, body)

    log = inbox / f"{role}-log.md"
    with log.open("a", encoding="utf-8") as f:
        f.write(f"\n\n---\n\n{header}{body_text}\n")

    return latest


@dataclass(frozen=True)
class Provenance:
    """What a report's header claims, read back."""

    role: str
    task: str | None
    head: str | None
    source: str | None
    stamp: str | None
    operating_system: str | None = None


def _parse_header(text: str) -> Provenance | None:
    first_line = text.splitlines()[0] if text else ""
    if not first_line.startswith("<!-- captured "):
        return None
    fields: dict[str, str] = {}
    inner = first_line[len("<!-- captured ") : -len(" -->")] if first_line.endswith(" -->") else first_line
    parts = inner.split(" ")
    stamp = parts[0] if parts else None
    for part in parts[1:]:
        if "=" in part:
            key, _, value = part.partition("=")
            fields[key] = value
    # The legacy writer did not encode spaces in a task. Recover that exact
    # value from the stable delimiters that follow it instead of treating the
    # first word as the whole task. The greedy task group deliberately uses
    # the final ``head=... source=...`` pair, matching the writer's layout.
    legacy_task = re.search(
        r"\stask=(.*)\shead=(\S+)\ssource=(\S+)\s*$", inner
    )
    if legacy_task:
        fields["task"] = legacy_task.group(1)
        fields["head"] = legacy_task.group(2)
        fields["source"] = legacy_task.group(3)
    encoded_task = fields.get("task")
    try:
        parsed_task = (
            unquote(encoded_task)
            if encoded_task is not None and fields.get("format") == "2"
            else encoded_task
        )
    except (UnicodeDecodeError, ValueError):
        parsed_task = None
    return Provenance(
        role=fields.get("role", ""),
        task=parsed_task,
        head=fields.get("head"),
        source=fields.get("source"),
        stamp=stamp,
        operating_system=fields.get("os"),
    )


def latest_report_provenance(cwd: str | Path | None = None) -> Provenance | None:
    """This checkout's own latest report header, if one exists and is readable.

    "This checkout's role" -- the same auto-derivation `write_report` uses, so
    a caller reads the correct file without ever naming a role by hand. Used
    by `check_status` below, and by a provider hook (see
    `adapters/claude-code/hooks/save_agent_reply.py`) that must tell a report
    the agent already wrote for its current work apart from one it did not.
    Returns ``None`` when no report exists yet, or an existing file's header
    cannot be read at all -- both ordinary, not errors.
    """
    role = role_tag(cwd)
    inbox = git_common_dir(cwd) / "agent-inbox"
    latest = _latest_path(inbox, role)
    if role == "brain" and not latest.is_file():
        legacy = inbox / "coordinator-latest.md"
        if legacy.is_file():
            latest = legacy
    if not latest.is_file():
        return None
    try:
        return _read_provenance(latest)
    except ReportError:
        return None


def find_report(
    *, role: str, task: str, cwd: str | Path | None = None,
) -> Path | None:
    """Find the newest report for an exact role and Brief-ID.

    New writers keep one atomically replaced file per task under ``by-task``.
    If that file is absent, fall back to the legacy latest surface so an inbox
    created by an older adoption remains readable. A latest file is accepted
    only when its provenance matches both requested values.
    """
    task = _canonical_task(task)
    inbox = git_common_dir(cwd) / "agent-inbox"
    archive = _archive_path(inbox, role, task)
    if archive.is_file():
        provenance = _read_provenance(archive)
        if provenance is not None and provenance.role == role and provenance.task == task:
            return archive
        return None

    latest = _latest_path(inbox, role)
    if role == "brain" and not latest.is_file():
        legacy = inbox / "coordinator-latest.md"
        if legacy.is_file():
            latest = legacy
    if not latest.is_file():
        return None
    provenance = _read_provenance(latest)
    acceptable_roles = {role}
    if latest.name == "coordinator-latest.md" and role == "brain":
        acceptable_roles.add("coordinator")
    if provenance is not None and provenance.role in acceptable_roles and provenance.task == task:
        return latest
    return None


def check_status(cwd: str | Path | None = None) -> tuple[int, str]:
    """Is the latest report for THIS checkout's role still fresh?

    Returns (exit_code, message): 0 fresh, 1 stale (checkout has moved since
    the report was written), 2 no report found for this role.
    """
    role = role_tag(cwd)
    inbox = git_common_dir(cwd) / "agent-inbox"
    latest = _latest_path(inbox, role)
    if role == "brain" and not latest.is_file():
        legacy = inbox / "coordinator-latest.md"
        if legacy.is_file():
            latest = legacy
    if not latest.is_file():
        return 2, f"no report found for role '{role}' at {latest}"

    provenance = latest_report_provenance(cwd)
    current = head_sha(cwd)
    if provenance is None or provenance.head is None:
        return 1, f"{latest} has no readable provenance header; treat as stale"
    if current is None:
        return 1, f"could not read this checkout's current HEAD to compare against {latest}"
    if provenance.head != current:
        return 1, (
            f"stale: {latest} was written at head={provenance.head}, "
            f"this checkout is now at {current}"
        )
    return 0, (
        f"fresh: {latest} (task={provenance.task}, written {provenance.stamp}) "
        f"matches current head {current}"
    )


def _commit_for_ref(ref: str, cwd: str | Path | None = None) -> str | None:
    candidates = [ref]
    if not ref.startswith(("origin/", "refs/")):
        candidates.append("origin/" + ref)
    for candidate in candidates:
        resolved = _git(
            ["rev-parse", "--verify", candidate + "^{commit}"], cwd=cwd
        )
        if resolved:
            return resolved
    return None


def _fetch_branch(branch: str, cwd: str | Path | None = None) -> None:
    """Best-effort fetch of the named branch before resolving delivery.

    A Verifier must use a linked worktree; a separate clone is coordinator-only
    because its completion-report inbox is private. A linked worktree may
    already have the local branch, and a repository without an ``origin`` may
    be intentionally offline; both cases remain usable because the local and
    fetched remote refs are reconciled below and fetch failure is retryable.
    """
    remote_branch = branch
    if remote_branch.startswith("refs/remotes/origin/"):
        remote_branch = remote_branch[len("refs/remotes/origin/"):]
    elif remote_branch.startswith("refs/heads/"):
        remote_branch = remote_branch[len("refs/heads/"):]
    elif remote_branch.startswith("origin/"):
        remote_branch = remote_branch[len("origin/"):]
    if remote_branch.startswith("refs/") or not remote_branch:
        return
    try:
        subprocess.run(
            ["git", "fetch", "--quiet", "--no-tags", "origin", remote_branch],
            cwd=cwd,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            check=False,
        )
    except (FileNotFoundError, OSError):
        return


def _branch_ref_names(branch: str) -> tuple[str, str]:
    """Return the local and origin ref names for a branch argument."""
    name = branch
    if name.startswith("refs/remotes/origin/"):
        name = name[len("refs/remotes/origin/"):]
    elif name.startswith("refs/heads/"):
        name = name[len("refs/heads/"):]
    elif name.startswith("origin/"):
        name = name[len("origin/"):]
    return name, "origin/" + name


def _exact_commit(ref: str, cwd: str | Path | None = None) -> str | None:
    """Resolve exactly one ref, without falling back to another namespace."""
    return _git(["rev-parse", "--verify", ref + "^{commit}"], cwd=cwd)


def _delivery_branch_head(
    branch: str, cwd: str | Path | None = None,
) -> tuple[str | None, str | None]:
    """Reconcile a local branch with the freshly fetched origin branch.

    A stale local ref must not hide a newer remote head. A local branch ahead
    of origin is valid for a linked executor worktree, while divergence is
    ambiguous and must remain retryable rather than selecting either side.
    """
    local_ref, remote_ref = _branch_ref_names(branch)
    local = _exact_commit(local_ref, cwd)
    remote = _exact_commit(remote_ref, cwd)
    if local is None:
        if remote is None:
            return None, None
        return remote, None
    if remote is None or local == remote:
        return local, None
    if _is_ancestor(local, remote, cwd):
        return remote, None
    if _is_ancestor(remote, local, cwd):
        return local, None
    return None, (
        f"not delivered yet: local branch '{local_ref}' at {local} diverges "
        f"from fetched origin/{local_ref} at {remote}"
    )
def _is_ancestor(base: str, head: str, cwd: str | Path | None = None) -> bool:
    try:
        return subprocess.run(
            ["git", "merge-base", "--is-ancestor", base, head],
            cwd=cwd,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        ).returncode == 0
    except (FileNotFoundError, OSError):
        return False


def delivery_status(
    *,
    branch: str,
    base: str,
    role: str,
    task: str,
    cwd: str | Path | None = None,
) -> tuple[int, str]:
    """Check whether an executor has delivered this task for Verifier review.

    Delivery is a conjunction, not a branch existence check: the named branch
    must resolve to a commit strictly after an ancestor base, and the shared
    inbox must contain the named role's report with matching task and HEAD
    provenance. The named branch is fetched from ``origin`` first; a Verifier
    performs this check from a linked worktree, while separate clones remain
    coordinator-only because their inboxes are private. A missing branch, an
    unavailable base, or a branch still at the base is retryable. Once the
    branch is strictly ahead of the base, an absent matching report is a
    different state: the work may have been delivered in another clone, but
    delivery is not established from this clone.
    """
    _fetch_branch(branch, cwd)
    head, conflict = _delivery_branch_head(branch, cwd)
    if conflict:
        return 1, conflict
    if head is None:
        return 1, f"not delivered yet: branch '{branch}' is not available"
    base_sha = _commit_for_ref(base, cwd)
    if base_sha is None:
        return 1, f"not delivered yet: base '{base}' is not available"
    if head == base_sha:
        return 1, f"not delivered yet: branch '{branch}' is still at the base"
    if not _is_ancestor(base_sha, head, cwd):
        return 1, (
            f"not delivered yet: base {base_sha} is not an ancestor of "
            f"branch '{branch}' at {head}"
        )

    report_path = find_report(role=role, task=task, cwd=cwd)
    if report_path is None:
        return 1, (
            "branch delivered but report unavailable in this clone: no matching "
            f"report for role '{role}' and task '{task}' at branch head {head}; "
            "obtain the report from the source clone or have the owner carry its "
            "exact body, then verify the role, task and head. Delivery is not "
            "established by this check"
        )
    provenance = _read_provenance(report_path)
    if provenance is None:
        return 1, f"not delivered yet: report for role '{role}' has no header"
    if provenance.role != role or provenance.task != task:
        return 1, (
            f"not delivered yet: report provenance does not match role '{role}' "
            f"and task '{task}'"
        )
    if provenance.head != head:
        return 1, (
            f"not delivered yet: report head={provenance.head} does not match "
            f"branch '{branch}' at {head}"
        )
    return 0, f"delivered: role={role} task={task} branch={branch} head={head}"


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    sub = ap.add_subparsers(dest="command", required=True)

    write_p = sub.add_parser(
        "write", help="write this checkout's completion report to the shared inbox"
    )
    write_p.add_argument(
        "--task", required=True,
        help="the stable Brief-ID this report is for",
    )
    write_p.add_argument(
        "--file", help="read the report from this file instead of stdin"
    )
    write_p.add_argument(
        "--source", default="cli",
        help="who invoked this -- informational only, never role identity",
    )

    status_p = sub.add_parser(
        "status",
        help="check whether the latest report for this checkout's role is fresh",
    )
    status_p.add_argument(
        "--cwd", default=None,
        help="checkout to check from (default: the current directory)",
    )

    delivery_p = sub.add_parser(
        "delivery",
        help="check whether a role delivered work for exact-SHA review",
    )
    delivery_p.add_argument("--branch", required=True)
    delivery_p.add_argument("--base", required=True)
    delivery_p.add_argument("--role", required=True)
    delivery_p.add_argument("--task", required=True)
    delivery_p.add_argument(
        "--cwd", default=None,
        help="repository checkout to inspect (default: current directory)",
    )

    find_p = sub.add_parser(
        "find", help="find a completion report by role and exact Brief-ID"
    )
    find_p.add_argument("--role", required=True)
    find_p.add_argument("--task", required=True)
    find_p.add_argument(
        "--cwd", default=None,
        help="repository checkout to inspect (default: current directory)",
    )

    args = ap.parse_args(argv)

    if args.command == "write":
        text = Path(args.file).read_text(encoding="utf-8") if args.file else sys.stdin.read()
        try:
            path = write_report(text, task=args.task, source=args.source)
        except ReportError as exc:
            print(f"report: {exc}", file=sys.stderr)
            return 1
        print(f"report: wrote {path}")
        return 0

    if args.command == "status":
        try:
            code, message = check_status(args.cwd)
        except ReportError as exc:
            print(f"report: {exc}", file=sys.stderr)
            return 3
        print(message)
        return code

    if args.command == "delivery":
        try:
            code, message = delivery_status(
                branch=args.branch,
                base=args.base,
                role=args.role,
                task=args.task,
                cwd=args.cwd,
            )
        except ReportError as exc:
            print(f"report: {exc}", file=sys.stderr)
            return 3
        print(message)
        return code

    if args.command == "find":
        try:
            path = find_report(role=args.role, task=args.task, cwd=args.cwd)
        except ReportError as exc:
            print(f"report: {exc}", file=sys.stderr)
            return 3
        if path is None:
            print(f"no report found for role '{args.role}' and task '{args.task}'")
            return 1
        print(path)
        return 0

    return 2  # pragma: no cover - argparse enforces a valid subcommand


if __name__ == "__main__":
    sys.exit(main())
