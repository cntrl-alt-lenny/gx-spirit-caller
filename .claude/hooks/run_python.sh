#!/bin/sh
# Run a Python hook script with whichever Python 3 this host actually has.
#
#   sh .claude/hooks/run_python.sh <script> [args...]
#
# GENERIC ON PURPOSE. The script to run is an argument, not baked in, so one
# shim serves every Python hook a project wires rather than needing a new
# wrapper per hook. That shape is taken from edopro-retro-formats,
# .claude/hooks/run_python.sh, which had already arrived at it independently
# while this repository still hardcoded a single script -- the consuming repo
# was right, and this is now the canonical copy so the next project inherits it
# instead of solving it again.
#
# THE DEFECT THIS CLOSES. `settings.json` used to invoke one hardcoded
# interpreter name directly. Which name resolves to a real Python 3 differs by
# host: `python3` wherever Python's own installers default to that name,
# `python` on hosts that alias it there instead, `py -3` on Windows via the
# launcher. A name that is not on PATH is not a Claude Code failure and not a
# hook-script failure -- the OS never starts the process, so neither ever runs,
# and the hook completing with nothing to show looks exactly like a session
# that genuinely had nothing to report. That is what happened on a fresh macOS
# machine with only `python3` on PATH: the coordinating role read "no hook" and
# fell back to inspecting the working tree, because nothing distinguished
# "misconfigured" from "absent".
#
# Do not swap the one hardcoded name for another; that only moves which hosts
# break. Try the realistic candidates in order instead, and only if every one
# of them fails to complete cleanly, say so where it can be found -- see the
# health-check section in ../README.md.
#
# This assumes a POSIX-compatible shell can run this script at all, which
# holds on macOS and Linux, and on Windows through WSL or Git Bash. Native
# Windows without either is not covered, and a missing `sh` fails the same way
# a missing Python does: the hook simply produces nothing.
#
# Non-blocking by design, matching the hooks it launches: every path below ends
# in `exit 0`, because a session must never fail to end over this.

if [ "$#" -eq 0 ]; then
    echo "[hook] run_python.sh needs a script to run" >&2
    exit 0
fi

# Each candidate is tried in full, not merely checked for existence: a name
# that resolves but is not actually Python 3 -- an old `python` aliased to
# Python 2, a `py` launcher with no Python 3 registered -- fails at import or
# parse time with a non-zero exit, and the next candidate gets a turn instead
# of the run silently stopping there.
if command -v python3 >/dev/null 2>&1; then
    python3 "$@" && exit 0
fi
if command -v py >/dev/null 2>&1; then
    py -3 "$@" && exit 0
fi
if command -v python >/dev/null 2>&1; then
    python "$@" && exit 0
fi

# Nothing completed cleanly. Leave an artifact a cold coordinating session can
# actually find, distinct from the ordinary silence of a round run on another
# tool -- see "Telling absence from breakage" in ../README.md.
common_dir=$(git rev-parse --git-common-dir 2>/dev/null) || exit 0
inbox="$common_dir/agent-inbox"
mkdir -p "$inbox" 2>/dev/null || exit 0
stamp=$(date -u +%Y-%m-%dT%H:%M:%SZ 2>/dev/null || echo unknown)
printf '<!-- claude-code adapter health: no attempted interpreter (python3, py -3, python) completed %s cleanly; checked %s -->\n' \
    "$1" "$stamp" >> "$inbox/claude-code-health.md" 2>/dev/null
exit 0
