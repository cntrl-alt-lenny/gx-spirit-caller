#!/usr/bin/env python3
"""
lane_report.py — recover a finished lane's final report without a manual paste.

The brain needs one thing when a lane finishes: the lane's own final message.
Repository state alone cannot supply it. Round 0906 proved that concretely —
the Scaffolder produced zero commits, and `git status` could not distinguish
"correctly paused because the brain held the compiler lock" from "did no work".
Its final message said exactly which, and only the transcript held it.

RECOVERY ORDER (see docs/decomp-workflow.md § Lane report recovery):

  1. The shared inbox artifact, `<git-common-dir>/agent-inbox/<role>-latest.md`.
     Provider-neutral and canonical. Written by whatever session-end mechanism
     the harness offers, so it is the layer that should eventually always win.
  2. Provider-specific transcript recovery, this tool's fallback. Reads the
     harness's own on-disk session store for the provider that ran the lane.
  3. UNKNOWN. A report that cannot be recovered is UNKNOWN, never "nothing
     happened" — absence of a report is not evidence of absence of work.

MATCHING. The point of failure this tool must not have is returning the wrong
lane's report. It never takes "the newest chat on the machine", and it does not
accept a session merely because that session TALKS ABOUT a lane — the brain and
the sibling lane both do that constantly. A candidate must sit under this
repository's worktree tree AND show that it was ADDRESSED as the lane: the
kickoff header in a user-authored turn, or a cwd inside a worktree named for the
role. Branch and worktree mentions are recorded as corroboration only.
Ambiguity is reported as ambiguity, not resolved by guessing.

MACHINE-SPECIFIC PATHS DO NOT BELONG IN VERSION CONTROL. Provider roots
default to the standard `~`-relative locations, which are portable. A machine
that differs writes `<git-common-dir>/agent-inbox/providers.local.json`, which
lives inside `.git/` and is therefore never committed.

Usage:
    python3.13 tools/lane_report.py --role scaffolder
    python3.13 tools/lane_report.py --role decomper --provider codex
    python3.13 tools/lane_report.py --role scaffolder --since 2026-09-01T09:00
    python3.13 tools/lane_report.py --role decomper --json
    python3.13 tools/lane_report.py --probe        # what is installed here

Exit codes:
    0   a report was recovered (or --probe succeeded)
    3   UNKNOWN — nothing recoverable; a manual paste is required
    4   ambiguous — several sessions matched; narrow with --since/--provider
    2   usage / IO error
"""
from __future__ import annotations

import argparse
import json
import os
import re
import sqlite3
import subprocess
import sys
from dataclasses import dataclass, field
from datetime import datetime, timedelta, UTC
from pathlib import Path

ROLES = ("brain", "decomper", "scaffolder")

# Standard, portable provider locations. A machine that differs overrides these
# in <git-common-dir>/agent-inbox/providers.local.json — never in a tracked file.
DEFAULT_PROVIDER_ROOTS = {
    "codex": ["~/.codex/sessions", "~/.codex/archived_sessions"],
    "claude": ["~/.claude/projects"],
    "antigravity": ["~/.gemini/antigravity-cli/conversations"],
}

_ROLE_HEADER_RE = {
    role: re.compile(rf"^\s*{role}\b\s*[—–-]", re.IGNORECASE | re.MULTILINE)
    for role in ROLES
}


# --- provenance --------------------------------------------------------------


@dataclass
class Report:
    role: str
    text: str
    provider: str
    layer: str                      # "inbox" | "transcript"
    session_id: str = ""
    source: str = ""
    started: str = ""
    ended: str = ""
    cwd: str = ""
    matched_on: list[str] = field(default_factory=list)

    def to_dict(self) -> dict:
        d = dict(self.__dict__)
        return d

    def render(self) -> str:
        head = [
            f"ROLE      : {self.role}",
            f"LAYER     : {self.layer}",
            f"PROVIDER  : {self.provider}",
        ]
        if self.session_id:
            head.append(f"SESSION   : {self.session_id}")
        if self.cwd:
            head.append(f"CWD       : {self.cwd}")
        if self.started or self.ended:
            head.append(f"WINDOW    : {self.started} -> {self.ended}")
        if self.matched_on:
            head.append(f"MATCHED ON: {', '.join(self.matched_on)}")
        if self.source:
            head.append(f"SOURCE    : {self.source}")
        rule = "-" * 72
        return "\n".join(head) + f"\n{rule}\n{self.text.rstrip()}\n"


# --- repo geometry -----------------------------------------------------------


