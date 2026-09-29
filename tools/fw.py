#!/usr/bin/env python3
"""fw.py -- the one tool the agentic framework installs into a project.

Every command works the same on Windows, macOS and Linux, in any AI tool that
can run git and Python 3.9+. Standard library only.

    python3 tools/fw.py status [--offline] [--leaving]
        Where things stand: framework release, each round in flight seat by
        seat, what this machine has not pushed, the project checks, and one
        last line naming the owner's next action. Brain's first command.
    python3 tools/fw.py start --role ROLE --round ID [--review BRANCH]
        First command of a Worker or Verifier session. Puts the session on its
        own branch at the right commit, from any clone or checkout, and pushes
        that branch so the seat shows as started.
    python3 tools/fw.py report --role ROLE --round ID [--push]
        Checks docs/rounds/ID/ROLE.md has the required sections and passes the
        project checks, stamps it with the commit it describes, and commits
        (and pushes) only that file.
    python3 tools/fw.py delivery --round ID [--branch BRANCH]
        Whether a round's work is delivered, on which branch, at which commit.
    python3 tools/fw.py prompt --round ID --role ROLE [--message N]
        The exact prompt Brain gives the owner for one seat, header included.
    python3 tools/fw.py check
        The project hygiene checks. Exit 1 when one fails.

Add --cwd DIR to any command to run it against another checkout. If `python3`
is not found, use `py -3` (Windows) or `python`.

Why it is built this way: everything a later session needs travels through git
-- briefs and reports are committed files under docs/rounds/ -- so a round can
be started on one machine or tool and finished on another. Nothing here reads
a private folder, a chat transcript or a synced drive.
"""

from __future__ import annotations

import argparse
import datetime
import hashlib
import json
import os
import platform
import re
import subprocess
import sys
from pathlib import Path

ROUNDS = "docs/rounds"
MANIFEST = "docs/agents/framework.json"
STATE_DOC = "docs/state.md"
DEFAULT_STATE_WORDS = 1000
AGENTS_WORDS_WARNING = 2500
MERGE_RULES = ("owner-approves", "brain-merges")

ROUND_ID = re.compile(r"^[A-Za-z0-9][A-Za-z0-9._-]{0,79}$")
ROLE_NAME = re.compile(r"^[a-z][a-z0-9_-]{0,39}$")
WINDOWS_RESERVED = {"con", "prn", "aux", "nul"} | {
    f"{p}{n}" for p in ("com", "lpt") for n in range(1, 10)
}

#: Required report sections, by role. Any executor role (worker, builder, a
#: specialist) uses the default set.
REPORT_SECTIONS = {
    "verifier": ("Findings", "Not verified", "Verdict"),
}
DEFAULT_SECTIONS = ("Verified", "Not verified", "Changed", "Open questions")

HEADER_START = "<!-- fw-report"
HEADER_END = "-->"


class FwError(Exception):
    """A problem the user can act on; printed without a traceback."""


# --------------------------------------------------------------------------
# git plumbing


def git(args: list[str], cwd: Path, *, timeout: float | None = None,
        check: bool = False) -> subprocess.CompletedProcess:
    try:
        result = subprocess.run(
            ["git", *args], cwd=str(cwd), capture_output=True, text=True,
            encoding="utf-8", errors="replace", timeout=timeout,
        )
    except FileNotFoundError as exc:
        raise FwError("git is not installed or not on PATH") from exc
    except subprocess.TimeoutExpired:
        result = subprocess.CompletedProcess(["git", *args], 124, "", "timed out")
    if check and result.returncode != 0:
        raise FwError(f"git {' '.join(args)} failed: {result.stderr.strip()}")
    return result


def out(args: list[str], cwd: Path) -> str:
    return git(args, cwd, check=True).stdout.strip()


def ok(args: list[str], cwd: Path) -> bool:
    return git(args, cwd).returncode == 0


def repo_root(cwd: Path) -> Path:
    result = git(["rev-parse", "--show-toplevel"], cwd)
    if result.returncode != 0:
        raise FwError(f"{cwd} is not inside a git repository")
    return Path(result.stdout.strip())


def has_origin(root: Path) -> bool:
    return ok(["remote", "get-url", "origin"], root)


def fetch(root: Path) -> str | None:
    """Fetch origin; return a warning instead of failing when offline."""
    if not has_origin(root):
        return None
    result = git(["fetch", "--quiet", "--prune", "origin"], root, timeout=60)
    if result.returncode != 0:
        return f"could not fetch from origin ({result.stderr.strip() or 'offline?'}); using what this clone already has"
    return None


def default_branch(root: Path) -> str:
    result = git(["symbolic-ref", "--quiet", "--short", "refs/remotes/origin/HEAD"], root)
    if result.returncode == 0 and "/" in result.stdout:
        return result.stdout.strip().split("/", 1)[1]
    for name in ("main", "master"):
        if ok(["rev-parse", "--verify", "--quiet", f"refs/remotes/origin/{name}"], root) or ok(
            ["rev-parse", "--verify", "--quiet", f"refs/heads/{name}"], root
        ):
            return name
    return "main"


def base_ref(root: Path) -> str:
    name = default_branch(root)
    if ok(["rev-parse", "--verify", "--quiet", f"refs/remotes/origin/{name}"], root):
        return f"origin/{name}"
    return name


def current_branch(root: Path) -> str | None:
    result = git(["symbolic-ref", "--quiet", "--short", "HEAD"], root)
    return result.stdout.strip() if result.returncode == 0 else None


def is_ancestor(root: Path, older: str, newer: str) -> bool:
    return ok(["merge-base", "--is-ancestor", older, newer], root)


def dirty_paths(root: Path) -> list[str]:
    # Not out(): stripping the output would eat the first line's status column.
    lines = git(["status", "--porcelain", "--untracked-files=all"], root, check=True).stdout.splitlines()
    return [line[3:] for line in lines if line.strip()]


MAX_REFS = 2000


def branch_refs(root: Path) -> list[str]:
    """Local branches and origin's branches, for searching rounds (newest first)."""
    refs = out(
        ["for-each-ref", "--sort=-committerdate", "--format=%(refname:short)",
         "refs/heads", "refs/remotes/origin"], root
    ).splitlines()
    refs = [r for r in refs if r and r not in ("origin", "origin/HEAD")]
    if len(refs) > MAX_REFS:
        print(f"note: {len(refs)} branches; only the newest {MAX_REFS} were searched -- delete merged branches")
    return refs[:MAX_REFS]


def tree_files(root: Path, ref: str, path: str) -> dict[str, str]:
    """Map of file path -> blob id under ``path`` at ``ref``."""
    result = git(["ls-tree", "-r", ref, "--", path], root)
    files = {}
    for line in result.stdout.splitlines():
        meta, _, name = line.partition("\t")
        parts = meta.split()
        if len(parts) == 3 and parts[1] == "blob":
            files[name] = parts[2]
    return files


def show(root: Path, ref: str, path: str) -> str | None:
    result = git(["show", f"{ref}:{path}"], root)
    return result.stdout if result.returncode == 0 else None


def merged_by_content(root: Path, base: str, ref: str) -> bool:
    """Whether everything ``ref`` changed is already in ``base``, however it got
    there: a merge, a squash merge or a rebase. Ancestry alone misses the last
    two, which is how most hosts merge pull requests."""
    result = git(["merge-tree", "--write-tree", "--no-messages", base, ref], root)
    if result.returncode in (0, 1):
        tree = git(["rev-parse", f"{base}^{{tree}}"], root).stdout.strip()
        return result.returncode == 0 and result.stdout.split()[:1] == [tree]
    # git older than 2.38: every file the branch changed matches the base.
    fork = git(["merge-base", base, ref], root)
    if fork.returncode != 0:
        return False
    changed = git(["diff", "--name-only", "--no-renames", fork.stdout.strip(), ref], root).stdout.splitlines()
    return all(
        git(["rev-parse", "--verify", "--quiet", f"{base}:{name}"], root).stdout
        == git(["rev-parse", "--verify", "--quiet", f"{ref}:{name}"], root).stdout
        for name in changed
    )


