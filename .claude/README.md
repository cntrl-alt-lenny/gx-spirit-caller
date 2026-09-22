# Claude Code adapter

This file is installed into an adopting project as `.claude/README.md`, so a
link in it is a claim about what that project has, not what the framework
repository has. A path only the framework repository contains is written as a
plain reference naming it, never as a link — see the framework repository's
`framework/adapters.md` for why: an installed document may link only to
another installed document.

An **example** adapter, and the reference for the shape described in the
framework repository's `framework/adapters.md`. Nothing in the framework
depends on it. A project with no adapter at all works fine via the universal
launch procedure.

Install with `--adapter claude-code`. Its destination is declared in this
adapter's own `adapter.json` — a file that describes installation and is not
itself installed — as `.claude/` in the target repository, which is where this
tool reads project settings, agents, commands and hooks from.

**The destination is declared, not derived from the adapter's name.** The two
are different things: `claude-code` is how a project asks for this adapter on
the command line, `.claude/` is where the tool looks. Adoption used to build
the second from the first, which put every file in a directory the tool never
reads. The framework repository's `tools/adapters.py` has the manifest format,
and its `tests/test_adapter_install_layout.py` the guards that keep the two
from drifting apart again.

## What it provides

Installed under `.claude/`:

| File | Provides |
|---|---|
| `agents/brain.md`, `agents/worker.md`, `agents/verifier.md` | One seat per **role contract** — exactly these three, never more. Each is frontmatter plus a pointer to the canonical contract. |
| `commands/status.md` | One command that runs the coordinating role's rehydration sequence. |
| `hooks/run_python.sh` | Finds a working Python 3 on this host and runs the script it is given. Generic: one shim for every Python hook, so a second hook needs no second wrapper. What `settings.json` actually invokes. |
| `hooks/save_agent_reply.py` | Mirrors a session's final reply to a shared location, so reports need less manual relaying. |
| `settings.json` | Wires the hook. |

## Specialist executors share the executor seat

A project may declare specialist executor names — `adopt.py --workers
decomper,scaffolder`. **This adapter generates no file for them, deliberately.**
A specialist is the executor contract plus a scope statement, not a second
contract, so there is nothing for a separate seat file to point at: there is no
`docs/agents/roles/decomper.md` to be authoritative.

So a specialist is launched on the generic `agents/worker.md` seat, and its
specialism comes from its scope in `AGENTS.md` and from the brief it is handed.
Adoption says so in its own output when a declared executor has no seat file, so
the adopted layout is never mistaken for offering one file per declared name.

The alternative — generating thin per-name aliases — was rejected: it would make
the tool's file set a function of the project's role vocabulary, which is the
same coupling in the other direction, and each alias would either restate the
contract or point at one that does not exist.

## What it deliberately does not provide

No authority statement, no role definitions, no branch convention, no queue, no
gate. Those are the contract's, and an adapter that restated them would become a
second source of truth that drifts. A test enforces this.

## The inbox is not load-bearing

`hooks/save_agent_reply.py` only fires for this tool. A round run on any other
tool writes nothing there — and a project may well *prefer* a different tool for
the reviewer seat, which makes an empty file the expected case, not a signal.

**A missing or stale file means UNKNOWN.** Never "the task did not happen". The
fallbacks are in the constitution under *Unknown means unknown*. Check the
timestamp before trusting a file that is there.

## Finding a Python 3 without hardcoding one name

`settings.json` invokes `hooks/run_python.sh`, passing the hook script as an
argument rather than naming it inside the wrapper.

That indirection is the fix for a real incident, not a style choice: an earlier
version invoked one hardcoded interpreter name, and on a host where that name
was not on PATH the operating system never started the process — not Claude
Code, not the hook script — so nothing distinguished "misconfigured on this
clone" from "this session had nothing to report". A coordinating session read
that as "no hook" and fell back to inspecting the working tree, which is the
correct fallback for the wrong reason: the convenience was not absent, it was
broken.

The wrapper takes its target as an argument so one shim serves every Python
hook a project wires, rather than needing a new wrapper per hook. That shape
came from edopro-retro-formats, `.claude/hooks/run_python.sh`, which had already
arrived at it while this adapter still hardcoded a single script; this is now
the canonical copy, so the next project inherits it instead of solving it
again.

The wrapper tries `python3`, then `py -3` (Windows), then `python`, and tries
each one *for real* rather than merely checking it exists — a name that
resolves to something other than a working Python 3 fails at parse or import
time, which reads the same as "not found" and moves on to the next candidate.
Swapping the one hardcoded name for `python3` would only move which hosts
break: real projects have shipped with only `python` on PATH, and Windows hosts
commonly have neither `python` nor `python3` but do have `py`.

This assumes a POSIX-compatible shell can run the wrapper at all — true on
macOS and Linux, and on Windows through WSL or Git Bash. Native Windows without
either is not covered, and fails exactly the way a missing Python does: the
Stop hook produces nothing, silently.

## Telling absence from breakage

Three distinct situations produce three distinct pieces of evidence in the
inbox, and a cold coordinating session should not conflate them:

| Evidence | Means |
|---|---|
| A report found with `tools/report.py find --role <role> --task <Brief-ID>` | The convenience worked. Read it, but as evidence, not verdict — same as any agent report. `<role>-latest.md` remains a convenience view, not the durable lookup key. |
| Nothing in the inbox, or only stale entries | **UNKNOWN.** Ordinary and expected whenever a round ran on a different tool, or on no tool with this hook wired. Not a sign of failure by itself. |
| A fresh `claude-code-health.md`, in the same inbox as the reports (`<git-common-dir>/agent-inbox/`, normally `.git/agent-inbox/`), alongside a missing or stale `<role>-latest.md` | **This host's Claude Code adapter is misconfigured**, not merely silent: the wrapper ran and could not find a working Python 3. Fix the host — see above — rather than treating this the same as ordinary absence. |

The health file is written only on failure, by the wrapper itself using plain
shell and `git`, so it does not depend on the very interpreter it is reporting
missing. Its own absence proves nothing — most hosts have a working
interpreter and never write it — but its *presence* is a positive signal that
something here needs fixing, which plain absence never is.