def _git(repo: Path, *args: str) -> str:
    result = subprocess.run(
        ["git", "-C", str(repo), *args],
        capture_output=True, text=True, check=False,
    )
    return result.stdout.strip() if result.returncode == 0 else ""


def git_common_dir(repo: Path) -> Path:
    raw = _git(repo, "rev-parse", "--git-common-dir")
    if not raw:
        raise RuntimeError(f"not a git repository: {repo}")
    path = Path(raw)
    return path if path.is_absolute() else (repo / path).resolve()


def worktree_paths(repo: Path) -> list[Path]:
    """Every worktree of this repository, from git itself — never hardcoded."""
    out = _git(repo, "worktree", "list", "--porcelain")
    paths = [
        Path(line.split(" ", 1)[1]).resolve()
        for line in out.splitlines() if line.startswith("worktree ")
    ]
    return paths


def repo_scope(repo: Path) -> list[Path]:
    """Directories a lane session may legitimately have run in.

    Lanes are dispatched with a `cd` into their own worktree, but the harness
    session itself is often opened on the CONTAINING directory — round 0906's
    Codex sessions both reported the parent as cwd. So the scope is every
    worktree plus their common parent.
    """
    trees = worktree_paths(repo) or [repo.resolve()]
    scope = set(trees)
    parents = {p.parent for p in trees}
    # Only admit a parent that actually contains more than one worktree; that
    # is the lane container, not an unrelated ancestor like the home directory.
    for parent in parents:
        if sum(1 for t in trees if t.parent == parent) > 1:
            scope.add(parent)
    return sorted(scope)


def _within(path: str, scope: list[Path]) -> Path | None:
    if not path:
        return None
    try:
        candidate = Path(path).resolve()
    except (OSError, ValueError):
        return None
    for root in scope:
        # Resolve BOTH sides. On macOS `/tmp` and `/var` are symlinks into
        # `/private`, so an unresolved root would never match a resolved
        # candidate and every session would be silently discarded.
        try:
            resolved_root = Path(root).resolve()
        except (OSError, ValueError):
            continue
        if candidate == resolved_root or resolved_root in candidate.parents:
            return resolved_root
    return None


# --- local provider configuration -------------------------------------------


def load_provider_roots(common_dir: Path) -> dict[str, list[Path]]:
    config_path = common_dir / "agent-inbox" / "providers.local.json"
    roots = {k: list(v) for k, v in DEFAULT_PROVIDER_ROOTS.items()}
    if config_path.is_file():
        try:
            data = json.loads(config_path.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError) as exc:
            print(f"WARNING: unreadable {config_path}: {exc}", file=sys.stderr)
            data = {}
        for provider, value in (data.get("providers") or {}).items():
            if isinstance(value, str):
                roots[provider] = [value]
            elif isinstance(value, list):
                roots[provider] = list(value)
    return {
        provider: [Path(os.path.expanduser(p)) for p in paths]
        for provider, paths in roots.items()
    }


# --- layer 1: the shared inbox ----------------------------------------------


_CAPTURE_RE = re.compile(r"<!--\s*captured\s+(?P<ts>[0-9T:\-\.]+)(?P<rest>[^>]*)-->")


def read_inbox(common_dir: Path, role: str, stale_after: timedelta | None,
               now: datetime) -> tuple[Report | None, str]:
    path = common_dir / "agent-inbox" / f"{role}-latest.md"
    if not path.is_file():
        return None, f"no inbox artifact at {path.name}"
    text = path.read_text(encoding="utf-8")
    match = _CAPTURE_RE.search(text)
    captured = ""
    if match:
        captured = match.group("ts")
    body = _CAPTURE_RE.sub("", text).strip()
    if not body:
        return None, f"{path.name} is empty"
    if captured and stale_after is not None:
        try:
            stamp = datetime.fromisoformat(captured)
            if stamp.tzinfo is None:
                stamp = stamp.replace(tzinfo=UTC)
            if now - stamp > stale_after:
                age = now - stamp
                return None, (
                    f"{path.name} is stale (captured {captured}, "
                    f"{age.days}d old)"
                )
        except ValueError:
            pass
    return Report(
        role=role, text=body, provider="inbox", layer="inbox",
        source=str(path), ended=captured,
    ), "ok"


# --- layer 2a: codex ---------------------------------------------------------


def _iter_jsonl(path: Path):
    try:
        with path.open(encoding="utf-8", errors="replace") as handle:
            for line in handle:
                line = line.strip()
                if not line:
                    continue
                try:
                    yield json.loads(line)
                except json.JSONDecodeError:
                    continue
    except OSError:
        return