def missing_submodules(root: Path) -> list[str]:
    return [
        line.split()[1] for line in git(["submodule", "status"], root).stdout.splitlines()
        if line.startswith("-") and len(line.split()) > 1
    ]


def submodule_warning(root: Path) -> str | None:
    missing = missing_submodules(root)
    if not missing:
        return None
    return (
        "submodule(s) not initialised here: " + ", ".join(missing)
        + " -- run: git submodule update --init (a search here would wrongly find those files missing)"
    )


# --------------------------------------------------------------------------
# names and reports


def check_round(value: str) -> str:
    if not ROUND_ID.match(value) or ".." in value:
        raise FwError(
            f"round id {value!r} must start with a letter or digit and use only "
            "letters, digits, '.', '_' or '-' (at most 80 characters)"
        )
    return value


def check_role(value: str) -> str:
    if not ROLE_NAME.match(value) or value in WINDOWS_RESERVED:
        raise FwError(
            f"role {value!r} must be lower-case letters, digits, '-' or '_', "
            "starting with a letter"
        )
    return value


def report_path(round_id: str, role: str) -> str:
    return f"{ROUNDS}/{round_id}/{role}.md"


def sections_for(role: str) -> tuple[str, ...]:
    return REPORT_SECTIONS.get(role, DEFAULT_SECTIONS)


def executor_names(root: Path) -> list[str]:
    """The project's executor seats: rows of AGENTS.md's role table whose card
    is the Worker card (for example Builder), else plain ``worker``."""
    names = []
    path = root / "AGENTS.md"
    text = path.read_text(encoding="utf-8", errors="replace") if path.is_file() else ""
    for line in text.splitlines():
        if line.startswith("|") and "roles/worker.md" in line:
            name = re.sub(r"[^a-z0-9_-]", "", line.strip("|").split("|")[0].lower())
            if ROLE_NAME.match(name) and name not in names and name != "verifier":
                names.append(name)
    return names or ["worker"]


def report_roles(root: Path) -> set[str]:
    return {"worker", "verifier", *executor_names(root)}


def report_role(name: str, roles: set[str], text: str | None) -> str | None:
    """The role a file directly in a round folder reports for, or None when it
    is the brief or an attachment. Only a file named for a role, or one that
    fw.py report stamped, is a report."""
    if "/" in name or not name.endswith(".md") or name in ("brief.md", "README.md"):
        return None
    role = name[:-3]
    if role in roles or (text is not None and parse_header(text) is not None):
        return role
    return None


class ReportFiles:
    """Decides which files under docs/rounds/<id>/ are reports, reading a
    file's content (once per blob) only when its name is not a role's."""

    def __init__(self, root: Path):
        self.root = root
        self.roles = report_roles(root)
        self.texts: dict[str, str] = {}

    def role(self, path: str, blob: str) -> str | None:
        parts = path.split("/")
        if len(parts) != 4:
            return None
        name = parts[3]
        text = None
        if name.endswith(".md") and name[:-3] not in self.roles:
            if blob not in self.texts:
                self.texts[blob] = git(["cat-file", "-p", blob], self.root).stdout
            text = self.texts[blob]
        return report_role(name, self.roles, text)


def project_name(root: Path) -> str:
    """The repository's name on origin (without .git), else the folder's."""
    result = git(["remote", "get-url", "origin"], root)
    url = result.stdout.strip().rstrip("/\\") if result.returncode == 0 else ""
    name = re.split(r"[/\\:]", url)[-1] if url else ""
    name = name[:-4] if name.endswith(".git") else name
    return name or root.name


def round_number(round_id: str) -> str:
    match = re.match(r"^(\d+)", round_id)
    return match.group(1) if match else round_id


def seat_line(root: Path, round_id: str, role: str) -> str:
    """The header of every prompt for this seat, and of its last reply line."""
    return f"{project_name(root)} · ROUND {round_number(round_id)} · {role.upper()}"


def parse_header(text: str) -> dict[str, str] | None:
    stripped = text.lstrip("\ufeff")
    if not stripped.startswith(HEADER_START):
        return None
    end = stripped.find(HEADER_END)
    if end < 0:
        return None
    fields = {}
    for line in stripped[len(HEADER_START):end].splitlines():
        key, sep, value = line.partition(":")
        if sep:
            fields[key.strip()] = value.strip()
    return fields


def strip_header(text: str) -> str:
    stripped = text.lstrip("\ufeff")
    if stripped.startswith(HEADER_START):
        end = stripped.find(HEADER_END)
        if end >= 0:
            return stripped[end + len(HEADER_END):].lstrip("\r\n")
    return stripped


def missing_sections(body: str, role: str) -> list[str]:
    """Required ``## `` sections that are absent or empty."""
    found: dict[str, list[str]] = {}
    current = None
    for line in body.splitlines():
        if line.startswith("## "):
            current = line[3:].strip().rstrip(":").lower()
            found.setdefault(current, [])
        elif current is not None and line.strip():
            found[current].append(line)
    return [name for name in sections_for(role) if not found.get(name.lower())]


def describe_os() -> str:
    system = platform.system() or "unknown"
    if system == "Darwin":
        return f"macOS {platform.mac_ver()[0]}".strip()
    if system == "Linux":
        try:
            info = platform.freedesktop_os_release()  # Python 3.10+
            return info.get("PRETTY_NAME", "Linux")
        except (AttributeError, OSError):
            return "Linux"
    return f"{system} {platform.release()}".strip()


def python_hint() -> str:
    return "py -3 tools/fw.py" if os.name == "nt" else "python3 tools/fw.py"


# --------------------------------------------------------------------------
# report


def report_problems(root: Path, rel: str, text: str) -> list[str]:
    """What in a report would fail the project's checks once committed: the
    personal-data check fw.py check runs on round folders, and relative links
    that lead nowhere from the report's folder (a quoted sentence keeps links
    written for another folder, and a project's link test then fails)."""
    problems = []
    folder = (root / rel).parent
    for number, line in enumerate(text.splitlines(), 1):
        what = personal_data(line)
        if what:
            problems.append(f"{rel}:{number} contains {what}")
        for target in re.findall(r"\]\(([^)#\s]+)", line):
            if "://" not in target and not target.startswith("mailto:") and not (folder / target).exists():
                problems.append(f"{rel}:{number} links to {target}, which does not exist relative to {ROUNDS}/<id>/")
    return problems


def run_report_check(root: Path) -> str | None:
    """Run the fast check a project names in docs/agents/framework.json,
    settings.report_check, on the tree about to be committed. Returns what
    to show when it fails, else None."""
    try:
        command = ((load_manifest(root) or {}).get("settings") or {}).get("report_check")
    except FwError:
        return None
    if not command:
        return None
    try:
        result = subprocess.run(command, shell=True, cwd=str(root), capture_output=True, text=True,
                                encoding="utf-8", errors="replace", timeout=900)
    except subprocess.TimeoutExpired:
        return f"  {command}: still running after 15 minutes"
    if result.returncode == 0:
        return None
    tail = (result.stdout + result.stderr).strip().splitlines()[-15:]
    return f"  {command} -> exit {result.returncode}\n" + "\n".join(f"    {line}" for line in tail)


