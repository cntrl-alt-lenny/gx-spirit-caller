# Contributing

This is the kind of project that benefits from lots of small, careful
PRs. Everyone's welcome.

## Good First Contributions

- **A single unmatched function** in any overlay. Small wins compound.
- **Better symbol names** — `func_020b3a7c` → `DuelState_ShuffleDeck`, etc.
- **Tooling fixes** — anything in `tools/` that breaks on your platform.

Open an issue first if you're planning a structural change (new
overlay layout, new helper script, toolchain version bump).

## Standard Workflow

1. **Fork & clone** the repo.
2. **Create a branch** off `main`. Naming convention: short, descriptive,
   lowercase with dashes (`match-duel-shufflecard`, `fix-macos-wine-path`).
3. **Follow [Project Conventions](Project-Conventions)** — file layout,
   symbol naming, what not to commit.
4. **Rebuild & verify**:
   ```bash
   ninja                 # compile + link + rebuild ROM
   ninja objdiff         # per-unit diff database
   ninja check           # dsd's module + symbol consistency checks
   ```
5. **Run progress**: `python tools/progress.py` and commit the updated
   `assets/progress-heatmap.svg` if your change affects matched %.
6. **Open a PR** against `main`. Describe what you matched, and paste
   a before/after objdiff snippet if the change is non-trivial.

## Code Style

- Match what the compiler emits — readability follows from matching
  output, not from stylistic choices.
- No hand-written assembly.
- No comments that explain _what_ well-named identifiers already convey.
  Add a comment only when the _why_ is non-obvious.
- C by default. Opt into C++ per-file by naming the file `.cpp`.

## PR Review Signals

| Signal            | What it means                                              |
|-------------------|------------------------------------------------------------|
| objdiff clean     | Your function now matches the original `.o`. Mergeable.    |
| objdiff nearly clean | A handful of instructions differ. Post the diff in the PR. |
| `ninja sha1` green | If your PR gets us across this line, celebrate 🎉          |
| Symbol rename     | Rename `func_<addr>` in `symbols.txt` once the function matches. |

## Editing the Wiki

Wiki markdown lives in [`wiki/`](https://github.com/cntrl-alt-lenny/gx-spirit-caller/tree/main/wiki)
and is synced to the GitHub wiki by a workflow on merge to `main`.

- **Do** edit the files in `wiki/` via PR.
- **Do not** edit the wiki UI directly — direct edits will be
  overwritten on the next sync.

## Reporting a Broken Build

Include:

- OS + architecture (`uname -a` on unix, `systeminfo` on Windows)
- Python version (`python --version`)
- Region (`usa` / `eur` / `jpn`)
- The exact command that failed and its full output
- Whether `ninja extract/<ver>/config.yaml` succeeded

## Credits

Contributors are acknowledged in git history. If you want a specific
mention on the README or wiki (real name, handle, affiliation), add
it in your first PR — we're happy to credit you however you prefer.