def scan_codex(roots: list[Path], role: str, scope: list[Path],
               since: datetime | None) -> list[Report]:
    """Codex writes one rollout .jsonl per session.

    Record 0 is `session_meta`, carrying `cwd` and `session_id`. Each completed
    turn emits an `event_msg` of type `task_complete` whose `last_agent_message`
    is exactly the text the user would otherwise paste. That is a semantic,
    first-class field rather than a scrape of rendered output.
    """
    found: list[Report] = []
    for root in roots:
        if not root.is_dir():
            continue
        for path in root.rglob("*.jsonl"):
            records = list(_iter_jsonl(path))
            if not records:
                continue
            meta = records[0]
            if meta.get("type") != "session_meta":
                continue
            payload = meta.get("payload", {})
            cwd = payload.get("cwd", "")
            if _within(cwd, scope) is None:
                continue
            blob_parts, user_parts, last_message, last_ts = [], [], "", ""
            for record in records:
                rec_payload = record.get("payload", {})
                if not isinstance(rec_payload, dict):
                    continue
                if rec_payload.get("type") == "task_complete":
                    message = rec_payload.get("last_agent_message") or ""
                    if message:
                        last_message = message
                        last_ts = record.get("timestamp", "") or last_ts
                content = rec_payload.get("content")
                texts: list[str] = []
                if isinstance(content, list):
                    texts = [
                        b["text"] for b in content
                        if isinstance(b, dict) and isinstance(b.get("text"), str)
                    ]
                elif isinstance(rec_payload.get("text"), str):
                    texts = [rec_payload["text"]]
                if not texts:
                    continue
                blob_parts.extend(texts)
                if rec_payload.get("role") == "user":
                    user_parts.extend(texts)
            if not last_message:
                continue
            started = payload.get("timestamp", "")
            if since is not None and not _at_or_after(last_ts or started, since):
                continue
            markers = _role_markers(
                role, "\n".join(user_parts), "\n".join(blob_parts), cwd,
            )
            if not markers:
                continue
            found.append(Report(
                role=role, text=last_message, provider="codex",
                layer="transcript", session_id=payload.get("session_id", ""),
                source=str(path), started=started, ended=last_ts, cwd=cwd,
                matched_on=markers,
            ))
    return found


# --- layer 2b: claude code ---------------------------------------------------


def _project_slug(path) -> str:
    """Encode a cwd the way Claude Code names its project directory.

    Round 0908 correction. This used to be str(p).replace("/", "-"),
    which is a no-op on Windows: str(Path) yields backslash separators
    and a drive colon, so the computed slug kept its original form while
    the real store holds "C--Users-...". Verified against the live store
    on the Windows brain host -- the intersection with the real project
    directories was EMPTY and scan_claude returned 0 hits for a role
    whose directory exists. That made lane_report blind on the
    coordinating machine, the same path-separator class as the
    load_module_sections bug in PR #1580.

    Each of forward slash, backslash and colon becomes "-", which is why
    a Windows drive letter renders as a double dash.
    """
    text = str(path)
    for separator in ("/", '\\', ":"):
        text = text.replace(separator, "-")
    return text


def _slug_to_path(slug: str) -> str:
    # Claude Code names a project directory after the cwd with separators
    # replaced by '-'. The transform is lossy (a literal '-' is indistinguishable
    # from '/'), so the slug is used only to SHORTLIST; cwd on the records is
    # what actually decides.
    return "/" + slug.lstrip("-").replace("-", "/")


