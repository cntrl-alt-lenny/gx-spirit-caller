# Brief 526 — port_to_region.py data-symbol gap: root cause + fix

**Decomper, brief 526** (tooling, no delinks — no collision with the c-match
lanes). b523 shipped 2 EUR-only matches (`func_ov006_021b8d9c`,
`func_ov022_021ab460`) because `port_to_region.py` couldn't map the RETRIAGE-tier
`data_*` symbols they reference to a USA/JPN region-sibling. Chasing this down
found the fix is bigger than "no named symbol exists" — the real bug is a
**module-name format mismatch** that silently defeats the porter's primary
data-symbol resolution path for every overlay-targeted reference. Both b523
functions now resolve fully (dry-run validated, not landed).

## The actual root cause: `overlay(N)` vs `ovNNN`

`config/<region>/arm9/**/relocs.txt` records a relocation's target module using
dsd's own syntax — `module:overlay(6)`, or `module:overlays(5,9)` for an
overlay-swap zone. Every OTHER module key in `port_to_region.py`
(`SymbolRef.module`, `target_data_symbols` keys from `symbols.txt`'s directory
layout, `find_region_siblings`'s `Function.module`) uses the `ovNNN` form.
`derive_data_address_mapping()` built its EUR↔target address map keyed
straight off the raw `relocs.txt` string — so a lookup like
`data_addr_map.get(("ov006", 0x0224f3e0))` could **never** hit an entry that was
actually stored as `("overlay(6)", 0x0224f3e0)`. The map wasn't wrong or
empty — it was keyed in a format nothing else in the file ever queries.

This is the *exact* class of bug brief 459 already found and fixed once, in a
different (ephemeral, untracked) copy of the porter: `build/_port_overlay.py`
carries its own `_norm_mod()` doing this identical translation, added in brief
459's "2 porter bug fixes." The canonical `tools/port_to_region.py`, the tool
this brief was asked to extend, never got that fix — brief 459 quietly fixed
a *copy*, not the tool everyone else's briefs cite.

**Fix** (`tools/port_to_region.py`): a new `normalize_module_name()` pure
helper (`overlay(6)` → `ov006`, `overlays(5,9)` → `ov005` using the
first-listed number — mirrors `_port_overlay.py`'s `_norm_mod` exactly),
applied at the `load_full_relocs()` parse boundary so every downstream
consumer (`derive_data_address_mapping`, and therefore `resolve_symbol`'s
whole parallel-reloc tier) sees consistent `ovNNN` keys.

**Impact — re-ran both b523 dry-runs after this ONE fix:**

```
$ python tools/port_to_region.py src/overlay006/func_ov006_021b8d9c.c --target usa --dry-run
#   func_ov006_021b8d9c              → func_ov006_021b8c9c              [HIGH]
#   data_ov006_0224f3e0              → data_ov006_0224f2c0              [EXACT_ADDR]
#   func_0202b0b4                    → func_0202b060                    [HIGH]

$ python tools/port_to_region.py src/overlay022/func_ov022_021ab460.c --target usa --dry-run
#   func_ov022_021ab460              → func_ov022_021ab380              [HIGH]
#   data_021040ac                    → data_02103fcc                    [EXACT_ADDR]
#   data_ov022_021ab9bc              → data_ov022_021ab8dc              [EXACT_ADDR]
```

Both functions, both symbols each, resolve at `EXACT_ADDR` — a **pre-existing,
already-named** target symbol, once addressed correctly. Same result for
`--target jpn`. **No new `symbols.txt` entries are needed for these two ports
at all.** My earlier manual investigation (grepping USA/JPN `symbols.txt` near
the EUR address assuming zero shift) had been looking at the wrong
neighborhood — the real, non-zero shift lands squarely on an existing name.

This one fix likely unblocks more than these two: any overlay-to-overlay or
overlay-referencing-overlay data reference anywhere in the corpus was subject
to the identical silent miss. I did not attempt to quantify the full blast
radius (out of scope — no delinks/build lane this round), but flagging it for
whoever next runs a c-match wave with overlay data references.

## The RETRIAGE-tier synthesis fallback (the brief's literal ask)

Brief 526's framing assumed the gap was "no named USA/JPN symbol exists" — a
real phenomenon even after the module-name fix: dsd only names a data/bss
address once *some* already-analyzed reference in that region touches it: a
symbol reachable only from a not-yet-ported function can be genuinely absent
from the target's `symbols.txt`, address notwithstanding. Implemented per the
brief's instruction, modeled on the b459/461 `_unk`-symbol porter fix (an
address-encoded name needs no target-side lookup, only a correct re-address):

- **`synthesize_data_symbol_name(module, addr)`** — the `data_*` analogue of
  `function_symbol_for()`: `main` → `data_<addr>`, `ov<NNN>` → `data_ov<NNN>_<addr>`.
- **`load_region_data_symbol_kinds(region)`** — kind-preserving companion to
  `load_region_data_symbols()`, so a synthesized entry proposes the correct
  `kind:data` / `kind:bss` / `kind:data(any)` (copied from EUR's own entry —
  bss-ness is a source-level fact that transfers across regions for the same
  logic).
- **`resolve_symbol()`** — when the parallel-reloc map (or the existing D3
  shift-consensus) determines the correct target address but finds no name
  there, it now returns a new confidence tier, **`SYNTHESIZED`** (HIGH/
  `EXACT_ADDR`-equivalent for the `--confidence-floor` check — the address
  itself is exactly as reliable; only the name is new), carrying a structured
  `Resolution.new_symbols_txt_line` / `.new_symbols_txt_path` describing the
  exact companion `symbols.txt` addition needed before the port links.
- **`collect_new_symbols_txt_lines()`** — groups every `SYNTHESIZED`
  resolution's companion line by target path, deduplicated, so landing a
  synthesized port is copy-paste mechanical: append the listed line(s), then
  gate.
- The CLI's dry-run/write/JSON output all now print a distinct
  "⚠ NEW symbols.txt lines needed" block when any resolution synthesized.

**Empirically rare so far.** I scanned all 707 already-EUR-matched overlay
`.c` files referencing a `data_*` symbol through the real fixed resolver
(module-normalized parallel-reloc map + D3 consensus): 1,147 resolved
`EXACT_ADDR`, 9 stayed genuinely `NONE` (untested further — not blocking
anything currently shipped), and exactly **2** hit `SYNTHESIZED` — both of
which turned out to be **false positives from source-code comments**, not
real references: `func_ov007_021b2c58.c`'s comment says "data_021b30b8" (no
overlay prefix) while the actual C code correctly references
`data_ov007_021b30b8`; same pattern in `func_ov016_021b8cd8.c`.
`parse_symbols_in_source`'s regex scans the whole file text, comments
included — a pre-existing, harmless characteristic (unrelated to this brief;
the phantom "resolution" never touches the real reference, since the two
strings don't overlap), not a new bug. So: **the SYNTHESIZED path is
implemented, thoroughly unit-tested against realistic values, and ready for
the first genuine RETRIAGE-tier gap that surfaces — it simply wasn't what
unblocked b523's specific two functions.** The module-name fix was.

## Validation: dry-run only, not landed

Per the brief, `ov006`/`ov022` are brief 525's module — I ran
`--dry-run` for both functions × both target regions (4 runs total, all shown
above/verified) and confirmed clean, full resolution. **I did not write any
`src/usa/`, `src/jpn/`, or `config/*/delinks.txt` changes.** Landing these two
is now mechanical for whoever owns `ov006`/`ov022`: drop `--dry-run`, run for
both regions, confirm the per-region `ninja sha1` gate, done — no companion
`symbols.txt` edits needed for these two specifically.

## Tests

`tests/test_port_to_region.py`, pure-Python, no build/wine dependency (project
convention — `load_region_data_symbols`/`DATA_RE`-style file loaders aren't
directly unit-tested here either; only the parsing regex and resolution logic
are):

- `TestNormalizeModuleName` (6 cases) — the module-format fix itself, singular/
  plural/pass-through/padding.
- `TestSynthesizeDataSymbolName` (4 cases), `TestSymbolsTxtPathFor` (2),
  `TestKindDataRE` (4) — the new pure helpers, using the b523 functions' real
  address/kind values as fixtures.
- `TestResolveSymbolAutoPromote` gained 5 cases covering both synthesis tiers
  (parallel-reloc-map hit + D3-consensus hit, each unnamed), a regression
  check that the ORIGINAL named-target tier-1 path is untouched, and the
  cross-module addressing case (a main reference resolving into overlay
  data). One existing test's expected behavior changed with the fix
  (`test_data_d3_keeps_none_when_shifted_addr_missing` → renamed
  `test_data_d3_synthesizes_when_shifted_addr_unnamed`, now asserting the new,
  more useful outcome instead of the old give-up).
- `TestCollectNewSymbolsTxtLines` (5 cases) — grouping, dedup, sort, and the
  "ignores non-synthesized resolutions" guard.

167 tests in `test_port*.py` pass (95 in `test_port_to_region.py` alone, up
from 89 pre-fix).

## `build/_port_overlay.py` — not touched (untracked, different worktree)

The brief also named `build/_port_overlay.py`. It's gitignored, ephemeral,
and — this round — only present in the `decomper` worktree (a leftover
scratch file from an earlier session), not in this branch's worktree at all.
Its OWN `_region_name_at()` data-symbol lookup is separate code from
`port_to_region.resolve_symbol()` (it doesn't call into it for the primary
path), so my fix does not automatically reach it. Since it's untracked, my
brief-526 diff can't include it — but for whoever next finds a copy of it
lying around: it needs the identical two fixes (its own `_norm_mod` already
exists for module-name normalization, matching mine; it does NOT yet have a
synthesis fallback in `_region_name_at`, so a not-yet-named target address
there still silently drops the reference, leaving the EUR name unrewritten).

## Files touched

- `tools/port_to_region.py` — `normalize_module_name`,
  `synthesize_data_symbol_name`, `symbols_txt_path_for`,
  `load_region_data_symbol_kinds`, `KIND_DATA_RE`, `_synthesize_data_resolution`,
  `collect_new_symbols_txt_lines`; `Resolution` gained two optional fields;
  `resolve_symbol()`'s data branch and the CLI wiring.
- `tests/test_port_to_region.py` — new test classes + 5 new/updated
  `resolve_symbol` cases.
- `docs/research/brief-526-porter-datasym.md` — this doc.
- `docs/research/README.md` — regenerated.

No `src/`, `config/`, or delinks changes — pure tooling, as scoped.
