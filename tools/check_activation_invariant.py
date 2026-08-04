#!/usr/bin/env python3
"""check_activation_invariant.py — mechanically gate sweep bookkeeping.

Failure mode (a real off-by-one on an earlier sweep): a PR can add one more
``.c`` than it deletes ``.s`` or flips in ``delinks.txt``.  The ROM can still
build byte-correct because the build graph has a filename fallback, so
``ninja sha1`` does not see the bookkeeping drift.  This checker makes the
three-way sweep count observable and fail-closed.

The invariant is intentionally limited to function TUs.  Data carves create
new symbols without a preceding ``func_*.s`` to remove, so data ``.c`` adds
are reported as informational and never fail the gate.  Routed function
conversions are accepted: ``func_X.s`` may become ``func_X.legacy.c``,
``func_X.legacy_sp3.c``, or ``func_X.thumb.c``.

Usage::

    python tools/check_activation_invariant.py
    python tools/check_activation_invariant.py origin/main..HEAD
    python tools/check_activation_invariant.py --repo C:/repo BASE..HEAD

Exit codes::

    0   function additions, removals, and delinks activations agree
    1   an invariant mismatch was found, or the range contained no inputs
    2   usage, git, or repository error
"""

from __future__ import annotations

import argparse
import re
import subprocess
import sys
from collections import Counter
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
_SOURCE_HEADER_RE = re.compile(r"^[+-]((?:src|libs)/\S+):\s*$")
_DIFF_FILE_RE = re.compile(
    r"^diff --git a/(config/.*/delinks\.txt) b/config/.*/delinks\.txt$"
)
_FUNC_S_RE = re.compile(r"^(func_[^.]+)\.s$")
_FUNC_C_RE = re.compile(
    r"^(func_[^.]+)(?:\.legacy|\.legacy_sp3|\.thumb)?\.c$"
)
_SYMBOL_RE = re.compile(
    r"^\S+\s+kind:(?P<kind>function|data)(?:\([^)]*\))?\s+"
    r"addr:0x(?P<addr>[0-9a-fA-F]+)"
)
_DELINK_SOURCE_RE = re.compile(r"^(?P<path>src/[^:]+):$")
_DELINK_SECTION_RE = re.compile(
    r"^\s+\.(?P<section>\w+)\s+start:0x(?P<addr>[0-9a-fA-F]+)"
)

SourceIdentity = tuple[str, str, int]


@dataclass(frozen=True)
class SourceClassification:
    """The kind of an added C source and how it was determined."""

    kind: str
    source: str
    identity: SourceIdentity | None


@dataclass(frozen=True)
class RangeFiles:
    """The source-file delta relevant to the invariant."""

    added_c: tuple[str, ...]
    deleted_func_s: tuple[str, ...]


@dataclass(frozen=True)
class Activations:
    """Net source-header changes in delinks files."""

    added_c: tuple[str, ...]
    removed_func_s: tuple[str, ...]


@dataclass(frozen=True)
class InvariantReport:
    """All counts and mismatches for one git range."""

    git_range: str
    files: RangeFiles
    activations: Activations
    classifications: tuple[tuple[str, str, str], ...]
    function_c_paths: tuple[str, ...]
    data_additions: tuple[str, ...]
    missing_c_activations: tuple[str, ...]
    missing_s_activations: tuple[str, ...]
    activation_flip_count: int
    count_mismatch: int
    has_inputs: bool

    @property
    def function_c_additions(self) -> tuple[str, ...]:
        return self.function_c_paths

    @property
    def activation_flips(self) -> int:
        return self.activation_flip_count

    @property
    def ok(self) -> bool:
        return self.has_inputs and not (
            self.missing_c_activations
            or self.missing_s_activations
            or self.count_mismatch
        )


def _git(repo: Path, *args: str) -> str:
    try:
        result = subprocess.run(
            ["git", "-C", str(repo), *args],
            text=True,
            capture_output=True,
            check=True,
        )
    except (OSError, subprocess.CalledProcessError) as exc:
        detail = getattr(exc, "stderr", "") or str(exc)
        raise RuntimeError(f"git {' '.join(args)} failed: {detail.strip()}") from exc
    return result.stdout