def cmd_report(root: Path, role: str, round_id: str, push: bool) -> int:
    check_role(role)
    check_round(round_id)
    rel = report_path(round_id, role)
    path = root / rel
    if not path.is_file():
        raise FwError(
            f"write your report to {rel} first (sections: "
            f"{', '.join('## ' + s for s in sections_for(role))}), then run this again"
        )
    branch = current_branch(root)
    if branch is None:
        raise FwError("HEAD is detached; switch to your own branch before reporting")
    if branch == default_branch(root):
        raise FwError(f"you are on {branch}; reports are committed on your own branch, never on the default branch")
    others = [p for p in dirty_paths(root) if p.replace("\\", "/") != rel]
    if others:
        raise FwError(
            "commit (or discard) your other changes first -- the report must "
            "describe committed work. Uncommitted: " + ", ".join(others[:10])
        )
    written = path.read_text(encoding="utf-8")
    body = strip_header(written)
    missing = missing_sections(body, role)
    if missing:
        raise FwError(
            f"{rel} is missing (or has empty) sections: "
            + ", ".join("## " + m for m in missing)
            + ". Write 'None.' in a section that genuinely has nothing."
        )
    problems = report_problems(root, rel, written)
    if problems:
        raise FwError(
            f"{rel} would fail the project's checks, so it was not committed:\n  "
            + "\n  ".join(problems)
            + "\nDescribe a finding without repeating it: give the file, the line and the kind of "
            "data (for example 'docs/setup.md:12 contains a home-folder path'), never the value itself. "
            "Write a path you mention as code, not as a link."
        )
    head = out(["rev-parse", "HEAD"], root)
    stamp = datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")  # noqa: UP017 -- datetime.UTC needs 3.11
    header = "\n".join([
        HEADER_START,
        f"round: {round_id}",
        f"role: {role}",
        f"branch: {branch}",
        f"head: {head}",
        f"os: {describe_os()}",
        f"python: {platform.python_version()}",
        f"written: {stamp}",
        HEADER_END,
        "",
    ])
    path.write_bytes((header + body.replace("\r\n", "\n")).encode("utf-8"))
    failed = run_report_check(root)
    if failed:
        path.write_text(written, encoding="utf-8")
        raise FwError(
            f"{rel} was not committed: with it, the project's report check fails.\n{failed}\n"
            "Quote text in a report as code, without live relative links or personal paths, then run this again."
        )
    git(["add", "--", rel], root, check=True)
    commit = git(["commit", "--quiet", "-m", f"Report for round {round_id} ({role})", "--", rel], root)
    if commit.returncode != 0:
        raise FwError(f"could not commit {rel}: {commit.stderr.strip() or commit.stdout.strip()}")
    sha = out(["rev-parse", "HEAD"], root)
    print(f"report committed: {rel} at {sha[:12]}; it describes {head[:12]} on {branch}")
    if push:
        if not has_origin(root):
            raise FwError("no 'origin' remote to push to; the report is committed locally")
        pushed = git(["push", "--quiet", "-u", "origin", branch], root, timeout=120)
        if pushed.returncode != 0:
            raise FwError(
                "the report is committed locally but NOT pushed: "
                + (pushed.stderr.strip() or "push failed")
            )
        print(f"pushed {branch} to origin")
        print(f"end your final reply with: {seat_line(root, round_id, role)} · DONE — report pushed at {sha[:12]}")
        print("  (or STOPPED or BLOCKED instead of DONE, with the reason, if you stopped early)")
    else:
        print("not pushed yet: push your branch so the round can continue from any machine")
    return 0


# --------------------------------------------------------------------------
# rounds


def round_files(root: Path, ref: str, round_id: str) -> dict[str, str]:
    return tree_files(root, ref, f"{ROUNDS}/{round_id}")


class RoundIndex:
    """Every round folder on the default branch and on every other branch,
    read once, so the questions below cost one ``ls-tree`` per branch."""

    def __init__(self, root: Path):
        self.root = root
        self.base = base_ref(root)
        self.base_files = tree_files(root, self.base, ROUNDS)
        skip = (self.base, default_branch(root))
        self.refs = [r for r in branch_refs(root) if r not in skip]
        self.files = {ref: tree_files(root, ref, ROUNDS) for ref in self.refs}
        self.reports = ReportFiles(root)
        self.texts: dict[str, str] = {}

    def text(self, blob: str) -> str:
        if blob not in self.texts:
            self.texts[blob] = git(["cat-file", "-p", blob], self.root).stdout
        return self.texts[blob]

    def ids(self) -> set[str]:
        found = set()
        for files in [self.base_files, *self.files.values()]:
            found.update(p.split("/")[2] for p in files if p.count("/") >= 3)
        return found

    def brief(self, round_id: str) -> str | None:
        path = f"{ROUNDS}/{round_id}/brief.md"
        order = [f"origin/brain/{round_id}", f"brain/{round_id}"]
        order += [r for r in self.refs if r not in order]
        for ref in order:
            blob = self.files.get(ref, {}).get(path)
            if blob:
                return self.text(blob)
        blob = self.base_files.get(path)
        return self.text(blob) if blob else None

    def superseded(self) -> dict[str, str]:
        """Rounds a later brief names under ``Supersedes:``, mapped to that brief's round."""
        ids = self.ids()
        found: dict[str, str] = {}
        for newer in sorted(ids):
            path = f"{ROUNDS}/{newer}/brief.md"
            blobs = {files.get(path) for files in [self.base_files, *self.files.values()]} - {None}
            for blob in sorted(blobs):
                match = re.search(r"^Supersedes:[ \t]*(.*)$", self.text(blob), re.M)
                if not match:
                    continue
                value = match.group(1)
                named = [o for o in ids if o != newer and re.search(rf"(?<![\w-]){re.escape(o)}(?![\w-])", value)]
                if not named:  # "Supersedes: 031" names a round by its number
                    for number in re.findall(r"(?<![\w.-])(\d+)(?![\w-])", value):
                        same = [o for o in ids if o != newer and round_number(o) == number]
                        named += same if len(same) == 1 else []
                for older in named:
                    found.setdefault(older, newer)
        return found

    def branches_with_reports(self, round_id: str) -> list[str]:
        """Branches carrying report files for ``round_id`` that the default branch lacks."""
        prefix = f"{ROUNDS}/{round_id}/"
        found = []
        for ref, files in self.files.items():
            if any(
                path.startswith(prefix) and self.base_files.get(path) != blob and self.reports.role(path, blob)
                for path, blob in files.items()
            ):
                found.append(ref)
        return dedupe_by_tip(self.root, found)

    def roles_on(self, files: dict[str, str], round_id: str) -> set[str]:
        prefix = f"{ROUNDS}/{round_id}/"
        return {
            role for path, blob in files.items()
            if path.startswith(prefix) and (role := self.reports.role(path, blob))
        }


def dedupe_by_tip(root: Path, refs: list[str]) -> list[str]:
    """One ref per distinct tip, preferring the remote copy of a local branch."""
    tips: dict[str, list[str]] = {}
    for ref in refs:
        tips.setdefault(out(["rev-parse", ref], root), []).append(ref)
    unique = []
    for same in tips.values():
        remote = [r for r in same if r.startswith("origin/")]
        unique.append((remote or same)[0])
    return sorted(unique)


def evaluate_branch(root: Path, ref: str, round_id: str, reports: ReportFiles | None = None) -> dict:
    """Check every report for ``round_id`` on ``ref``.

    A report is valid when its header names this round and its own role, the
    commit it describes is an ancestor of the branch tip, and nothing but this
    round's own folder changed after that commit. Otherwise the branch moved on
    after the report and the report no longer describes it. Files in the round
    folder that are not reports (attachments) are not judged.
    """
    reports = reports or ReportFiles(root)
    tip = out(["rev-parse", ref], root)
    prefix = f"{ROUNDS}/{round_id}/"
    result = {"ref": ref, "tip": tip, "reports": {}, "problems": [], "stale": set()}
    for path, blob in sorted(round_files(root, ref, round_id).items()):
        role = reports.role(path, blob)
        if role is None:
            continue
        header = parse_header(show(root, ref, path) or "")
        if header is None:
            result["problems"].append(f"{path} has no fw.py stamp; the {role} must run fw.py report")
            result["stale"].add(role)
            continue
        head = header.get("head", "")
        if header.get("round") != round_id or header.get("role") != role:
            result["problems"].append(
                f"{path} is stamped for round {header.get('round')!r}, role {header.get('role')!r}; "
                f"the {role} must rewrite it for round {round_id}"
            )
            result["stale"].add(role)
            continue
        if not head or not ok(["cat-file", "-e", f"{head}^{{commit}}"], root) or not is_ancestor(root, head, tip):
            result["problems"].append(f"{path} describes {head[:12] or '?'}, which is not part of {ref}")
            result["stale"].add(role)
            continue
        # Only other seats' reports and attachments may change after a report;
        # a changed brief changes what the report was judged against.
        changed = [
            p for p in out(["diff", "--name-only", head, tip], root).splitlines()
            if p and not (p.startswith(prefix) and p not in (prefix + "brief.md", prefix + "README.md"))
        ]
        if changed:
            result["problems"].append(
                f"{ref} changed after the {role} report ({', '.join(changed[:5])}); "
                f"the report describes an older commit, so the {role} must rewrite it"
            )
            result["stale"].add(role)
            continue
        result["reports"][role] = header
    return result


