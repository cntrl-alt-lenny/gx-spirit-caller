### claude-cloud/analyzer-bulk-groups

**Goal:** Extend `tools/analyze_symbols.py` with a "bulk candidates"
output — groups of functions that share the same module and identical
byte size, where matching one function likely unlocks the rest as
pattern copies (e.g. the 51 `__sinit_*` templated initializers, or the
12 trivial `bx lr` stubs that all look the same).

**Context:**

- The analyzer already classifies 9,849 functions into 6 tiers and
  writes `build/eur/analysis/targets.md`.
- The highest-leverage next step for the decomper (`claude-pc`) is a
  **bulk match**: find a group of N functions that are almost certainly
  the same CodeWarrior template, match one, then paste the pattern
  across the remaining N-1.
- `libs/runtime/README.md` already documents the 51 `__sinit_*` bulk
  opportunity by hand. This brief asks for that to become a general
  analyzer output — any size/module cluster of 4+ functions, ranked
  by `group_size * 1 / individual_size` (more functions and smaller
  individuals = better leverage).

**Scope:**

- `tools/analyze_symbols.py` — add a `find_bulk_groups()` pass and a
  new section in `targets.md` output.
- `build/eur/analysis/targets.md` — new "Bulk candidates" section
  between "named" and "medium" (or append; brain doesn't care about
  ordering).
- Optionally: a new file `build/eur/analysis/bulk.json` if the JSON
  shape grows unwieldy.

**Non-scope:**

- Do **not** actually disassemble anything. The grouping is purely on
  `(module, size, addr_range)` from `symbols.txt` — no ROM reads, no
  objdiff output. Cloud has no baserom and the analyzer must stay pure.
- Do not touch `src/`, `libs/`, or the Ninja graph. Analyzer is a
  standalone script.
- Do not rename symbols. That's `claude-pc`'s job after matching.

**Success:**

- `python tools/analyze_symbols.py --version eur` runs end-to-end with
  no new errors.
- New "Bulk candidates" section in `targets.md` lists at minimum:
  - The 51 `__sinit_*` functions, split by overlay, grouped by size.
  - The 12 trivial `size=0x4` stubs (4 already matched in ov005, 8
    remaining — plus however many more live in other modules).
- A PR-body table showing the top 10 bulk groups by leverage score.
- Brain verifies: `ninja rom` still succeeds (analyzer is stand-alone,
  shouldn't touch the build, but check anyway).

**Branch:** `claude-cloud/analyzer-bulk-groups`

**Notes for Cloud:**

- The analyzer is already yours (authored on `claude/symbol-analyzer`,
  merged in PR #4). You know the data model.
- `tools/analyze_symbols.py:39` — `FAILING_MODULES = {"main", "dtcm",
  "ov004"}`. Bulk groups in failing modules should carry the same
  `[NB: <module> checksum failing]` warning the per-tier output uses.
- If you find >100 groups, cap at top 20 in the Markdown output and
  put the full list in `bulk.json`. Brain prefers scannable docs.