def _path_key(path: str) -> tuple[str, str] | None:
    """Return ``(parent, function-address-stem)`` for a function source."""
    posix = path.replace("\\", "/")
    parent, _, name = posix.rpartition("/")
    match = _FUNC_S_RE.match(name) or _FUNC_C_RE.match(name)
    if not match:
        return None
    return parent, match.group(1)


def _func_key(path: str) -> tuple[str, str] | None:
    posix = path.replace("\\", "/")
    if not posix.startswith("src/"):
        return None
    return _path_key(posix)


def _config_region_module(path: Path) -> tuple[str, str] | None:
    """Derive the region/module represented by a config file directory."""
    parts = path.parts
    try:
        config_i = parts.index("config")
        region = parts[config_i + 1]
        arm9_i = parts.index("arm9", config_i + 1)
    except (ValueError, IndexError):
        return None
    if arm9_i + 2 < len(parts) and parts[arm9_i + 1] == "overlays":
        return region, parts[arm9_i + 2]
    if arm9_i + 1 >= len(parts) or parts[arm9_i + 1] in {"symbols.txt", "delinks.txt"}:
        return region, "main"
    return region, parts[arm9_i + 1]


def _source_identity_from_path(path: str) -> SourceIdentity | None:
    """Best-effort ``(region, module, address)`` from a source path."""
    posix = path.replace("\\", "/")
    parts = posix.split("/")
    if len(parts) < 3 or parts[0] != "src":
        return None
    if parts[1] in {"eur", "usa", "jpn"}:
        region, module_dir = parts[1], parts[2]
    else:
        region, module_dir = "eur", parts[1]
    if module_dir == "main":
        module = "main"
    elif module_dir.startswith("overlay") and module_dir[7:].isdigit():
        module = "ov" + module_dir[7:].zfill(3)
    else:
        module = module_dir
    match = re.search(r"([0-9a-fA-F]{8})(?:\.[^.]+)*$", parts[-1])
    if match is None:
        return None
    return region, module, int(match.group(1), 16)


def _source_metadata(repo: Path) -> dict[str, tuple[SourceIdentity, str]]:
    """Map delinks source paths to authoritative function/data kinds.

    ``delinks.txt`` supplies the source path and section start address;
    ``symbols.txt`` supplies the address's ``kind:function`` or ``kind:data``.
    A section-derived kind is retained as a fallback for a missing symbol row.
    """
    symbol_kinds: dict[SourceIdentity, str] = {}
    symbol_path_kinds: dict[str, tuple[SourceIdentity, str]] = {}
    config = repo / "config"
    for symbols_path in config.rglob("symbols.txt"):
        region_module = _config_region_module(symbols_path)
        if region_module is None:
            continue
        region, module = region_module
        if module == "main" or module in {"itcm", "dtcm"}:
            module_dir = module
        else:
            module_dir = "overlay" + module[2:].zfill(3)
        for line in symbols_path.read_text(encoding="utf-8").splitlines():
            match = _SYMBOL_RE.match(line)
            if match:
                identity = (region, module, int(match.group("addr"), 16))
                kind = match.group("kind")
                symbol_kinds[identity] = kind
                symbol_name = line.split(None, 1)[0]
                # A named source may be added before its delinks header is
                # flipped.  Materialize both region-qualified and EUR-style
                # paths so symbols.txt remains authoritative in that case.
                source_dirs = [f"src/{region}/{module_dir}"]
                if region == "eur":
                    source_dirs.append(f"src/{module_dir}")
                for source_dir in source_dirs:
                    for suffix in (".c", ".cpp"):
                        metadata_path = f"{source_dir}/{symbol_name}{suffix}"
                        symbol_path_kinds[metadata_path] = (identity, "symbols:" + kind)

    metadata: dict[str, tuple[SourceIdentity, str]] = dict(symbol_path_kinds)
    for delinks_path in config.rglob("delinks.txt"):
        region_module = _config_region_module(delinks_path)
        if region_module is None:
            continue
        region, module = region_module
        pending_path: str | None = None
        for line in delinks_path.read_text(encoding="utf-8").splitlines():
            header = _DELINK_SOURCE_RE.match(line)
            if header:
                pending_path = header.group("path").replace("\\", "/")
                continue
            if pending_path is None:
                continue
            section = _DELINK_SECTION_RE.match(line)
            if section is None:
                continue
            identity = (region, module, int(section.group("addr"), 16))
            kind = symbol_kinds.get(identity)
            if kind is None:
                kind = "function" if section.group("section") in {"text", "init"} else "data"
                provenance = "delinks-section-fallback"
            else:
                provenance = "symbols"
            metadata[pending_path] = (identity, provenance + ":" + kind)
            pending_path = None
    return metadata