def newest_only(root: Path, refs: list[str]) -> list[str]:
    """Drop refs whose tip is already contained in another ref's tip."""
    tips = {ref: out(["rev-parse", ref], root) for ref in refs}
    keep = []
    for ref in refs:
        if not any(
            other != ref and tips[other] != tips[ref] and is_ancestor(root, tips[ref], tips[other])
            for other in refs
        ):
            keep.append(ref)
    return keep


def flag_outdated_reviews(root: Path, evaluated: list[dict]) -> None:
    """A review is outdated when newer executor work for the round exists
    elsewhere, or another review is of a commit that descends from its own (a
    re-review, even after a fix that only rewrote the executor's report)."""
    for entry in evaluated:
        review = entry["reports"].get("verifier")
        if not review:
            continue
        mine = review.get("head", "")
        for other in evaluated:
            if other is entry:
                continue
            for role, header in other["reports"].items():
                head = header.get("head", "")
                newer = (is_ancestor(root, mine, head) and head != mine) if role == "verifier" else (
                    not is_ancestor(root, head, mine))
                if newer and "verifier" not in entry["stale"]:
                    what = "a newer review" if role == "verifier" else f"newer {role} work"
                    entry["problems"].append(
                        f"{what} is on {other['ref']} ({head[:12]}); this review is of an older commit"
                    )
                    entry["stale"].add("verifier")


def most_complete(root: Path, evaluated: list[dict]) -> tuple[dict | None, str]:
    """The delivered branch to judge, or None and why. Among several, only one
    whose reviewed commit (or tip) descends from every other's is chosen;
    never one picked by name order."""
    delivered = [e for e in evaluated if e["reports"] and not e["problems"]]
    if len(delivered) <= 1:
        return (delivered or [None])[0], ""
    def point(entry: dict) -> str:
        return entry["reports"].get("verifier", {}).get("head") or entry["tip"]
    for entry in delivered:
        if all(other is entry or is_ancestor(root, point(other), point(entry)) for other in delivered):
            return entry, ""
    return None, (
        "no single branch to judge: " + ", ".join(e["ref"] for e in delivered)
        + " are each delivered, and none holds work that descends from the others'. Ask Brain which is the round."
    )


def evaluate_round(index: RoundIndex, round_id: str) -> list[dict]:
    """Every branch holding the newest reports for a round, most complete first."""
    candidates = newest_only(index.root, index.branches_with_reports(round_id))
    evaluated = [evaluate_branch(index.root, ref, round_id, index.reports) for ref in candidates]
    flag_outdated_reviews(index.root, evaluated)
    evaluated.sort(key=lambda e: (len(e["reports"]), -len(e["problems"])), reverse=True)
    return evaluated


def superseded_message(round_id: str, newer: str) -> str:
    return (
        f"round {round_id} was superseded by round {newer} (its brief says so): nothing more is "
        f"due for {round_id}, and none of its reports needs rewriting. Work on {newer} instead."
    )


def cmd_delivery(root: Path, round_id: str, branch: str | None, *, quiet_fetch: bool = False) -> int:
    check_round(round_id)
    warning = fetch(root)
    if warning and not quiet_fetch:
        print(f"note: {warning}")
    index = RoundIndex(root)
    newer = index.superseded().get(round_id)
    if newer and not branch:
        print(superseded_message(round_id, newer))
        return 1
    if branch:
        if not ok(["rev-parse", "--verify", "--quiet", branch], root):
            if not ok(["rev-parse", "--verify", "--quiet", f"origin/{branch}"], root):
                print(f"not delivered yet: no branch {branch!r} here or on origin")
                return 1
            branch = f"origin/{branch}"
        evaluated = [evaluate_branch(root, branch, round_id, index.reports)]
        flag_outdated_reviews(root, evaluated)
    else:
        evaluated = evaluate_round(index, round_id)
    if not evaluated:
        merged = round_files(root, index.base, round_id)
        if any(index.reports.role(p, b) for p, b in merged.items()):
            print(f"round {round_id} is already merged into {index.base}")
            return 0
        print(f"not delivered yet: no branch carries a report for round {round_id}")
        return 1
    for entry in evaluated:
        state = "delivered" if entry["reports"] and not entry["problems"] else "NOT delivered"
        print(f"{entry['ref']} ({entry['tip'][:12]}): {state}")
        for role, header in sorted(entry["reports"].items()):
            print(
                f"  {role}: report describes {header.get('head', '')[:12]} "
                f"(written {header.get('written', '?')} on {header.get('os', '?')})"
            )
        for problem in entry["problems"]:
            print(f"  problem: {problem}")
    best, why = most_complete(root, evaluated)
    if why:
        print(why)
    if best is None:
        return 1
    if len(evaluated) > 1:
        print(f"most complete: {best['ref']}")
    return 0


# --------------------------------------------------------------------------
# start


def locate_brief(root: Path, round_id: str) -> str | None:
    """The commit holding this round's brief: HEAD, brain/<id>, or any branch."""
    path = f"{ROUNDS}/{round_id}/brief.md"
    candidates = ["HEAD", f"origin/brain/{round_id}", f"brain/{round_id}", base_ref(root)]
    candidates += [r for r in branch_refs(root) if r not in candidates]
    for ref in candidates:
        if ok(["rev-parse", "--verify", "--quiet", ref], root) and show(root, ref, path) is not None:
            return ref
    return None


def resume_point(index: RoundIndex, role: str, round_id: str) -> tuple[str, str]:
    """Where an executor starts: its own earlier pushed work, or else the brief.

    Earlier work is a branch named <role>/<round>, or any branch carrying this
    role's report for the round, but not a branch another seat has built on.
    """
    root = index.root
    prefix = f"{ROUNDS}/{round_id}/"
    own = []
    for ref, files in index.files.items():
        added = {p: b for p, b in files.items() if p.startswith(prefix) and index.base_files.get(p) != b}
        roles = index.roles_on(added, round_id)
        named = ref in (f"{role}/{round_id}", f"origin/{role}/{round_id}")
        if (named or role in roles) and not roles - {role}:
            own.append(ref)
    own = newest_only(root, own)
    tips = {out(["rev-parse", r], root) for r in own}
    if len(tips) > 1:
        raise FwError(
            "more than one branch holds earlier work for this seat and round: "
            + ", ".join(own) + ". Ask Brain which to continue."
        )
    if own:
        remote = [r for r in own if r.startswith("origin/")]
        source = (remote or own)[0]
        print(f"  continuing earlier work from {source}")
        return source, out(["rev-parse", source], root)
    named = f"origin/{role}/{round_id}"
    if ok(["rev-parse", "--verify", "--quiet", named], root):
        print(f"  warning: {named} exists but another seat has built on it, so it was not continued")
    source = locate_brief(root, round_id)
    if source is None:
        raise FwError(
            f"no brief for round {round_id}: expected {ROUNDS}/{round_id}/brief.md "
            f"on brain/{round_id} or the default branch. Ask Brain to push it."
        )
    return source, out(["rev-parse", source], root)


