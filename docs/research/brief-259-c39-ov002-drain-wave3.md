[//]: # (markdownlint-disable MD013 MD041)

# Brief 259 — C-39 ov002 drain wave 3

**Brief:** 259 (decomper). (A) Finish the drainable sole-C-39 ≤0x80
ov002 wrappers. (B) Drain the C-39f bit0-table-index picks via gotcha 14.

## Headline

**23 .c shipped, all objdiff 100 % + 3-region SHA1 PASS.** The C-39f
recipe (gotcha 14) drained **21 table-index picks** (all 17 named + 4 of
the additional ones); 2 deferred wrappers also shipped (XOR-array,
global-word guard). **The cohort is NOT closed** — and the reason is a
scoping miss, not a wall: **the C-39f sub-shape is ~42 picks, not 17.**
60 sole-C-39 ≤0x80 ov002 picks remain (20 C-39f + 37 wrappers + 3 CSE
field-temp for brief 258), almost all drainable → **recommend a wave 4**
before the over-fire pivot.

## (B) C-39f table-index — 21 shipped via gotcha 14

The two-lever recipe held across every variant: **`(self->bit0 & 1)`**
reproduces the redundant `and #1`, and a **helper that keeps self+arg1
live** forces the index into ip/r2/r3. All 17 named picks + 4 more:

- **Self-preserved** (`helper(self, arg1, v)`, field→ip): `02205508`
  `0220c940` `0220e108` `02206490` (`<1` guard) `02208720` (`<4`)
  `0220b6dc` (1-bit0, `<2`) `0220bbd0` (`(v>>16)&1`) `02234894` `0220e2f0`.
- **Self-consumed** (field→r0, helper takes bit-derived args):
  `02204a68` `0220b208` `0222a648` (`7-v`) `02238820` (`(v+1)>>1`)
  `022039a4` `022922c0` `02206544`.
- **pre()-gated + double/compare table**: `022056f0` `0220aa64`
  `022958a8` (`<= pre()*0x1f4`) `02296f54` (`*0x12c`) `02291f58`.

Per-pick variation (guard polarity `==0`/`<K`/`(v>>16)&1`, tail
`!=0`/`<3`/`==0`, signed-vs-unsigned `v`, the invert-polarity for the
shared `return 0`) all map to the catalog. A 9-pick generator
(`/tmp/gen_c39f.py`) wrote the self-preserved set; the variants were
hand-written. `21/21 at objdiff 100 %`.

## (A) Wrappers — 2 shipped, several resisters

Shipped: `0223f684` (XOR-indexed int array; **gotcha 4** — orig extracts
bit14 first, so source is `bit0 ^ bit14`), `022066f4` (global-word ==
bit0 guard + `helper(bit0,f0,0) >= 2`).

### Non-shippers (5) — reported, not ground on

| Pick | % | Class | Evidence |
|---|---:|---|---|
| `0223ba28` | 43 | global-chase reg-alloc | XOR fixed (gotcha 4) but the global+field temps land in r1/r2 vs orig's r3/ip |
| `02273b54` | 69 | global-chase reg-alloc | global ptr in r1 vs orig r0 (reused for f0) |
| `0220d7c0` | 41 | CSE field-temp | invert-polarity fixed the branch, but field@2 (b6_11+bit0) temp lands r1 vs orig r3 |
| `022946e4` | 80 | CSE field-temp | field@2 (b12_13 branch + bit0 index) temp r1 vs orig r2 |
| `021f4d3c` | 87 | byte-pack mask fold | `(b1_5 & 0xff)<<8` folded to shifts (mwcc proves <256) — wave-2 carry-over |

`0220d7c0` / `022946e4` are the **same CSE field-temp mechanism brief
258 owns** (field CSE'd for a branch test AND the bit0/index, ≥3-arg
helper, field wants a high reg but mwcc takes r1). The two global-chase
picks are the same reg-alloc failure on a `global->ptr->field` chase.

## Cohort state — NOT closed (60 remain)

```text
remaining sole-C-39 <=0x80 ov002: 60
  table-index (C-39f), drainable via gotcha 14: 20
  other wrappers (mixed: helper-chains + global-chase): 37
  CSE field-temp (brief 258 owns): 3
```

**Scoping correction:** brief 257 flagged ~17 C-39f picks; the real
count is **~42** (17 named + 24 found this wave; 21 shipped, 1 resister,
20 remain). The 20 remaining C-39f are the higher-variation forms (2-D
`mla` index like `0220730c`/`0220ba30`/`0220000c`, two-helper, and
pre()-comparison tails) — all recipe-drainable, just per-pick work. The
37 other-wrappers are mixed (clean helper-chains + the global-chase
reg-alloc class). **A wave 4 closes the ~57 drainable; the ~3 CSE
field-temp + the global-chase reg-alloc residue wait on classification.**

The over-fire worklist (brief 256, 584 cheap picks) remains the
**next-cohort-after-C-39**, but C-39 ov002 wants one more drain wave
first.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 23/23 at 100 % |
| `tools/check_match_invariants.py` | 0 errors (4457 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2264 passed |

## Cross-references

- `docs/research/recipe-gotchas.md` gotcha 14 — the C-39f two-lever recipe.
- `docs/research/brief-256-c39-table-index-and-overfire-scope.md` —
  C-39f classification + the over-fire worklist (next cohort).
- `docs/research/brief-255/257-*.md` — waves 1-2; the wrapper→gotcha
  mapping + the CSE field-temp class (brief 258).
