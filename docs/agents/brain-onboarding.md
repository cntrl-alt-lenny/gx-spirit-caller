[//]: # (moved verbatim from AGENTS.md 2026-07-15 — Codex 32KB instruction-cap diet)

# Brain onboarding on a fresh machine


If you're a brand-new `brain` session starting cold on a PC or Mac
that has never built this repo, do these one-time steps before you
touch any PR. cntrl_alt_lenny will typically say something like *"you are
the brain, review everything"* — that's your cue to run this checklist.
Works the same regardless of which LLM (Claude Code, Codex CLI, etc.)
is backing the session.

1. **Be at the repo root.** `git clone https://github.com/cntrl-alt-lenny/gx-spirit-caller`
   then `cd` into it, or `cd` into an existing clone.
2. **Sync with GitHub.** `git fetch origin && git pull --ff-only`.
3. **Drop the baserom in place.** Copy `baserom_eur.nds` (SHA-1
   `1da50df7c210fae96dc69b3825554b9ce13b4f75`) to `orig/baserom_eur.nds`.
   Ask cntrl_alt_lenny to AirDrop / iCloud-share / USB-transfer it from a machine
   that already has it — do **not** re-dump or redownload. The SHA-1
   is pinned, any other copy will fail `tools/configure.py`.
4. **Install Python deps.** `python -m pip install -r tools/requirements.txt`
   (gets `requests`, `pyperclip`). Python 3.11+ required per CLAUDE.md.
5. **Generate the build graph + verify the ROM.** `python tools/configure.py eur`
   (verifies baserom SHA-1 and writes `build.ninja`). **Do this again
   every time new `.c` files appear in `src/` from a decomper PR** — the
   linker will otherwise error with *"ov005_*.o not found"*.
6. **First build.** `ninja rom`. First run auto-downloads the native
   `dsd`, `objdiff-cli`, and `mwccarm`/`mwldarm` (via `wibo` on Linux,
   `wine` on macOS, direct on Windows). Takes a few minutes. Subsequent
   builds are seconds.
   - **macOS prerequisite** (replaces deprecated `wine-stable`):
     `brew install --cask Gcenx/wine/game-porting-toolkit`. Apple
     Silicon also needs Rosetta 2 (`softwareupdate
     --install-rosetta --agree-to-license`). Existing brains
     migrating from `wine-stable` should
     `brew uninstall --cask wine-stable` first to satisfy the
     cask's conflicts-with check. Rationale + tested baseline:
     [`docs/research/wine-migration.md`](../../docs/research/wine-migration.md).
7. **Confirm the baseline.** Run the full 3-region gate:
   `python tools/gate3.py` (reconfigures + clean-tree `ninja sha1` for
   eur/usa/jpn, then the pytest suite). All three regions rebuild
   byte-identical and **all 27 modules × 3 regions check green** — a diverging
   region or a `dsd check` regression is a REAL break, not an expected
   artifact. (The old "24/27, main/DTCM/ov004 expected to fail" baseline is
   obsolete — those closed in briefs 138–140.)
8. **Read [`docs/state.md`](../../docs/state.md)** and tackle whatever the
   *Next-brain TODO* section lists.

Afterwards, your loop is: fetch, read `docs/state.md`, review any open
PRs (`gh pr list --state open`), verify them locally (configure +
ninja rom + `./dsd.exe check modules -c config/eur/arm9/config.yaml`),
merge or comment, update `docs/state.md`, write briefs for cntrl_alt_lenny to
paste to other agents, repeat.