def free_review_branch(root: Path, round_id: str, target: str) -> str:
    """verifier/<round>, or verifier/<round>-2, -3 ... when an earlier review of
    older work already uses the name. A branch that already contains the
    reviewed commit is this review, resumed."""
    name, number = f"verifier/{round_id}", 1
    while True:
        existing = [r for r in (f"origin/{name}", name) if ok(["rev-parse", "--verify", "--quiet", r], root)]
        if not existing or all(is_ancestor(root, target, r) for r in existing):
            return name
        number += 1
        name = f"verifier/{round_id}-{number}"


def publish_start(root: Path, branch: str, wanted: str) -> None:
    """Push the seat's branch at once, so status can tell a seat that started
    from one that was never sent. A tool-named branch also gives the seat's own
    name to the same commit, unless origin already has that name. Best effort:
    some cloud tools may push only their own branch."""
    if not has_origin(root):
        return
    pushes = [["push", "--quiet", "-u", "origin", branch]]
    if branch != wanted and not ok(["rev-parse", "--verify", "--quiet", f"origin/{wanted}"], root):
        pushes.append(["push", "--quiet", "origin", f"HEAD:refs/heads/{wanted}"])
    for args in pushes:
        pushed = git(args, root, timeout=60)
        if pushed.returncode != 0:
            reason = (pushed.stderr.strip().splitlines() or ["push failed"])[-1]
            print(f"  note: could not push {args[-1]} ({reason}); status shows this seat as "
                  "started once its branch is pushed")
            return


def cmd_start(root: Path, role: str, round_id: str, review: str | None) -> int:
    check_role(role)
    check_round(round_id)
    if role == "brain":
        return cmd_status(root, offline=False, leaving=False)
    warning = fetch(root)
    if warning:
        print(f"note: {warning}")
    dirty = dirty_paths(root)
    if dirty:
        raise FwError(
            "this checkout has uncommitted changes, so it is not a clean place to "
            "start a seat: " + ", ".join(dirty[:10])
            + ". Start in a fresh clone or checkout, or ask Brain."
        )
    index = RoundIndex(root)
    newer = index.superseded().get(round_id)
    if newer:
        raise FwError(superseded_message(round_id, newer) + " Ask Brain for that round's prompt.")
    if role == "verifier":
        if review:
            refs = [review] if ok(["rev-parse", "--verify", "--quiet", review], root) else [f"origin/{review}"]
        else:
            # Branches carrying an executor report and no review yet. A branch
            # that already holds a verifier report is an earlier review.
            refs = []
            for ref in index.branches_with_reports(round_id):
                reports = evaluate_branch(root, ref, round_id, index.reports)["reports"]
                if "verifier" not in reports and any(k != "verifier" for k in reports):
                    refs.append(ref)
        if not refs:
            print(f"not delivered yet: no executor report for round {round_id} on any branch")
            return 1
        if len(refs) > 1:
            print("more than one branch carries this round's work; rerun with --review <branch>:")
            for ref in refs:
                print(f"  {ref}")
            return 1
        entry = evaluate_branch(root, refs[0], round_id, index.reports)
        executor = {k: v for k, v in entry["reports"].items() if k != "verifier"}
        if not executor or entry["problems"]:
            print(f"not delivered yet on {refs[0]}:")
            for problem in entry["problems"]:
                print(f"  {problem}")
            return 1
        target = entry["tip"]
        source = refs[0]
    else:
        source, target = resume_point(index, role, round_id)

    branch = current_branch(root)
    wanted = f"{role}/{round_id}"
    if role == "verifier":
        wanted = free_review_branch(root, round_id, target)
    if branch is None or branch == default_branch(root):
        if ok(["rev-parse", "--verify", "--quiet", f"refs/heads/{wanted}"], root):
            git(["switch", "--quiet", wanted], root, check=True)
        else:
            git(["switch", "--quiet", "-c", wanted, target], root, check=True)
        branch = wanted
    head = out(["rev-parse", "HEAD"], root)
    if head != target:
        if is_ancestor(root, head, target):
            git(["merge", "--quiet", "--ff-only", target], root, check=True)
        elif is_ancestor(root, target, head):
            pass  # this branch already holds the starting point and more
        elif not out(["rev-list", "HEAD", "--not", base_ref(root), target], root):
            # A branch with no work of its own (typically named by the tool,
            # cut from a newer default branch): move it to the starting point.
            git(["reset", "--quiet", "--keep", target], root, check=True)
        else:
            raise FwError(
                f"branch {branch} has commits of its own and has diverged from the round's "
                f"starting point {target[:12]} ({source}). Start from a fresh branch, or ask Brain."
            )
    head = out(["rev-parse", "HEAD"], root)
    print(f"seat ok: {role}, round {round_id}, branch {branch} at {head[:12]}")
    if not branch.startswith(f"{role}/"):
        print(f"  (branch name chosen by your tool rather than {wanted}; that is fine -- your report records it)")
    publish_start(root, branch, wanted)
    submodules = submodule_warning(root)
    if submodules:
        print(f"  warning: {submodules}")
    print(f"  brief: {ROUNDS}/{round_id}/brief.md")
    if role == "verifier":
        executor_reports = ", ".join(
            report_path(round_id, r) for r in evaluate_branch(root, "HEAD", round_id)["reports"] if r != "verifier"
        )
        print(f"  reviewing exactly {target} from {source}")
        print(f"  do not open {executor_reports} until your first pass is finished")
    print(f"  finish with: write {report_path(round_id, role)}, then {python_hint()} report --role {role} --round {round_id} --push")
    return 0


# --------------------------------------------------------------------------
# prompt


def public_url(root: Path) -> str | None:
    """origin's address without any credentials in it; GitHub SSH as https."""
    result = git(["remote", "get-url", "origin"], root)
    if result.returncode != 0:
        return None
    url = re.sub(r"^(https?://)[^/@]+@", r"\1", result.stdout.strip())
    url = re.sub(r"^git@github\.com:", "https://github.com/", url)
    return url[:-4] if url.endswith(".git") else url


def review_suffix(root: Path, round_id: str) -> str:
    """'' for the first review of a round, '-2', '-3' ... for later ones, so a
    re-review's checkout does not collide with the earlier review's folder.
    Numbered like the review branches: a review branch that holds no
    verifier report yet is the review in progress."""
    number, name, last = 1, f"verifier/{round_id}", None
    while any(ok(["rev-parse", "--verify", "--quiet", r], root) for r in (f"origin/{name}", name)):
        last, number = number, number + 1
        name = f"verifier/{round_id}-{number}"
    if last is None:
        return ""
    name = f"verifier/{round_id}" + (f"-{last}" if last > 1 else "")
    ref = f"origin/{name}" if ok(["rev-parse", "--verify", "--quiet", f"origin/{name}"], root) else name
    reviewed = show(root, ref, report_path(round_id, "verifier")) is not None
    current = last + 1 if reviewed else last
    return f"-{current}" if current > 1 else ""