def scan_claude(roots: list[Path], role: str, scope: list[Path],
                since: datetime | None) -> list[Report]:
    """Claude Code writes ~/.claude/projects/<cwd-slug>/<session-id>.jsonl."""
    found: list[Report] = []
    scope_slugs = {_project_slug(p) for p in scope}
    for root in roots:
        if not root.is_dir():
            continue
        for project_dir in root.iterdir():
            if not project_dir.is_dir():
                continue
            name = project_dir.name
            if not any(name == slug or name.startswith(slug + "-")
                       for slug in scope_slugs):
                continue
            for path in project_dir.glob("*.jsonl"):
                records = list(_iter_jsonl(path))
                if not records:
                    continue
                cwd = next(
                    (r.get("cwd") for r in records if r.get("cwd")),
                    _slug_to_path(name),
                )
                if _within(cwd, scope) is None:
                    continue
                blob_parts, user_parts = [], []
                last_message, last_ts, session_id = "", "", ""
                for record in records:
                    session_id = record.get("sessionId") or session_id
                    message = record.get("message")
                    if not isinstance(message, dict):
                        continue
                    content = message.get("content")
                    texts = []
                    if isinstance(content, str):
                        texts = [content]
                    elif isinstance(content, list):
                        texts = [
                            b["text"] for b in content
                            if isinstance(b, dict) and isinstance(b.get("text"), str)
                        ]
                    if not texts:
                        continue
                    blob_parts.extend(texts)
                    if record.get("type") == "user":
                        user_parts.extend(texts)
                    if record.get("type") == "assistant":
                        last_message = texts[-1]
                        last_ts = record.get("timestamp", "") or last_ts
                if not last_message:
                    continue
                started = records[0].get("timestamp", "")
                if since is not None and not _at_or_after(last_ts or started, since):
                    continue
                markers = _role_markers(
                    role, "\n".join(user_parts), "\n".join(blob_parts), cwd,
                )
                if not markers:
                    continue
                found.append(Report(
                    role=role, text=last_message, provider="claude",
                    layer="transcript", session_id=session_id or path.stem,
                    source=str(path), started=started, ended=last_ts, cwd=cwd,
                    matched_on=markers,
                ))
    return found


# --- layer 2c: antigravity ---------------------------------------------------


def probe_antigravity(roots: list[Path]) -> tuple[bool, str]:
    """Antigravity is NOT recoverable, and this reports why rather than guessing.

    Its conversation store is SQLite, but the rows are opaque protobuf blobs and
    `trajectory_meta` carries only (trajectory_id, cascade_id, trajectory_type,
    source) — no cwd, no workspace, no timestamp. There is therefore no
    supported way to tie a trajectory to a lane worktree, and a scraper would be
    both brittle and unable to prove it had the right lane. Per this tool's
    contract that is UNKNOWN, which is the honest answer.
    """
    for root in roots:
        if not root.is_dir():
            continue
        dbs = sorted(root.glob("*.db"))
        if not dbs:
            continue
        try:
            with sqlite3.connect(f"file:{dbs[0]}?mode=ro", uri=True) as conn:
                cols = {
                    row[1] for row in
                    conn.execute("PRAGMA table_info(trajectory_meta)")
                }
        except sqlite3.Error as exc:
            return True, f"present, unreadable ({exc})"
        if not ({"cwd", "workspace"} & cols):
            return True, (
                f"present ({len(dbs)} store(s)) but NO lane discriminator — "
                "trajectory_meta exposes no cwd/workspace column and steps are "
                "opaque protobuf blobs; cannot prove which lane a trajectory is"
            )
        return True, "present with a workspace column (recovery may be possible)"
    return False, "not installed / no conversation store found"


# --- matching ----------------------------------------------------------------


def _at_or_after(stamp: str, since: datetime) -> bool:
    if not stamp:
        return True
    try:
        value = datetime.fromisoformat(stamp.replace("Z", "+00:00"))
    except ValueError:
        return True
    if value.tzinfo is None:
        value = value.replace(tzinfo=UTC)
    return value >= since


def _role_markers(role: str, user_blob: str, full_blob: str, cwd: str) -> list[str]:
    """Positive evidence that this session IS the given lane.

    Never "the newest chat". More subtly: never "a session that TALKS ABOUT the
    lane" either. The first build of this matcher qualified on any mention of a
    role, and it promptly returned the BRAIN's own session as the Scaffolder
    report — the brain quotes kickoff headers, lane branches and worktree paths
    constantly, and so does the sibling lane's kickoff ("the other lane owns the
    compiler"). Mentioning a role is not being it.

    So qualification requires evidence that this session was ADDRESSED as the
    lane, which is not something an observer's chatter can forge:

      * the kickoff header appears in a USER-authored turn — the human pasted
        `SCAFFOLDER — round NNNN ...` into this session, or
      * the session's own cwd is a worktree named for the role.

    Branch and worktree mentions anywhere in the transcript are recorded as
    corroboration only; they never qualify a session on their own.
    """
    strong: list[str] = []
    if _ROLE_HEADER_RE[role].search(user_blob):
        strong.append("kickoff header (user turn)")
    if cwd and role in Path(cwd).name:
        strong.append("session cwd")
    if not strong:
        return []
    weak: list[str] = []
    if re.search(rf"(?<![\w/]){re.escape(role)}/[\w.\-]+", full_blob):
        weak.append("lane branch")
    if re.search(rf"[\w.\-]*{re.escape(role)}[\w.\-]*queue\b", full_blob):
        weak.append("lane worktree path")
    return strong + weak


# --- driver ------------------------------------------------------------------


