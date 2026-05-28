[//]: # (markdownlint-disable MD013 MD041)

# Brief 251 — productionize the family-hunter tool + C-42 drain wave 7

**Brief:** 251 (decomper). (A) Productionize brief 249's
`/tmp/scan_families.py` prototype as `tools/c42_family_hunter.py` with a
test. (B) Use it to drive C-42 drain wave 7, sibling-family-first.

## Headline

**`tools/c42_family_hunter.py` shipped** (28 unit tests, ruff-clean) +
**29 .c shipped across 14 families** → EUR/USA/JPN SHA1 PASS. Every
family attempted shipped 100 % of its members (0 abandoned families);
the four first-attempt misses were all closed by the existing gotcha
catalog.

**The histogram is the story this wave.** The tool confirms brief 249's
projection to the pick: C-42 has thinned to a long tail. The largest
*actionable* family is now size 3 (one), then everything is size 2 —
and **297 of 365 unmatched picks (81 %) are singletons.** Wave 7 is the
last high-homogeneity wave; wave 8 should pivot. See "Pivot timing".

## (A) The tool

`tools/c42_family_hunter.py` is the productionized form of the brief-249
prototype that drove wave 6's +20 pp yield. It clusters the unmatched
C-42 cohort into exact sibling families by canonicalized-disasm
signature, and emits a size-ranked drain worklist + a family-size
histogram.

### Algorithm (faithful port of the prototype)

1. `dsd dis` the region into the shared asm cache (reuses
   `find_shape_templates.ensure_disasm` — auto-rebuilds when
   symbols/relocs change, so a cold checkout needs no manual setup).
2. Load every C-42 prediction key from `wall_predictions.json`.
3. Drop picks already covered by a `complete` TU in delinks.txt — the
   canonical "matched" signal (`next_targets.is_addr_matched`), which is
   strictly better than the prototype's filename-stem heuristic.
4. Canonicalize each survivor's disasm body — abstract registers,
   branch/data symbols, local labels, and immediates; preserve opcodes
   and operand structure — and SHA-1 the result. `canonicalize_line` is
   a verbatim port of the prototype's `signature()`, byte-checked
   against it on `func_ov016_021b3560` (same hash `a552fa4a89d8`), so
   family hashes stay comparable across waves.
5. Bucket by hash, sort by family size.
6. Flag families owned by another brief by seed membership (Family 5 /
   Family 7 → brief 250) so the worklist skips them, but keep them in
   the histogram so the distribution stays honest.

### Where it fits

| Tool | Signal | Question |
|---|---|---|
| `find_pattern_clusters.py` | reloc signature (exact) | Which matched anchor + unmatched siblings share a reloc sig? |
| `find_shape_templates.py` | opcode-class seq (fuzzy) | Closest clone template for ONE target? |
| `c42_family_hunter.py` | canonicalized full-disasm (exact) | Across the cohort, which sibling families are LARGEST — what to exhaust first? |

### Usage

```bash
python tools/c42_family_hunter.py --version eur               # auto dsd dis
python tools/c42_family_hunter.py --version eur \
    --asm-cache build/eur/find_shape_templates_cache/asm \
    --out worklist.md --json families.json
```

Test: `tests/test_c42_family_hunter.py` (28 cases, stdlib unittest) —
canonicalization per value-class, sibling-hash equality vs
opcode-difference, asm-body parsing (labels/`.word`/pseudo-ops
excluded), cohort assembly (matched filter, body-missing, size sort,
seed exclusion, histogram, worklist).

## Family-size histogram (entering wave 7)

`831 C-42 predicted, 466 matched, 365 unmatched → 329 distinct signatures.`

| Family size | Families | Picks | Cumulative picks |
|---:|---:|---:|---:|
| 4 | 1 | 4 | 4 |
| 3 | 2 | 6 | 10 |
| 2 | 29 | 58 | 68 |
| 1 | 297 | 297 | 365 |

Two of the top-3 families are owned by brief 250 (excluded from the
worklist): the size-4 `a552fa4a89d8` (Family 5, `func_ov016_021b3560`)
and a size-3 `97c1224136d9` (Family 7, `func_0201b690`). That leaves
**30 actionable multi-member families (1×size-3, 29×size-2 = 61 picks)**
on top of 297 singletons.

## (B) 29 ships by family (14 families)

| Family | Picks | Module(s) | Recipe |
|---|---:|---|---|
| `967f3c53` | 2 | ov004 | `h2(0, h1(self+0x3b6), 0x80)` |
| `46f91df6` | 2 | ov010/ov015 | `Fill32(0, h(self)+a1*32, a2*32)` |
| `ae6bf115` | 3 | ov010/18/20 | free-and-null two pointer slots |
| `2244716a` | 2 | ov002 | `if(h1==0)return 0; return h2()` |
| `2ca3cefd` | 2 | ov002 | both-nonzero → 1 (inverted polarity) |
| `4c88563e` | 2 | main | 3-call sequence (**legacy_sp3**) |
| `b755bae1` | 2 | ov010 | 3 sub-inits on self+offset, return self |
| `eb6ca6b0` | 2 | ov010/ov015 | stash 2 args + compute-forward + field helper |
| `02ccf8d8` | 2 | ov010/ov015 | `for i<2: dst[i]=h(ctx,*src++)` |
| `d8f09697` | 2 | ov010/ov015 | `for i<6: dst->arr[i]=h(ctx,*src++)` |
| `f83d4ff8` | 2 | ov010/ov015 | Fill32 a global + reset helper + clear |
| `c70c4c3a` | 2 | ov006/ov021 | 4 sub-inits + `*state=5` + return 1 |
| `d1b39ebf` | 2 | ov002 | stash 2 args to a global + helper + 1 |
| `e77f605c` | 2 | ov002 | 2-case switch on a tag field |

**C-yield: 29/29 = 100 % within the 14 attempted families.** Selection
was deliberately recipe-clarity-first; 14 harder multi-member families
(reg-alloc-divergent, bitfield/P-1, switch-heavy) were left for a later
pass — see "Pivot timing".

## Four first-attempt misses, all closed by the catalog

The wave was a clean test of the gotcha catalog: every miss mapped to a
known entry. (`ninja sha1` is itself the gate, so a miss = ROM hash
mismatch; per-unit `fuzzy_match_percent` localizes it.)

1. **`2ca3cefd` 57 %** — `if(h1==0)return 0; return h2()!=0;` collapsed
   to predicated `moveq/popeq`. Fix: **invert polarity** so both
   `return 0` paths share one epilogue → orig's `beq` + `popne`
   (brief-249 refinement). `if(h1!=0){if(h2!=0)return 1;}return 0;`.
2. **`4c88563e` 71 %** — orig has `push {r4,r5,lr}; sub sp,#4`; mwcc
   2.0/sp1p5 emits the dummy-`r3` push. **Gotcha 10** — route through
   `*.legacy_sp3.c` (mwcc 1.2/sp3).
3. **`d8f09697` 31 %** — mwcc strength-reduced `dst + i*4 + 0x74` into a
   second induction variable; orig recomputes `base + i<<2` with `0x74`
   as the store displacement. That is a **struct field-array access**
   (`dst->arr[i]`, `struct { char pad[0x74]; int arr[6]; }`), not raw
   pointer arithmetic.
4. **`e77f605c` 77 %** — switch tag loaded into r1, orig uses r2.
   **Gotcha 7**, 2-arg pass-through: type the function and case helpers
   `(self, arg)` so the pass-through `arg` keeps r1 live and pushes the
   tag temp to r2.

### New caveat — per-overlay data symbols in same-address siblings

`f83d4ff8`'s ov015 twin first shipped at 91.7 %. The two members sit at
the **same address** in overlapping overlays ov010/ov015 and canonicalize
identically (data symbols abstract to `DATA`), but each references its
**own** overlay's global: ov010 → `data_ov010_021b8c2c`, ov015 →
`data_ov015_021b5d4c`. **Same-address cross-overlay "identical" siblings
share code shape but not necessarily symbol identity** — always confirm
each twin's actual `.word` pool target and `bl` module before cloning.
(The `46f91df6` / `eb6ca6b0` twins were already correct here because
their cross-overlay refs are per-overlay `func_ovNN_*`.)

## Pivot timing (for the brain)

This wave drained the entire top of the actionable distribution (the
lone size-3 + 13 of 29 size-2 families). What remains is **297
singletons + ~16 harder size-2 families** (reg-alloc-divergent pairs
like `0ca11024`/`e7e4cff1`, bitfield/P-1 pairs like `0b94bd45`/
`0d484478`, and pool-indirect shapes). Per brief 247/249, that is the
shape-diverse regime where yield reverts to the 70-75 % floor.

**Recommendation: wave 8 is the last sibling-family pass** (clear the
remaining ~16 size-2 families, expect 70-85 % yield), then **pivot off
C-42**. The singleton tail (297 picks) is no longer a homogeneity play —
it wants the permuter, a `.s`→`.c` upgrade pass, or the Track-2
hard-bucket pilot (brief 241 cluster-scout candidates).

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| `tools/check_match_invariants.py` | 0 errors (4372 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2261 passed |

## Cohort progress

Cumulative C-42 drain across waves 1-7: **183 picks** (154 + 29). Of the
365 unmatched entering this wave, 29 drained → **~336 remain (≈315
distinct signatures)**, now singleton-dominated.

## Cross-references

- `docs/research/brief-249-c42-drain-wave6-sibling-hunt.md` — the
  prototype + homogeneity hypothesis this wave productionizes.
- `docs/research/recipe-gotchas.md` — gotchas 7 + 10 + the invert-
  polarity refinement, all exercised here.
- `tools/find_shape_templates.py` — shares the `dsd dis` cache driver.