def _classify_source(
    path: str, metadata: dict[str, tuple[SourceIdentity, str]],
) -> SourceClassification:
    posix = path.replace("\\", "/")
    if posix in metadata:
        identity, provenance_kind = metadata[posix]
        provenance, kind = provenance_kind.split(":", 1)
        return SourceClassification(kind, provenance, identity)
    identity = _source_identity_from_path(posix)
    if _func_key(posix):
        return SourceClassification("function", "filename-prefix-fallback", identity)
    return SourceClassification("data", "filename-prefix-fallback", identity)


def source_delta(repo: Path, git_range: str) -> RangeFiles:
    """Read new C and deleted function assembly paths from a git range.

    C-to-C renames are not new translation units and therefore do not belong
    in the three-way count.  Cross-extension ``.s`` -> ``.c`` renames are
    expanded into both sides of the invariant.
    """
    raw = _git(repo, "diff", "--name-status", "--find-renames", git_range, "--", "src")
    added_c: list[str] = []
    deleted_func_s: list[str] = []
    for line in raw.splitlines():
        fields = line.split("\t")
        status = fields[0]
        if status.startswith("R") and len(fields) >= 3:
            old_path, new_path = fields[1], fields[2]
            if new_path.endswith((".c", ".cpp")) and old_path.endswith(".s"):
                added_c.append(new_path)
                if _func_key(old_path):
                    deleted_func_s.append(old_path)
            continue
        path = fields[1] if len(fields) > 1 else ""
        if status == "A" and path.endswith((".c", ".cpp")):
            added_c.append(path)
        elif status == "D" and path.endswith(".s") and _func_key(path):
            deleted_func_s.append(path)
    return RangeFiles(tuple(sorted(added_c)), tuple(sorted(deleted_func_s)))


def activation_delta(repo: Path, git_range: str) -> Activations:
    """Read source-header replacements from changed ``delinks.txt`` files."""
    raw = _git(
        repo,
        "diff",
        "--unified=0",
        "--no-renames",
        git_range,
        "--",
        "config",
    )
    added_c: list[str] = []
    removed_func_s: list[str] = []
    in_delinks = False
    for line in raw.splitlines():
        if line.startswith("diff --git "):
            in_delinks = bool(_DIFF_FILE_RE.match(line))
            continue
        if not in_delinks:
            continue
        if line.startswith("+++") or line.startswith("---"):
            continue
        match = _SOURCE_HEADER_RE.match(line)
        if not match:
            continue
        path = match.group(1)
        if line.startswith("+") and path.endswith((".c", ".cpp")):
            added_c.append(path)
        elif line.startswith("-") and path.endswith(".s") and _func_key(path):
            removed_func_s.append(path)
    return Activations(tuple(sorted(added_c)), tuple(sorted(removed_func_s)))


def _paired_flip_count(
    activations: Activations,
    metadata: dict[str, tuple[SourceIdentity, str]],
) -> int:
    """Count ``func_*.s`` -> C-header replacements, including routed C."""
    removed = Counter(_source_identity_from_path(path) for path in activations.removed_func_s)
    added = Counter(
        _classify_source(path, metadata).identity for path in activations.added_c
    )
    keys = (set(removed) | set(added)) - {None}
    return sum(min(removed[key], added[key]) for key in keys)