def recover(repo: Path, role: str, provider: str = "auto",
            since: datetime | None = None,
            stale_after: timedelta | None = None,
            now: datetime | None = None) -> tuple[Report | None, list[Report], list[str]]:
    now = now or datetime.now(UTC)
    common = git_common_dir(repo)
    scope = repo_scope(repo)
    roots = load_provider_roots(common)
    notes: list[str] = []

    report, why = read_inbox(common, role, stale_after, now)
    if report is not None:
        return report, [], [f"inbox: {why}"]
    notes.append(f"inbox: {why}")

    candidates: list[Report] = []
    order = ("codex", "claude") if provider == "auto" else (provider,)
    for name in order:
        if name == "antigravity":
            installed, detail = probe_antigravity(roots.get("antigravity", []))
            notes.append(f"antigravity: {detail}")
            continue
        scanner = {"codex": scan_codex, "claude": scan_claude}.get(name)
        if scanner is None:
            notes.append(f"{name}: unknown provider")
            continue
        hits = scanner(roots.get(name, []), role, scope, since)
        notes.append(f"{name}: {len(hits)} matching session(s)")
        candidates.extend(hits)

    if not candidates:
        return None, [], notes
    candidates.sort(key=lambda r: (r.ended or r.started), reverse=True)
    newest = candidates[0]
    rivals = [
        c for c in candidates[1:]
        if (c.ended or c.started)[:10] == (newest.ended or newest.started)[:10]
    ]
    return newest, rivals, notes


def _probe(repo: Path) -> int:
    common = git_common_dir(repo)
    roots = load_provider_roots(common)
    scope = repo_scope(repo)
    print("repo scope (worktrees + lane container):")
    for path in scope:
        print(f"  {path}")
    print("\nproviders:")
    for name in ("codex", "claude"):
        present = [p for p in roots.get(name, []) if p.is_dir()]
        status = "installed" if present else "not found"
        print(f"  {name:12s} {status}")
        for path in present:
            print(f"               {path}")
    installed, detail = probe_antigravity(roots.get("antigravity", []))
    print(f"  {'antigravity':12s} {'installed' if installed else 'not found'}")
    print(f"               {detail}")
    inbox = common / "agent-inbox"
    print(f"\ninbox: {inbox}")
    for role in ROLES:
        path = inbox / f"{role}-latest.md"
        print(f"  {role:12s} {'present' if path.is_file() else 'absent'}")
    return 0


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__.split("\n")[1])
    parser.add_argument("--role", choices=ROLES)
    parser.add_argument("--provider", default="auto",
                        choices=("auto", "codex", "claude", "antigravity"))
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    parser.add_argument("--since", help="ISO time; ignore sessions ending before it")
    parser.add_argument("--stale-days", type=float, default=2.0,
                        help="inbox artifact older than this is treated as absent")
    parser.add_argument("--json", action="store_true")
    parser.add_argument("--probe", action="store_true",
                        help="report what is installed on this machine")
    return parser


def main(argv: list[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    repo = args.repo.resolve()
    try:
        if args.probe:
            return _probe(repo)
        if not args.role:
            print("--role is required (or use --probe)", file=sys.stderr)
            return 2
        since = None
        if args.since:
            since = datetime.fromisoformat(args.since)
            if since.tzinfo is None:
                since = since.replace(tzinfo=UTC)
        stale = timedelta(days=args.stale_days) if args.stale_days > 0 else None
        report, rivals, notes = recover(
            repo, args.role, args.provider, since, stale,
        )
    except (RuntimeError, ValueError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 2

    if args.json:
        print(json.dumps({
            "role": args.role,
            "status": "ok" if report and not rivals else
                      ("ambiguous" if rivals else "unknown"),
            "report": report.to_dict() if report else None,
            "rivals": [r.to_dict() for r in rivals],
            "notes": notes,
        }, indent=2))
    else:
        for note in notes:
            print(f"[{note}]")
        print()
        if report is None:
            print(f"UNKNOWN — no report recoverable for role={args.role}.")
            print("This is NOT evidence that the lane did nothing. Ask for a "
                  "manual paste of the lane's final message.")
        else:
            print(report.render())
            if rivals:
                print(f"WARNING: {len(rivals)} other session(s) from the same "
                      "day also matched this role:")
                for rival in rivals:
                    print(f"  {rival.provider} {rival.session_id} "
                          f"ended={rival.ended} src={rival.source}")
                print("Narrow with --since or --provider before trusting this.")

    if report is None:
        return 3
    return 4 if rivals else 0


if __name__ == "__main__":
    raise SystemExit(main())
