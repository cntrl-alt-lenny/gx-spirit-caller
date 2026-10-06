#!/usr/bin/env python3
"""fw.py -- the one tool the agentic framework installs into a project.

Every command works the same on Windows, macOS and Linux, in any AI tool that
can run git and Python 3.9+. Standard library only.

    python3 tools/fw.py status [--offline] [--leaving]
        Where things stand: framework release, each batch branch not yet
        merged and whether its summary is in, what this machine has not
        pushed, the project checks, and one last line naming the owner's next
        action. Brain's first command.
    python3 tools/fw.py check
        The project hygiene checks. Exit 1 when one fails.

Add --cwd DIR to any command to run it against another checkout. If `python3`
is not found, use `py -3` (Windows) or `python`.

Everything a later session needs travels through git -- every batch summary
and review is a committed file under docs/batches/ -- so work started on one
machine or tool can finish on another.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import subprocess
import sys
from pathlib import Path

BATCHES = "docs/batches"
LEGACY_ROUNDS = "docs/rounds"  # release 3.x; kept readable for adopted projects
MANIFEST = "docs/agents/framework.json"
STATE_DOC = "docs/state.md"
DEFAULT_STATE_WORDS = 1000
AGENTS_WORDS_WARNING = 2500
PAPER_WORDS = 500  # a prompt, summary or review: prose only, not output or tables
MERGE_RULES = ("owner-approves", "brain-merges")


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
    """Local branches and origin's branches, newest first."""
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

def python_hint() -> str:
    return "py -3 tools/fw.py" if os.name == "nt" else "python3 tools/fw.py"




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
                "Brain updates it with the framework's tools/adopt.py <project> --update (Small path).",
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
                kind = ("major (how work runs changed): update before the next batch"
                        if there[0] > here[0] else "minor or patch: update between batches")
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


def changed_on(root: Path, base: str, ref: str, path: str) -> set[str]:
    """Files under ``path`` that differ between ``base`` and ``ref``."""
    here, there = tree_files(root, base, path), tree_files(root, ref, path)
    return {name for name, blob in there.items() if here.get(name) != blob}


def batch_papers(changed: set[str]) -> tuple[list[str], list[str]]:
    """Batch names with a summary, and with a review, among changed files. Read
    from the files, not the branch name: cloud tools name branches themselves."""
    summaries, reviews = [], []
    for path in sorted(changed):
        name = path[len(BATCHES) + 1:]
        if "/" in name or not name.endswith(".md") or name == "README.md" or name.endswith("-brief.md"):
            continue
        if name.endswith("-review.md"):
            reviews.append(name[:-len("-review.md")])
        else:
            summaries.append(name[:-len(".md")])
    return summaries, reviews


def batch_state(root: Path, ref: str, name: str, changed: set[str]) -> tuple[str, str]:
    """What a branch not yet merged holds, and the owner's next action for it
    ("" while it is still being worked on)."""
    summaries, reviews = batch_papers(changed)
    for batch in reviews:
        last = out(["log", "-1", "--format=%H", ref, "--", f"{BATCHES}/{batch}-review.md"], root)
        later = out(["rev-list", "--count", f"{last}..{ref}"], root)
        if later != "0":
            return (f"batch {batch}: {later} commit(s) after the Verifier's review -- Brain checks them",
                    f"ask Brain to check the fixes in batch {batch}")
        return f"batch {batch}: Verifier review in -- Brain judges it", f"ask Brain to judge batch {batch}"
    if summaries:
        batch = ", ".join(summaries)
        return (f"batch {batch}: Worker summary in -- Brain reviews it, or sends the Verifier prompt "
                "if this is a Checked batch", f"ask Brain to review batch {batch}")
    if any(path.startswith(LEGACY_ROUNDS + "/") for path in changed):
        return (f"a release 3.x round (reports under {LEGACY_ROUNDS}/) -- Brain finishes it the old way or closes it",
                f"ask Brain what to do with {name}")
    if name.startswith("brain/"):
        return ("Brain's own change (Small path): ready for your yes, or still being written",
                f"ask Brain whether {name} is ready for your yes")
    return "no summary yet: still working, or stopped without one", ""