def seat_prompt(root: Path, round_id: str, role: str, message: int = 1) -> str:
    """The prompt Brain gives the owner for one seat. The first line is the
    header the owner compares across chats; the seat ends its last reply with
    the same header and its outcome."""
    header = seat_line(root, round_id, role) + (f" · message {message}" if message > 1 else "")
    docs = "docs/agents" if (root / "docs/agents/FRAMEWORK.md").is_file() or not (root / "framework/FRAMEWORK.md").is_file() else "framework"
    card = "verifier" if role == "verifier" else "worker"
    url = public_url(root)
    project = project_name(root)
    number = round_number(round_id)
    folder = f"{role}-{number}" + (review_suffix(root, round_id) if role == "verifier" else "")
    where = (
        f"Work inside this project's folder on this machine (clone {url} if it is not here): "
        if url else "Work inside this project's folder on this machine: "
    )
    body = (
        f"You are the {role.capitalize()} for {project}, round {round_id}. {where}from its main checkout "
        f"run git worktree add --detach .worktrees/{folder} origin/{default_branch(root)} and work in "
        "that folder, never in a copy beside the project. In a cloud workspace, work in the clone it gives you."
        f"\n\nIn that folder, first run python3 tools/fw.py start --role {role} --round {round_id} (use py -3 "
        "or python if python3 is not found) and stop if it fails. Then read AGENTS.md, "
        f"{docs}/FRAMEWORK.md, {docs}/roles/{card}.md and {ROUNDS}/{round_id}/brief.md, and carry out the brief."
        f"\n\nFinish, even if you stop early, by writing {report_path(round_id, role)} and running python3 "
        f"tools/fw.py report --role {role} --round {round_id} --push. End your final reply with exactly one "
        f"line: {seat_line(root, round_id, role)} · DONE — report pushed at <commit>, or STOPPED or BLOCKED "
        "with the reason."
    )
    return f"{header}\n\n{body}"


def cmd_prompt(root: Path, round_id: str, role: str, message: int) -> int:
    check_round(round_id)
    check_role(role)
    if role == "brain":
        raise FwError("Brain's prompt is paste 1 in the framework's FRAMEWORK.md ('The round')")
    if message < 1:
        raise FwError("--message counts from 1")
    newer = RoundIndex(root).superseded().get(round_id)
    if newer:
        raise FwError(superseded_message(round_id, newer))
    print(seat_prompt(root, round_id, role, message))
    if locate_brief(root, round_id) is None:
        print(f"\nnote: no brief for round {round_id} is on any branch here yet; push it before sending this",
              file=sys.stderr)
    return 0


# --------------------------------------------------------------------------
# status


def sha256_file(path: Path) -> str:
    data = path.read_bytes().replace(b"\r\n", b"\n")
    return hashlib.sha256(data).hexdigest()


def load_manifest(root: Path) -> dict | None:
    path = root / MANIFEST
    if not path.is_file():
        return None
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except (OSError, ValueError) as exc:
        raise FwError(f"{MANIFEST} is unreadable: {exc}") from exc


def version_tuple(text: str) -> tuple[int, ...] | None:
    match = re.match(r"^v?(\d+)\.(\d+)\.(\d+)$", text.strip())
    return tuple(int(x) for x in match.groups()) if match else None


def latest_release(repository: str) -> tuple[str | None, str | None]:
    result = git(["ls-remote", "--tags", "--refs", repository], Path.cwd(), timeout=30)
    if result.returncode != 0:
        return None, (result.stderr.strip().splitlines() or ["unreachable"])[-1]
    versions = []
    for line in result.stdout.splitlines():
        tag = line.rpartition("refs/tags/")[2]
        parsed = version_tuple(tag)
        if parsed:
            versions.append((parsed, tag.lstrip("v")))
    if not versions:
        return None, "no release tags found"
    return max(versions)[1], None


def framework_lines(root: Path, offline: bool) -> tuple[list[str], str | None]:
    manifest = load_manifest(root)
    if manifest is None:
        if (root / "VERSION").is_file() and (root / "framework" / "FRAMEWORK.md").is_file():
            version = (root / "VERSION").read_text(encoding="utf-8").strip()
            return [f"this is the framework repository itself, at release {version}"], None
        if (root / "docs/agents/CONSTITUTION.md").is_file():
            return [
                "2.x framework layout with no manifest: this project predates release 3.0.0.",
                "Plan an update round (the framework's CHANGELOG, release 3.0.0, says how).",
            ], "3.0.0 or later"
        return ["no framework manifest (docs/agents/framework.json) -- not adopted, or damaged"], None
    info = manifest.get("framework", {})
    pinned = info.get("release", "?")
    repository = info.get("repository", "")
    lines = [f"pinned to agentic-framework {pinned} ({repository or 'repository unknown'})"]
    newer = None
    if offline or not repository:
        lines.append("newer releases: not checked")
    else:
        latest, problem = latest_release(repository)
        if latest is None:
            lines.append(f"newer releases: unknown ({problem}) -- carry on")
        else:
            here, there = version_tuple(pinned), version_tuple(latest)
            if here and there and there > here:
                kind = ("major (contracts changed): a Tier 2 update round, before the next round"
                        if there[0] > here[0] else "minor or patch: a light Tier 1 update round")
                lines.append(f"newer release available: {latest} -- {kind}; Brain proposes it")
                newer = latest
            else:
                lines.append(f"up to date with the latest release ({latest})")
    edited = []
    for rel, entry in sorted(manifest.get("files", {}).items()):
        if entry.get("kind") != "copy" or entry.get("deleted"):
            continue
        path = root / rel
        if not path.is_file():
            edited.append(f"{rel} (missing)")
        elif sha256_file(path) != entry.get("sha256"):
            edited.append(rel)
    if edited:
        lines.append("framework files changed locally (project rules belong in AGENTS.md): " + ", ".join(edited))
    return lines, newer


def merge_rule(root: Path) -> str | None:
    path = root / "AGENTS.md"
    if not path.is_file():
        return None
    match = re.search(r"^\**Merge rule:?\**:?\s*`?([a-z-]+)`?", path.read_text(encoding="utf-8"), re.M)
    return match.group(1) if match else None


def expected_seats(index: RoundIndex, round_id: str, tier: int | None, evaluated: list[dict]) -> list[str]:
    """Tier 2: executor and Verifier; Tier 1: executor; Tier 0: none. The
    executor is the role that reported or started, else the project's first."""
    if tier == 0:
        return []
    names = executor_names(index.root)
    seen = [r for e in evaluated for r in [*e["reports"], *e["stale"]] if r != "verifier"]
    seen += [n for n in names for r in index.refs if r in (f"{n}/{round_id}", f"origin/{n}/{round_id}")]
    seats = [(seen or names)[0]]
    return seats if tier == 1 else [*seats, "verifier"]


def seat_state(index: RoundIndex, round_id: str, role: str, evaluated: list[dict]) -> tuple[str, str]:
    best, _why = most_complete(index.root, evaluated)
    valid = [e for e in evaluated if role in e["reports"] and role not in e["stale"]]
    valid.sort(key=lambda e: e is not best)
    if valid:
        return "reported", f"reported at {valid[0]['reports'][role].get('head', '')[:12]}"
    if any(role in e["stale"] for e in evaluated):
        return "stale", "stale -- its report no longer describes its branch"
    names = (f"{role}/{round_id}", f"origin/{role}/{round_id}")
    started = [
        r for r in index.refs
        if r in names or (role == "verifier" and re.match(rf"^(origin/)?verifier/{re.escape(round_id)}-\d+$", r))
    ]
    if started:
        return "started", f"started on {sorted(started)[-1]}, no report yet"
    return "not started", "not started"


def next_action(round_id: str, seats: list[tuple[str, str, str]]) -> tuple[str, str]:
    for role, state, _detail in seats:
        name = role.capitalize()
        if state == "not started":
            return "send", (f"send the {name} prompt for round {round_id} (Brain prints it with: "
                            f"python3 tools/fw.py prompt --round {round_id} --role {role})")
        if state == "started":
            return "wait", (f"wait for the {name} of round {round_id} to finish; if its chat has stopped, "
                            "send it the same prompt again as message 2")
        if state == "stale":
            return "ask", f"ask Brain what to send the {name} of round {round_id}: its report is out of date"
    if not seats:
        return "ask", f"ask Brain to merge round {round_id}: it is Tier 0, so no seat works on it"
    return "ask", f"ask Brain to judge round {round_id}: every seat has reported"


