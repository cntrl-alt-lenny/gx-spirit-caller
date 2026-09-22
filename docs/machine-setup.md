# Machine setup (one-time, per machine)

The genuine one-time setup steps for a fresh machine — clone, baserom, Python
deps, toolchain, first build, baseline. This is **not** a role's operating
loop; for who does what and how work gets accepted, see `AGENTS.md` and
`docs/agents/`. For the current checkout layout (one isolated checkout per
role, nested under the primary checkout), see
[`docs/agents/git-and-isolation.md`](agents/git-and-isolation.md) — a fresh
setup does **not** use the older sibling-folder layout some archived
documents describe.

Moved out of `docs/agents/brain-onboarding.md` and `docs/agents/wine-macos.md`
during the 2026-09-22 adoption cleanup (round 2b), which found those files'
non-setup content stale — see
[`docs/archive/agents-2026-09-22/`](archive/agents-2026-09-22/) for that
history.

## 1. Clone and sync

```bash
git clone https://github.com/cntrl-alt-lenny/gx-spirit-caller
cd gx-spirit-caller
git fetch origin && git pull --ff-only
```

Then set up the isolated checkout your role needs per
`docs/agents/git-and-isolation.md` — the primary checkout is Brain's; every
other role gets its own `.worktrees/<role>` linked worktree.

## 2. Place the baseroms

Copy each region's `baserom_<region>.nds` into `orig/`. These are
never committed and never redistributed — get a clean dump from someone who
already has one. The SHA-1s are pinned in `tools/configure.py` and
`gx-spirit-caller_<ver>.sha1`; `configure.py` verifies them and fails loudly
on a mismatch (do not bypass that check) — see `CLAUDE.md` for the
authoritative table:

| Region | Path | SHA-1 |
|---|---|---|
| EUR | `orig/baserom_eur.nds` | `1da50df7c210fae96dc69b3825554b9ce13b4f75` |
| USA | `orig/baserom_usa.nds` | `9e53dcc74d8a9db4de6b655d62a1da6f5e9c2a83` |
| JPN | `orig/baserom_jpn.nds` | `761fbfc62f4fe74f867e973a5eda91b8e86424f6` |

Every linked worktree needs its own copy of all three (`orig/` is
gitignored and not shared automatically by `git worktree`).

## 3. Install Python dependencies

Python 3.11+ is required (`CLAUDE.md`'s toolchain table; this project
otherwise pins `python3.13` in agent-facing commands on Mac — see
`docs/project-rules.md` § Python and worktree portability).

```bash
python3.13 -m pip install -r tools/requirements.txt   # Mac
python -m pip install -r tools/requirements.txt        # Windows
```

## 4. Toolchain and Win32-runner setup

- **macOS (Apple Silicon), verified:** install the
  [Game Porting Toolkit cask](https://github.com/Gcenx/homebrew-wine) and
  Rosetta 2:

  ```bash
  brew install --cask Gcenx/wine/game-porting-toolkit
  softwareupdate --install-rosetta --agree-to-license
  ```

  `configure.py` auto-selects `wine` from `PATH` on Darwin, which resolves to
  GPTK's `wine64` shim. The older `wine-stable` / `wine@staging` / `wine@devel`
  casks are deprecated and disabled by Apple Gatekeeper as of 2026-09-01; if a
  machine is still on one of those, `brew uninstall --cask wine-stable` first
  to satisfy GPTK's conflicts-with check. Rationale and verified baseline:
  [`docs/research/wine-migration.md`](research/wine-migration.md).
  `configure.py` defaults `WINEPREFIX` to `<worktree>/.wine-lane`
  (auto-created, gitignored) so concurrent worktrees don't serialize on each
  other's wineserver; the `mwld` link step still serializes machine-wide
  regardless (`tools/wine_link_lock.py`).
- **Windows, native — unverified against the current nested worktree
  layout.** `mwccarm.exe` / `mwldarm.exe` run natively on Windows; no Wine or
  other runner is needed (`CLAUDE.md` § Platform notes). Beyond that, this
  document does not assert a specific Windows worktree path: the 2026-09-21
  framework adoption moved Mac to one checkout per role nested under the
  primary checkout, and whether the Windows machine also moved to that layout
  (versus the older sibling-folder convention some archived documents
  describe) has not been confirmed by a session running there. A Windows
  brain should confirm its actual layout against
  `docs/agents/git-and-isolation.md` and record what it finds — see
  `tools/make_kickoff.py`'s own comment on `VERIFIED_WORKTREES` for the same
  gap in kickoff generation.
- **Linux:** `wibo` (`0.6.16`) is auto-downloaded and runs the Win32
  compiler; no manual step.

## 5. First build

```bash
python3.13 tools/configure.py eur    # writes build.ninja, verifies baserom SHA-1
ninja rom
```

First run auto-downloads the native `dsd`, `objdiff-cli`, and
`mwccarm`/`mwldarm` (via `wibo` on Linux, `wine`/GPTK on macOS, natively on
Windows) — takes a few minutes; subsequent builds are seconds. Repeat
`configure.py` for `usa` and `jpn` as needed, and re-run it whenever new
`.c` files land in `src/` from another role's work, or the linker errors with
"`.o` not found".

## 6. Confirm the 3-region baseline

```bash
python3.13 tools/gate3.py --scope all
```

This reconfigures and rebuilds all three regions from a clean tree, verifies
each region's `ninja sha1` is byte-identical, and runs the full `pytest -q
tests` suite. All three regions matching, and all 27 modules × 3 regions
green (`dsd check modules`), is the correct current baseline — a diverging
region is a real break, not an expected artifact. This is the same command
`AGENTS.md` § Evidence discipline names as the merge gate for any build-path
change; see there for what evidence a given change actually needs.

## After setup

Read [`docs/state.md`](state.md) for current project state, then
`AGENTS.md` and `docs/agents/kickoff.md` for how work gets assigned and
accepted.