def batches_lines(root: Path) -> tuple[list[str], str]:
    """Every branch whose work is not on the default branch yet, and what it
    holds: a batch summary, a Verifier review, or a 3.x round folder."""
    base = base_ref(root)
    refs = [r for r in branch_refs(root) if r not in (base, default_branch(root))]
    tips = {ref: out(["rev-parse", ref], root) for ref in refs}
    on_base = set(tree_files(root, base, BATCHES))
    lines, actions, working = [], [], 0
    for ref in refs:
        local = not ref.startswith("origin/")
        name = ref if local else ref[len("origin/"):]
        twin = f"origin/{name}"
        if local and twin in tips and (tips[twin] == tips[ref] or is_ancestor(root, ref, twin)):
            continue  # GitHub's copy holds all of it
        if is_ancestor(root, ref, base) or merged_by_content(root, base, ref):
            continue
        label = f"{name} (this machine's copy)" if local and twin in tips else name
        changed = changed_on(root, base, ref, BATCHES) | changed_on(root, base, ref, LEGACY_ROUNDS)
        fork = git(["merge-base", base, ref], root).stdout.strip()
        # The batch files this branch created; all of them on the base means
        # the batch was merged. Editing or deleting existing ones proves nothing.
        papers = set(out(["diff", "--name-only", "--no-renames", "--diff-filter=A", fork, ref, "--", BATCHES],
                         root).split()) if fork else set()
        if papers and papers <= on_base:
            last = out(["log", "-1", "--format=%H", ref, "--", *sorted(papers)], root)
            later = out(["rev-list", "--count", f"{last}..{ref}"], root)
            if later == "0":
                lines.append(f"{label}: merged earlier (its batch files are on {base}) -- delete the branch")
                continue
            state = f"its batch was merged, but {later} later commit(s) are not"
            action = f"ask Brain about the later work on {label}"
        else:
            state, action = batch_state(root, ref, label, changed)
        if action:
            actions.append(action)
        else:
            working += 1
        count = out(["rev-list", "--count", f"{base}..{ref}"], root)
        when = out(["log", "-1", "--format=%cd", "--date=short", ref], root)
        lines.append(f"{label}: {count} commit(s), last {when}; {state}")
    if not lines:
        lines.append("nothing waiting: every branch is merged")
    if not actions and working:
        actions.append(f"nothing needs you yet: {working} branch(es) still being worked on")
    return lines, (actions or [""])[0]


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
            "finished checkouts (clean, and their work is merged) that can be removed: "
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
    print("Work not merged yet")
    if warning:
        print(f"  note: {warning}")
    lines, action = batches_lines(root)
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
        action = (f"ask Brain to apply framework release {newer} (Small path: adopt.py --update)" if newer
                  else "nothing is waiting on you; ask Brain for the next batch")
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
SCANNED = ("AGENTS.md, CLAUDE.md, GEMINI.md, docs/state.md, docs/agents/**/*.md, docs/batches/**, "
           "and 3.x rounds: docs/rounds/*/*.md and docs/rounds/*/attachments/**")


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
    docs += sorted((root / BATCHES).rglob("*")) if (root / BATCHES).is_dir() else []
    docs += sorted((root / LEGACY_ROUNDS).glob("*/*.md")) if (root / LEGACY_ROUNDS).is_dir() else []
    docs += sorted((root / LEGACY_ROUNDS).glob("*/attachments/**/*")) if (root / LEGACY_ROUNDS).is_dir() else []
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
                "move history into docs/batches/ or a dedicated document",
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

    if (root / BATCHES).is_dir():
        for path in sorted((root / BATCHES).glob("*.md")):
            text = re.sub(r"(?ms)^```.*?^```", "", path.read_text(encoding="utf-8", errors="replace"))
            prose = words("\n".join(line for line in text.splitlines() if not line.lstrip().startswith("|")))
            if path.name != "README.md" and prose > PAPER_WORDS:
                findings.append(("warning", f"{BATCHES}/{path.name} has {prose} words of prose; "
                                 f"the cap is {PAPER_WORDS} -- split the work, or move detail into the commits"))

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

    sub.add_parser("check", help="project hygiene checks")

    args = parser.parse_args(argv)
    for stream in (sys.stdout, sys.stderr):
        if hasattr(stream, "reconfigure"):
            stream.reconfigure(errors="replace")  # a branch or path name a narrow console cannot print
    try:
        root = repo_root(Path(args.cwd or os.getcwd()).resolve())
        if args.command == "status":
            return cmd_status(root, offline=args.offline, leaving=args.leaving)
        return cmd_check(root)
    except FwError as exc:
        print(f"fw: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
