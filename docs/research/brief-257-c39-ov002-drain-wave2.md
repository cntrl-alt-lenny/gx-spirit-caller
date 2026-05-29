[//]: # (markdownlint-disable MD013 MD041)

# Brief 257 — C-39 ov002 drain wave 2 + 2 recovered C-42 resisters

**Brief:** 257 (decomper). (A) Continue the sole-C-39 ≤0x80 ov002 drain
smallest-first with the bitfield recipe + wrapper→gotcha mapping.
(B) Ship the 2 C-42 picks brief 254 recovered (switch form + 2-D table).

## Headline

**18 .c shipped, all objdiff 100 % + 3-region SHA1 PASS** — 4 recovered
C-42 + 14 C-39 wave-2. 21 picks attempted → **18 shipped / 3 reported =
86 % yield** (in the 70-90 % band). Both recovered C-42 families shipped
first-try (brief 254's recipes validated). The C-39 wrapper variety
widened (switches, loops, range-guards, global-word guards, null-check
+ bit-compare) — all mapped to existing gotchas + the brief-253
invert-polarity gotcha. The 3 non-shippers consolidate a single new
class: **CSE field-temp reg-alloc**.

## (B) Recovered C-42 resisters — 4 picks, both first-try

| Pick | objdiff | Recipe |
|---|---|---|
| `022abfc0` / `022abff4` | 100 % | **switch** `switch(n){case 0x4b:case 0x4c:case 0x4d:return 0;}` — defeats mwcc -O4 range-fusion (brief 254). `n = -self->f4`. |
| `021b3e5c` / `021b3e94` | 100 % | **2-D table** `*(u16*)(base + (arg0&1)*0x868 + arg1*20)` then `helper(val, arg2, arg3)`; base `data_ov002_022cf1a6`, both members same base/stride, different helper. |

## (A) C-39 wave-2 — 14 picks, all objdiff 100 %

| Pick | Wrapper / technique |
|---|---|
| `02208760` | range-guard (b6_11) + helper, shared `return 2` (invert-polarity) |
| `02288904` | range-guard `b6_11==3` + `helper(1-bit0,1,0) > 0` |
| `02227d58` | `switch(fc)` → helper / `helper(1-bit0,…)` |
| `022298b8` | `switch(fc)` + **gotcha 7** 2-arg pass-through (tag temp r1→r2) |
| `0220b774` | 4-arg `helper(bit0, k, f0, b6_14@4)` |
| `0220cd70` | `helper1(bit0, &fn) >= 3` guard + helper2; fn-ptr pool |
| `0220c9fc` | `r = helper1(bit0, &fn); if r && pre()>=r return 2`; fn-ptr pool |
| `0220c430` | global-word guard (`*(g+0xcf8)==3`) + `helper(bit0,k,f0)!=0` |
| `02221ab8` | 2 nested guards (f0==K, b4_7) + helper, shared `return 0`; `(unsigned)f4>>1` (lsr not asr) |
| `022921a0` | `pre()` + `helper(1-bit0,k) > 0`, invert-polarity |
| `02208fc0` | **loop** `for(i=0..4) if helper(1-bit0,i) return 1` |
| `0228ad20` | null-check arg1 + `arg1->bit0==self->bit0` guard + `helper(arg1)!=0` |
| `022052e0` | like 0228ad20 + `(helper(arg1) & 2) > 0` |
| `0220a434` | `f14` bitfield-guard (b18-19) + `helper1(bit0)<=1` + helper2 |

New per-pick levers exercised: **`(unsigned)x >> 1`** to force `lsr`
over `asr` on a u16 field (`02221ab8`); **gotcha 7 on switch tags**
(2-arg pass-through, `022298b8`, same as wave-1 e77f); **invert-polarity
for the inline-vs-branched body choice** (`02208760` / `022319f4`-attempt).

`18/18 at objdiff 100 %` this session; 3-region SHA1 below is the gate.

## Non-shippers (3 attempted) — reported, not ground on

### CSE field-temp reg-alloc (2) — `02292020`, `022319f4`

When the u16 field @ +2 is CSE'd for BOTH a range/branch test AND the
`bit0` helper-arg, and the helper has ≥3 args, the orig keeps the field
in a high temp (r2/r3) while mwcc allocates it to r1 (folding it into a
later arg's reg). Worked example `02292020` (40→73 % after a polarity
fix; the residual is purely the field reg):

```text
orig:  ldrh r2,[r0,#2]; lsl r3,r2,#18; lsrs r3,…; bne; … lsl r0,r2,#31  ; field in r2, scratch r3
mine:  ldrh r1,[r0,#2]; lsl r2,r1,#18; lsrs r2,…; bne; … lsl r0,r1,#31  ; field in r1
```

`022319f4` is the same (field wants r3, mwcc picks r1; 78 % after the
polarity fix). This is the **same mechanism as wave-1's `02200084`** —
gotcha-7-resistant because the field is loaded at function entry, before
the helper-arg registers are committed, so the allocator takes the
lowest free reg. **3 picks in this class now (02200084 / 02292020 /
022319f4)** → candidate for a classification pass (new C-39 sub-shape
"CSE field-temp" or P-11-class reg-alloc plateau).

### Byte-pack mask fold (1) — `021f4d3c`

`(b1_5 & 0xff) << 8` — mwcc proves the 5-bit field is < 256 and folds
the mask into shifts (`lsl#24; …lsr#16`); orig keeps `and #0xff; …lsl
#8`. No source form observed that forces the explicit `and` on a
provably-small bitfield. 86.7 % (the bit0 half matches; only the b1_5
mask diverges).

## Scope note — the bit0-as-table-index sub-shape is larger than scoped

Brief 257 listed 11 db973 picks for brief 256. This wave found **≥6 more
with the identical `and ip,#1; mul stride; ldr [base, idx]` codegen**
(skipped, not touched): `0222a648`, `0220b6dc`, `0220bbd0`, `02238820`,
`02234894`, `0220e2f0`. The sub-shape is ~17+ picks, not 11 — flag for
brief 256's census.

## For the brain — wave-3 outlook

Remaining sole-C-39 ≤0x80 ov002 after wave 2: **~55 picks**, comprising
(i) more drainable wrappers (global-deref guards like `0220acd8` /
`0222706c`, the `0220d7c0` bit-compare — deferred, not resisters); (ii)
the CSE field-temp class (~handful); (iii) the bit0-table-index
sub-shape (~17, brief 256). **One more C-39 wave** clears the drainable
wrappers; then the field-temp + table-index residue waits on
classification.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 18/18 at 100 % |
| `tools/check_match_invariants.py` | 0 errors (4434 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2264 passed |

## Cross-references

- `docs/research/brief-254-track2-leading-edge-and-c42-resisters.md` —
  the switch + 2-D-table recipes shipped here.
- `docs/research/brief-255-c39-ov002-bit-extract-drain-wave1.md` —
  wave 1; the bitfield recipe + u16/int + invert-polarity levers.
- `docs/research/recipe-gotchas.md` — gotchas 4/5/7 + the
  switch-defeats-range-fusion row.
