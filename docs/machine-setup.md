# Machine setup (one-time, per machine)

The genuine one-time setup steps for a fresh machine — clone, baserom, Python
deps, toolchain, first build, baseline. This is **not** a role's operating
loop; for who does what and how work gets accepted, see
[`AGENTS.md`](../AGENTS.md).

## 1. Clone and sync

```bash
git clone https://github.com/cntrl-alt-lenny/gx-spirit-caller
cd gx-spirit-caller
git fetch origin && git pull --ff-only
```

Any seat can work in its own clone or linked `git worktree`; a second
checkout needs its own baseroms (next step) and its own `build/`.

## 2. Place the baseroms

For a new linked worktree, link the primary checkout's ROMs into it:

```bash
python3.13 tools/link_baseroms.py <path-to-the-linked-worktree>
```

Run the command from the primary checkout. It finds the primary through Git's
common directory (so it works for linked worktrees, not for an independent
clone), verifies
each available source against the SHA-1s pinned in `tools/configure.py`, and
creates hard links. If an existing target is a byte-identical copy, add
`--replace-copies`; a differing target is always refused. A missing source is
reported and skipped. These files are never committed or redistributed — get
a clean dump from someone who already has one. If the filesystems do not
support hard links, the tool prints a loud warning and falls back to a copy.
The pinned hashes live in `tools/configure.py`; for reference:

| Region | Path | SHA-1 |
|---|---|---|
| EUR | `orig/baserom_eur.nds` | `1da50df7c210fae96dc69b3825554b9ce13b4f75` |
| USA | `orig/baserom_usa.nds` | `9e53dcc74d8a9db4de6b655d62a1da6f5e9c2a83` |
| JPN | `orig/baserom_jpn.nds` | `761fbfc62f4fe74f867e973a5eda91b8e86424f6` |

`orig/` is gitignored and not populated automatically by `git worktree`; use
the tool above for every linked worktree.

## 3. Install Python dependencies

Python 3.11+ is required (see [`BUILD.md`](../BUILD.md)). On a Mac, use
`python3.13` for every project script: macOS ships no plain `python`, and
`/usr/bin/python3` is Apple's 3.9, which lacks `match` statements.

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
- **Windows, native.** `mwccarm.exe` / `mwldarm.exe` run natively on Windows;
  no Wine or other runner is needed ([`BUILD.md`](../BUILD.md) § Per-OS
  prerequisites). The Windows 11 desktop is where the matching factory is
  planned to run (see [`docs/state.md`](state.md)); a Windows setup is
  otherwise unrecorded here.
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
`.c` files land in `src/` from another checkout's work, or the linker errors with
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
`AGENTS.md` § Evidence names as the merge gate for any build-path change;
see there for what evidence a given change actually needs. `gate3.py`'s exit
status cannot be trusted until round C: read its log's own pass and fail lines.

## After setup

Read [`AGENTS.md`](../AGENTS.md) for how work gets assigned and accepted, then
[`docs/state.md`](state.md) for the owner's standing decisions. What is in
flight comes from `python3 tools/fw.py status` and git.