def rounds_lines(root: Path) -> tuple[list[str], str]:
    index = RoundIndex(root)
    superseded = index.superseded()
    changed: set[str] = set()
    for files in index.files.values():
        changed.update(
            path.split("/")[2] for path, blob in files.items()
            if path.count("/") >= 3 and index.base_files.get(path) != blob
        )
    lines, actions = [], []
    for round_id in sorted(changed):
        if round_id in superseded:
            lines.append(f"superseded: {round_id}, by {superseded[round_id]} -- not in flight")
            continue
        brief = index.brief(round_id)
        match = re.search(r"^Tier:\s*(\d)", brief or "", re.M)
        tier = int(match.group(1)) if match else None
        evaluated = evaluate_round(index, round_id)
        expected = expected_seats(index, round_id, tier, evaluated)
        on_base = index.roles_on(index.base_files, round_id)
        if f"{ROUNDS}/{round_id}/brief.md" in index.base_files and set(expected) <= on_base:
            continue  # merged; a leftover branch only differs in detail
        seats = [(role, *seat_state(index, round_id, role, evaluated)) for role in expected]
        label = f"Tier {tier}" if tier is not None else "no Tier line in its brief, so both seats are expected"
        lines.append(f"in flight: {round_id} ({label})")
        lines.extend(f"  {role}: {detail}" for role, _state, detail in seats)
        actions.append(next_action(round_id, seats))
    if not actions:
        lines.insert(0, "nothing in flight")
    on_base = sorted(index.base_files and {p.split("/")[2] for p in index.base_files if p.count("/") >= 3})
    if on_base:
        lines.append(f"{len(on_base)} round(s) merged under {ROUNDS}/, latest by name: {on_base[-1]}")
    legacy = root / "docs/briefs/active.md"
    if legacy.is_file():
        match = re.search(r"Brief-ID:\s*(\S+)", legacy.read_text(encoding="utf-8"))
        lines.append(
            "legacy docs/briefs/active.md present"
            + (f" (Brief-ID {match.group(1)})" if match else "")
            + " -- from before release 3.0.0; new rounds use docs/rounds/"
        )
    urgent = [text for kind, text in actions if kind != "wait"]
    waits = [text for kind, text in actions if kind == "wait"]
    return lines, (urgent or waits or [""])[0]


def remote_tags(root: Path) -> dict[str, str] | None:
    """Tag name -> object id on origin, or None when origin cannot be asked."""
    result = git(["ls-remote", "--tags", "origin"], root, timeout=30)
    if result.returncode != 0:
        return None
    tags = {}
    for line in result.stdout.splitlines():
        oid, _, ref = line.partition("\t")
        if ref.startswith("refs/tags/") and not ref.endswith("^{}"):
            tags[ref[len("refs/tags/"):]] = oid
    return tags


def worktrees(root: Path) -> list[dict[str, str]]:
    found = []
    for block in out(["worktree", "list", "--porcelain"], root).split("\n\n")[1:]:
        entry = {}
        for line in block.splitlines():
            key, _, value = line.partition(" ")
            entry[key] = value
        if entry.get("worktree"):
            found.append(entry)
    return found


def machine_lines(root: Path, *, offline: bool) -> tuple[list[str], bool]:
    lines, safe = [], True
    branch = current_branch(root) or "(detached HEAD)"
    dirty = dirty_paths(root)
    lines.append(f"on {branch}; " + (f"{len(dirty)} uncommitted change(s)" if dirty else "no uncommitted changes"))
    if dirty:
        safe = False
    stashes = out(["stash", "list"], root).splitlines()
    if stashes:
        safe = False
        lines.append(f"{len(stashes)} stash(es) exist only on this machine")
    unpushed = []
    base = base_ref(root)
    if has_origin(root):
        # On GitHub means: reachable from origin's branches or from a tag origin
        # holds at the same object, or merged into origin's default branch by
        # content (a squash or rebase merge leaves no ancestry to follow).
        tags = None if offline else remote_tags(root)
        local = dict(
            line.split(" ", 1)[::-1] for line in
            out(["for-each-ref", "--format=%(objectname) %(refname)", "refs/"], root).splitlines()
        )
        on_remote = [
            ref for ref, oid in local.items()
            if ref.startswith("refs/tags/") and (tags or {}).get(ref[len("refs/tags/"):]) == oid
        ]
        refs = [r for r in local if not r.startswith(("refs/remotes/", "refs/stash")) and r not in on_remote]
        if current_branch(root) is None:
            refs.append("HEAD")
        for ref in refs:
            count = out(["rev-list", "--count", ref, "--not", "--remotes=origin", *on_remote], root)
            if count and count != "0" and not (base.startswith("origin/") and merged_by_content(root, base, ref)):
                label = ref.replace("refs/heads/", "").replace("refs/tags/", "tag ") if ref != "HEAD" else "the detached HEAD"
                unpushed.append(f"{label} ({count} commit(s))")
        if tags is None and any(item.startswith("tag ") for item in unpushed):
            lines.append("tags were not compared with origin (offline), so a tag may be listed below although it is pushed")
        for line in git(["submodule", "status", "--recursive"], root).stdout.splitlines():
            parts = line[1:].split()
            if line[:1] not in ("-", "") and len(parts) > 1 and (root / parts[1]).is_dir():
                sub = root / parts[1]
                count = git(["rev-list", "--count", "HEAD", "--not", "--remotes"], sub).stdout.strip()
                if count and count != "0":
                    unpushed.append(f"submodule {parts[1]} ({count} commit(s))")
    else:
        lines.append("no 'origin' remote: nothing here is backed up anywhere else")
        safe = False
    if unpushed:
        safe = False
        lines.append("not on GitHub yet: " + ", ".join(unpushed))
    removable = []
    tip = git(["rev-parse", "--verify", "--quiet", base], root).stdout.strip()
    for entry in worktrees(root):
        path = Path(entry["worktree"])
        if not path.is_dir() or path.resolve() == root.resolve():
            continue
        if dirty_paths(path):
            safe = False
            lines.append(f"uncommitted changes in linked checkout {path}")
            continue
        head = entry.get("HEAD", "")
        name = entry.get("branch", "").replace("refs/heads/", "")
        if head and tip and head != tip and name != default_branch(root) and (
            is_ancestor(root, head, base) or merged_by_content(root, base, head)
        ):
            try:
                removable.append(path.relative_to(root).as_posix())
            except ValueError:
                removable.append(str(path))
    if removable:
        lines.append(
            "finished seat checkouts (clean, and their work is merged) that can be removed: "
            + ", ".join(removable) + " -- git worktree remove <folder>"
        )
    submodules = submodule_warning(root)
    if submodules:
        lines.append(submodules)
    lines.append("safe to leave this machine: " + ("yes" if safe else "NO -- push or deal with the items above first"))
    return lines, safe


def cmd_status(root: Path, *, offline: bool, leaving: bool) -> int:
    warning = None if offline else fetch(root)
    print("Framework")
    lines, newer = framework_lines(root, offline)
    for line in lines:
        print(f"  {line}")
    rule = merge_rule(root)
    print("Merge rule")
    print(f"  {rule or 'not declared in AGENTS.md (the framework default is owner-approves)'}")
    print("Rounds")
    if warning:
        print(f"  note: {warning}")
    lines, action = rounds_lines(root)
    for line in lines:
        print(f"  {line}")
    print("This machine")
    lines, safe = machine_lines(root, offline=offline)
    for line in lines:
        print(f"  {line}")
    findings = check_project(root)
    print("Checks")
    if not findings:
        print("  all project checks pass")
    for level, message in findings:
        print(f"  {level}: {message}")
    print(f"Command form on this machine: {python_hint()} <command>")
    if not action:
        action = (f"ask Brain to plan the update round to framework release {newer}" if newer
                  else "nothing is waiting on you; ask Brain for the next round")
    print(f"next: {action}")
    return 1 if (leaving and not safe) else 0


# --------------------------------------------------------------------------
# check

