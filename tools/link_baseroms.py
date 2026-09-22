#!/usr/bin/env python3
"""Install the primary checkout's baseroms in a role checkout.

The normal result is a hard link, so linked worktrees do not keep duplicate
ROM copies.  The source files remain in the primary checkout and are checked
against the hashes owned by ``tools/configure.py`` before anything is linked.
"""

from __future__ import annotations

import argparse
import ast
import hashlib
import os
import shutil
import subprocess
import sys
from collections.abc import Callable
from pathlib import Path


REGIONS = ("eur", "usa", "jpn")
CONFIGURE = Path(__file__).with_name("configure.py")


class LinkError(RuntimeError):
    """A source or target is unsafe to modify."""


def _pinned_hashes(configure_path: Path = CONFIGURE) -> dict[str, str | None]:
    """Read ``BASEROM_SHA1`` from configure.py, the project's source of truth."""
    tree = ast.parse(configure_path.read_text(encoding="utf-8"), str(configure_path))
    for node in tree.body:
        if isinstance(node, ast.AnnAssign) and isinstance(node.target, ast.Name):
            if node.target.id == "BASEROM_SHA1" and isinstance(node.value, ast.Dict):
                result: dict[str, str | None] = {}
                for key, value in zip(node.value.keys, node.value.values, strict=True):
                    if not isinstance(key, ast.Constant) or not isinstance(key.value, str):
                        raise LinkError("BASEROM_SHA1 contains a non-string region")
                    if isinstance(value, ast.Constant) and (
                        value.value is None or isinstance(value.value, str)
                    ):
                        result[key.value] = value.value
                    else:
                        raise LinkError("BASEROM_SHA1 contains a non-literal hash")
                return result
    raise LinkError(f"could not find BASEROM_SHA1 in {configure_path}")


def _git_common_dir(target: Path) -> Path:
    proc = subprocess.run(
        ["git", "-C", str(target), "rev-parse", "--git-common-dir"],
        capture_output=True,
        text=True,
        check=False,
    )
    if proc.returncode:
        detail = proc.stderr.strip() or "git rev-parse failed"
        raise LinkError(f"cannot find the target checkout's Git common directory: {detail}")
    common = Path(proc.stdout.strip())
    if not common.is_absolute():
        common = target / common
    return common.resolve()


def find_primary_checkout(target: Path) -> Path:
    """Derive the primary checkout from the target's shared Git directory."""
    common = _git_common_dir(target)
    if common.name != ".git":
        raise LinkError(f"expected a .git common directory, got {common}")
    primary = common.parent
    if not (primary / ".git").exists():
        raise LinkError(f"derived primary checkout does not exist: {primary}")
    return primary


def _sha1(path: Path) -> str:
    digest = hashlib.sha1()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def _same_file(left: Path, right: Path) -> bool:
    try:
        return os.path.samefile(left, right)
    except (FileNotFoundError, OSError):
        try:
            return left.stat().st_dev == right.stat().st_dev and left.stat().st_ino == right.stat().st_ino
        except FileNotFoundError:
            return False


def _tracked(target: Path, relative: Path) -> bool:
    proc = subprocess.run(
        ["git", "-C", str(target), "ls-files", "--error-unmatch", "--", relative.as_posix()],
        capture_output=True,
        check=False,
    )
    return proc.returncode == 0


def _install(
    source: Path,
    destination: Path,
    *,
    replace: bool,
    link: Callable[[str | os.PathLike[str], str | os.PathLike[str]], None] = os.link,
    copy: Callable[[str | os.PathLike[str], str | os.PathLike[str]], str] = shutil.copy2,
) -> str:
    if destination.exists() or destination.is_symlink():
        if _same_file(source, destination):
            print(f"  {destination.name}: already the same file; no action")
            return "same-file"
        if _sha1(destination) != _sha1(source):
            raise LinkError(
                f"refusing to replace {destination}: its content differs from {source}"
            )
        if not replace:
            print(f"  {destination.name}: byte-identical copy left alone (use --replace-copies to link it)")
            return "copy-left"
        print(f"  {destination.name}: replacing byte-identical copy with a hard link")
        destination.unlink()
    else:
        print(f"  {destination.name}: installing a hard link")

    try:
        link(os.fspath(source), os.fspath(destination))
        print(f"  {destination.name}: hard link created")
        return "linked"
    except OSError as exc:
        print(
            f"  WARNING: hard link for {destination.name} failed ({exc}); "
            "falling back to a byte-for-byte copy",
            file=sys.stderr,
        )
        copy(os.fspath(source), os.fspath(destination))
        print(f"  {destination.name}: fallback copy created")
        return "copied"


def link_baseroms(
    target: Path,
    *,
    primary: Path | None = None,
    pinned_hashes: dict[str, str | None] | None = None,
    replace_copies: bool = False,
    link: Callable[[str | os.PathLike[str], str | os.PathLike[str]], None] = os.link,
    copy: Callable[[str | os.PathLike[str], str | os.PathLike[str]], str] = shutil.copy2,
) -> int:
    """Verify and install each available region, returning a process status."""
    target = target.resolve()
    primary = (primary or find_primary_checkout(target)).resolve()
    hashes = pinned_hashes if pinned_hashes is not None else _pinned_hashes()
    print(f"target checkout: {target}")
    print(f"primary checkout: {primary}")
    destination_dir = target / "orig"
    destination_dir.mkdir(parents=True, exist_ok=True)

    for region in REGIONS:
        source = primary / "orig" / f"baserom_{region}.nds"
        destination = destination_dir / source.name
        print(f"{region}: source={source} target={destination}")
        if not source.is_file():
            print(f"  {region}: source absent; skipped")
            continue
        expected = hashes.get(region)
        if not expected:
            raise LinkError(f"{region}: no pinned SHA-1 exists in tools/configure.py")
        actual = _sha1(source)
        print(f"  {region}: source SHA-1 {actual} (expected {expected})")
        if actual != expected:
            raise LinkError(f"{region}: source SHA-1 mismatch; refusing to link it")
        relative = Path("orig") / source.name
        if _tracked(target, relative):
            raise LinkError(f"{destination} is tracked by Git; refusing to write it")
        _install(source, destination, replace=replace_copies, link=link, copy=copy)
    print("baserom linking complete")
    return 0


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("target", type=Path, help="role checkout that needs orig/baserom_*.nds")
    parser.add_argument(
        "--replace-copies",
        action="store_true",
        help="replace byte-identical copies with hard links",
    )
    args = parser.parse_args(argv)
    try:
        return link_baseroms(args.target, replace_copies=args.replace_copies)
    except (LinkError, OSError, UnicodeError) as exc:
        print(f"link-baseroms: ERROR: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
