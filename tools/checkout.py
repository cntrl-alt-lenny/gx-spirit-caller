#!/usr/bin/env python3
"""Verify that this process started in the checkout for its declared seat.

Run this as the first action in every role prompt::

    python3 tools/checkout.py --seat <seat>

A linked worktree belongs to its final path component, whatever that is --
``.worktrees/<role>`` is the convention, but any linked-worktree layout works.
An ordinary primary checkout or separate clone is the coordinating seat; that
is the ONLY seat a separate clone can ever hold, because the shared
completion-report inbox (see ``../framework/reports.md``) lives inside
``git rev-parse --git-common-dir``, which a separate clone never shares with
any other checkout. Assigning it a non-coordinator seat with::

    git config --local framework.checkout-seat <seat>

is therefore a hard error here, not a silent mis-tag: the checkout check would
pass, a report would land in that clone's own private inbox, and every
delivery check run from anywhere else would report "not delivered yet"
forever. Use a linked worktree for any role but the coordinator. The command
does not change the repository and reports both locations when it fails.
"""

from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path


class CheckoutError(Exception):
    """The current directory is not a usable Git checkout."""


_ROLE_NAME = re.compile(r"[a-z][a-z0-9_-]*\Z")
_WINDOWS_DEVICE_NAMES = {
    "con", "prn", "aux", "nul",
    *(f"com{number}" for number in range(1, 10)),
    *(f"lpt{number}" for number in range(1, 10)),
}


def validate_role_name(role: str) -> str:
    """Return a role name safe for checkout identity and inbox paths.

    Role names are deliberately a portable, case-sensitive subset shared by
    Git, POSIX and Windows: lowercase ASCII, starting with a letter, followed
    by lowercase letters, digits, ``-`` or ``_``.  Rejecting uppercase names
    also prevents two roles from colliding on a case-insensitive filesystem;
    rejecting Windows device names keeps a name valid when an adopting project
    is later used on Windows.
    """
    if not isinstance(role, str) or not _ROLE_NAME.fullmatch(role):
        raise CheckoutError(
            f"invalid role name {role!r}; use lowercase ASCII letters, digits, "
            "'-' or '_' and start with a letter"
        )
    if role in _WINDOWS_DEVICE_NAMES:
        raise CheckoutError(
            f"invalid role name {role!r}; it is reserved by Windows"
        )
    return role


def _git(args: list[str], cwd: str | Path | None = None) -> str | None:
    try:
        return subprocess.check_output(
            ["git", *args], cwd=cwd, stderr=subprocess.DEVNULL, text=True,
        ).strip()
    except (OSError, subprocess.CalledProcessError):
        return None


def _path(raw: str, cwd: str | Path | None) -> Path:
    path = Path(raw)
    if not path.is_absolute():
        path = (Path(cwd) if cwd else Path.cwd()) / path
    return path.resolve()


def checkout_seat(cwd: str | Path | None = None, *, coordinator: str = "brain") -> str:
    """Return the seat structurally assigned to ``cwd``.

    A LINKED WORKTREE (its private git-dir differs from the repository's
    shared git-common-dir) is tagged by its own directory name, whatever that
    name is -- `.worktrees/<role>` is the documented convention, but
    `git-and-isolation.md` also allows "any mechanism providing equivalent
    isolation", so an unconventional worktree layout is still a distinct,
    nameable seat rather than silently falling back to the coordinator.

    A PRIMARY CHECKOUT and a SEPARATE CLONE are structurally identical --
    both have git-dir == git-common-dir -- so only the local
    ``framework.checkout-seat`` marker can tell them apart. A SEPARATE CLONE
    can only ever BE the coordinating seat: its git-common-dir, and therefore
    its completion-report inbox (see ``../framework/reports.md``), is private
    to it, so a report written under any other seat name would be invisible
    to a delivery check run from anywhere else. Assigning it a
    non-coordinator seat is therefore a hard error here rather than a silent
    mis-tag -- see the module docstring.

    This is the single derivation `tools/report.py`'s ``role_tag`` also uses,
    so the two can never disagree about which seat owns a checkout.
    """
    try:
        coordinator = validate_role_name(coordinator)
    except CheckoutError:
        raise
    top_raw = _git(["rev-parse", "--show-toplevel"], cwd)
    git_dir_raw = _git(["rev-parse", "--git-dir"], cwd)
    common_dir_raw = _git(["rev-parse", "--git-common-dir"], cwd)
    if not top_raw or not git_dir_raw or not common_dir_raw:
        raise CheckoutError("not inside a Git repository")
    top = _path(top_raw, cwd)
    is_primary = _path(git_dir_raw, cwd) == _path(common_dir_raw, cwd)
    if not is_primary:
        return validate_role_name(top.name)
    assigned = _git(["config", "--local", "--get", "framework.checkout-seat"], cwd)
    if assigned and assigned != coordinator:
        raise CheckoutError(
            f"framework.checkout-seat={assigned!r} is set on {top}, a "
            f"separate clone -- not supported. A separate clone's shared "
            f"completion-report inbox is private to it, so a report written "
            f"under that seat would be invisible to a delivery check run "
            f"from any other checkout. Use a linked worktree instead: "
            f"git worktree add --detach .worktrees/{assigned} <base-branch>"
        )
    return coordinator


def check(
    seat: str, cwd: str | Path | None = None, *, coordinator: str = "brain"
) -> tuple[int, str]:
    """Return zero only when ``seat`` owns the current checkout."""
    try:
        validate_role_name(seat)
        top_raw = _git(["rev-parse", "--show-toplevel"], cwd)
        if not top_raw:
            raise CheckoutError("not inside a Git repository")
        top = _path(top_raw, cwd)
        actual = checkout_seat(cwd, coordinator=coordinator)
    except CheckoutError as exc:
        location = Path(cwd or Path.cwd()).resolve()
        return 1, f"checkout check failed: {exc}; current location is {location}"

    if actual == seat:
        return 0, f"checkout ok: seat={seat} checkout={top}"
    expected = (
        f".worktrees/{seat}"
        if seat != coordinator
        else "the primary checkout or a clone assigned to the coordinating seat"
    )
    return 1, (
        f"checkout check failed: current checkout is {top} (seat={actual}); "
        f"seat={seat} must run in {expected}"
    )


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--seat", required=True, help="the role this session was assigned")
    parser.add_argument("--coordinator", default="brain", help="coordinating seat name")
    parser.add_argument("--cwd", default=None, help="checkout to check (default: current directory)")
    args = parser.parse_args(argv)
    code, message = check(args.seat, args.cwd, coordinator=args.coordinator)
    print(message, file=sys.stderr if code else sys.stdout)
    return code


if __name__ == "__main__":
    sys.exit(main())