PERSONAL = [
    (re.compile(r"(?<![A-Za-z0-9%])[A-Za-z]:(?:\\{1,2}|/)(?:Users|Documents and Settings)(?:\\{1,2}|/)", re.I), "a Windows user folder"),
    (re.compile(r"/Users/(?!<)[A-Za-z0-9._-]+/"), "a macOS home folder"),
    (re.compile(r"/home/(?!<|runner/|user/)[A-Za-z0-9._-]+/"), "a Linux home folder"),
    (re.compile(r"(?<![A-Za-z0-9%/])[D-Zd-z]:(?:\\{1,2}|/)[A-Za-z]"), "a Windows drive path"),
    (re.compile(r"/mnt/[a-z]/Users/", re.I), "a WSL Windows user folder"),
    (re.compile(r"~/Library/CloudStorage/"), "a synced-drive folder"),
    (re.compile(r"(?<![A-Za-z0-9._%+-])(?!git@|no-?reply@)[A-Za-z0-9._%+-]+@(?!users\.noreply\.github\.com|example\.(?:com|org|net)\b)[A-Za-z0-9-]+\.[A-Za-z]{2,}", re.I), "an email address"),
]
SHA40 = re.compile(r"\b[0-9a-f]{40}\b")
#: What the personal-data check reads: the documents every agent reads, not
#: every tracked file. Older archives in a project may hold paths it misses.
SCANNED = ("AGENTS.md, CLAUDE.md, GEMINI.md, docs/state.md, docs/agents/**/*.md, docs/rounds/*/*.md "
           "and docs/rounds/*/attachments/**")


def personal_data(line: str) -> str | None:
    for pattern, what in PERSONAL:
        if pattern.search(line):
            return what
    return None


def words(text: str) -> int:
    return len(text.split())


def _live_docs(root: Path) -> list[Path]:
    docs = [root / name for name in ("AGENTS.md", "CLAUDE.md", "GEMINI.md", STATE_DOC)]
    docs += sorted((root / "docs/agents").rglob("*.md")) if (root / "docs/agents").is_dir() else []
    docs += sorted((root / ROUNDS).glob("*/*.md")) if (root / ROUNDS).is_dir() else []
    docs += sorted((root / ROUNDS).glob("*/attachments/**/*")) if (root / ROUNDS).is_dir() else []
    return [p for p in docs if p.is_file() and b"\0" not in p.read_bytes()[:8192]]  # skip binary attachments


def check_project(root: Path) -> list[tuple[str, str]]:
    """Hygiene checks for an adopted project. Returns (level, message) pairs.

    Each check exists because the failure it catches happened in a real
    project: a state document that grew into a second database, instructions
    one AI tool never loads, personal paths in public repositories.
    """
    findings: list[tuple[str, str]] = []
    manifest = None
    try:
        manifest = load_manifest(root)
    except FwError as exc:
        findings.append(("error", str(exc)))
    settings = (manifest or {}).get("settings", {})

    state = root / STATE_DOC
    if state.is_file():
        text = state.read_text(encoding="utf-8")
        budget = int(settings.get("state_words", DEFAULT_STATE_WORDS))
        if words(text) > budget:
            findings.append((
                "error",
                f"{STATE_DOC} is {words(text)} words; its budget is {budget}. Keep decisions, "
                "move history into docs/rounds/ or a dedicated document",
            ))
        outside = re.sub(r"(?ms)^## Historical anchors\s*$.*?(?=^## |\Z)", "", text)
        if SHA40.search(outside):
            findings.append((
                "error",
                f"{STATE_DOC} stores a full commit id outside '## Historical anchors'. "
                "Live state is derived with fw.py status, never stored",
            ))

    for name in ("CLAUDE.md", "GEMINI.md"):
        path = root / name
        if path.is_file() and "AGENTS.md" not in path.read_text(encoding="utf-8"):
            findings.append((
                "error",
                f"{name} does not point at AGENTS.md, so sessions that load only {name} "
                "never see the project's rules. Make it a pointer: '@AGENTS.md'",
            ))

    agents = root / "AGENTS.md"
    if agents.is_file():
        text = agents.read_text(encoding="utf-8")
        rule = merge_rule(root)
        if rule is None:
            findings.append(("warning", "AGENTS.md has no 'Merge rule:' line (owner-approves or brain-merges)"))
        elif rule not in MERGE_RULES:
            findings.append(("error", f"AGENTS.md merge rule {rule!r} is not one of {', '.join(MERGE_RULES)}"))
        if words(text) > AGENTS_WORDS_WARNING:
            findings.append(("warning", f"AGENTS.md is {words(text)} words; every session reads it, aim for under {AGENTS_WORDS_WARNING}"))
    elif manifest is not None:
        findings.append(("error", "AGENTS.md is missing"))

    for path in _live_docs(root):
        rel = path.relative_to(root).as_posix()
        for number, line in enumerate(path.read_text(encoding="utf-8", errors="replace").splitlines(), 1):
            what = personal_data(line)
            if what:
                findings.append((
                    "error",
                    f"{rel}:{number} contains {what}; the documents agents read ({SCANNED}) must work "
                    "on every machine and are public",
                ))

    attributes = root / ".gitattributes"
    if manifest is not None and (not attributes.is_file() or "eol=lf" not in attributes.read_text(encoding="utf-8")):
        findings.append(("warning", ".gitattributes lacks '* text=auto eol=lf'; scripts may break when checked out on Windows"))
    for rel in ("tools/fw.py", ".githooks/pre-push"):
        path = root / rel
        if path.is_file() and b"\r\n" in path.read_bytes():
            findings.append(("warning", f"{rel} has Windows line endings; run: git add --renormalize . && git status"))
    return findings


def cmd_check(root: Path) -> int:
    findings = check_project(root)
    for level, message in findings:
        print(f"{level}: {message}")
    errors = sum(1 for level, _ in findings if level == "error")
    print(f"{errors} error(s), {len(findings) - errors} warning(s)")
    return 1 if errors else 0


# --------------------------------------------------------------------------


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(prog="fw.py", description=__doc__.split("\n\n")[0])
    parser.add_argument("--cwd", default=None, help="run against this checkout instead of the current directory")
    sub = parser.add_subparsers(dest="command", required=True)

    p = sub.add_parser("status", help="where things stand")
    p.add_argument("--offline", action="store_true", help="do not contact origin or the framework repository")
    p.add_argument("--leaving", action="store_true", help="exit 1 unless this machine is safe to leave")

    p = sub.add_parser("start", help="first command of a Worker or Verifier session")
    p.add_argument("--role", required=True)
    p.add_argument("--round", required=True)
    p.add_argument("--review", default=None, help="Verifier: the branch to review, if more than one carries the round")

    p = sub.add_parser("report", help="stamp and commit docs/rounds/ID/ROLE.md")
    p.add_argument("--role", required=True)
    p.add_argument("--round", required=True)
    p.add_argument("--push", action="store_true", help="also push the branch")

    p = sub.add_parser("delivery", help="is a round delivered, and where")
    p.add_argument("--round", required=True)
    p.add_argument("--branch", default=None)

    p = sub.add_parser("prompt", help="print the prompt for one seat of a round")
    p.add_argument("--round", required=True)
    p.add_argument("--role", required=True)
    p.add_argument("--message", type=int, default=1, help="N for a later message to the same seat (adds '· message N')")

    sub.add_parser("check", help="project hygiene checks")

    args = parser.parse_args(argv)
    for stream in (sys.stdout, sys.stderr):
        if hasattr(stream, "reconfigure"):
            stream.reconfigure(errors="replace")  # the prompt header's '·' on a narrow console
    try:
        root = repo_root(Path(args.cwd or os.getcwd()).resolve())
        if args.command == "status":
            return cmd_status(root, offline=args.offline, leaving=args.leaving)
        if args.command == "start":
            return cmd_start(root, args.role, args.round, args.review)
        if args.command == "report":
            return cmd_report(root, args.role, args.round, args.push)
        if args.command == "delivery":
            return cmd_delivery(root, args.round, args.branch)
        if args.command == "prompt":
            return cmd_prompt(root, args.round, args.role, args.message)
        return cmd_check(root)
    except FwError as exc:
        print(f"fw: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