def check_range(repo: Path, git_range: str) -> InvariantReport:
    files = source_delta(repo, git_range)
    activations = activation_delta(repo, git_range)
    metadata = _source_metadata(repo)
    classifications = {
        path: _classify_source(path, metadata) for path in files.added_c
    }
    function_paths = tuple(
        path for path in files.added_c if classifications[path].kind == "function"
    )
    data_paths = tuple(
        path for path in files.added_c if classifications[path].kind != "function"
    )
    added_activation_paths = set(activations.added_c)
    removed_activation_paths = set(activations.removed_func_s)
    # Data additions are deliberately informational only.  They have no
    # preceding function .s to replace, so they must not make a correct data
    # carve fail the function invariant.  Function C additions still require
    # an exact matching activation path. Identity-only matching lets a stale
    # routed basename satisfy the invariant after an unrelated delinks wipe.
    missing_c = tuple(
        path for path in files.added_c
        if classifications[path].kind == "function"
        and classifications[path].identity is not None
        and path not in added_activation_paths
    )
    missing_s = tuple(
        path for path in files.deleted_func_s
        if path not in removed_activation_paths
    )
    flips = _paired_flip_count(activations, metadata)
    function_c_count = len(function_paths)
    deleted_s_count = len(files.deleted_func_s)
    # A flip count is only valid when it accounts for both sides of the
    # function conversion.  Expose the drift as a single failure count while
    # the detailed missing lists explain which side is absent.
    unmatched = abs(function_c_count - flips) + abs(deleted_s_count - flips)
    has_inputs = bool(
        files.added_c
        or files.deleted_func_s
        or activations.added_c
        or activations.removed_func_s
    )
    return InvariantReport(
        git_range=git_range,
        files=files,
        activations=activations,
        classifications=tuple(
            (path, classification.kind, classification.source)
            for path, classification in sorted(classifications.items())
        ),
        function_c_paths=function_paths,
        data_additions=data_paths,
        missing_c_activations=tuple(sorted(set(missing_c))),
        missing_s_activations=tuple(sorted(set(missing_s))),
        activation_flip_count=flips,
        count_mismatch=unmatched,
        has_inputs=has_inputs,
    )


def print_report(report: InvariantReport) -> None:
    function_count = len(report.function_c_additions)
    deleted_count = len(report.files.deleted_func_s)
    provenance_counts = Counter(
        source for _, _, source in report.classifications
    )
    print(f"range: {report.git_range}")
    print(f"function .c added:       {function_count}")
    print(f"function .s deleted:     {deleted_count}")
    print(f"delinks activations:     {report.activation_flips}")
    print(f"data .c additions:       {len(report.data_additions)} (informational)")
    print(
        "classification sources: "
        + ", ".join(f"{source}={count}" for source, count in sorted(provenance_counts.items()))
    )
    if report.data_additions:
        classifications = dict(
            (path, (kind, source))
            for path, kind, source in report.classifications
        )
        for path in report.data_additions:
            _, source = classifications[path]
            state = "activation present" if path in report.activations.added_c else "no activation (informational)"
            state += f"; classifier={source}"
            print(f"  DATA: {path} [{state}]")
    for path in report.missing_c_activations:
        print(f"MISSING delinks activation for added C: {path}")
    for path in report.missing_s_activations:
        print(f"MISSING delinks activation for deleted S: {path}")
    if not report.has_inputs:
        print(
            "check_activation_invariant: FAIL — no source or activation "
            "changes in the requested range; refusing a vacuous pass"
        )
    elif report.ok:
        print("check_activation_invariant: OK")
    else:
        print("check_activation_invariant: FAIL")


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("git_range", nargs="?", default="origin/main..HEAD")
    parser.add_argument(
        "--repo",
        type=Path,
        default=ROOT,
        help="repository to inspect (default: this repository; for local fixtures)",
    )
    args = parser.parse_args(argv)
    repo = args.repo.resolve()
    if not (repo / ".git").exists():
        print(f"check_activation_invariant: no git repository at {repo}", file=sys.stderr)
        return 2
    try:
        report = check_range(repo, args.git_range)
    except RuntimeError as exc:
        print(f"check_activation_invariant: {exc}", file=sys.stderr)
        return 2
    print_report(report)
    return 0 if report.ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
