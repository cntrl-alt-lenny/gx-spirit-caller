[//]: # (markdownlint-disable MD013 MD041)

# Brief 293 — cold-RE wave 10: drain the .s-hatch class via asm_escape.py + continue the families

**Brief:** 293 (decomper). (A) Continue the sink families (`0229ade0` /
`021ff3bc` / `021ca2b8`). (B) Drain the `<0x100` commutative-add
canonicalisation residue (brief 290's ~93-function class, 47 accessor-helper
members) with `tools/asm_escape.py` — the **canonical** generator (we
standardise on it; `gen_asm_tu.py` is retired in brief 292). Loop/liveness
bodies stay deferred.

## Headline

**16 shipped, all 3-region SHA1 PASS** — 12 via the `.s` hatch
(`asm_escape.py`), 4 `.c` family members. The hatch is now a mechanical drain
step: write byte-near C, run the tool, ship the `.s` it byte-verifies. Its
**REFUSE guard caught 2 non-canonicalisation functions** (a count mismatch and
a register-numbering wall) — deferred with zero false ships.

## (B) .s-hatch drain — `tools/asm_escape.py` (12 picks)

**Recipe (banked):**

```text
write byte-near C (the ov002_core.h accessor template) into src/overlay002/func_X.c
asm_escape.py func_ov002_X --c src/overlay002/func_ov002_X.c --version eur \
    --out src/overlay002/func_ov002_X.s
  -> ✅  : rm the .c (the .s is the TU), add a `complete` .s block to delinks.txt
  -> REFUSE: not a pure commutative-add swap — fix the C or defer (never ship)
3-region ninja sha1
```

The byte-near C is the **0x868 cf1a4/cf1a2 + f30 accessor** (`#include
"ov002_core.h"`): the CSE'd `idx*20` (shared by the `+0x30` f30 read and the
parallel cf1a4/cf1a2 read) is what mwcc canonicalises — the wall the hatch
exists for. The `.c` must declare nothing the header already does
(`data_ov002_022cf1a4`/`021c1e44`/`021c1ef0` are in the header — redeclaring
them is a compile error); `cf1a2` and the non-core helpers are local `extern`s.

Shipped (12):

- **brief-290-verified trio** (the brief-289 "0x90 cf1a4+f30" deferral):
  `021e8b34` `021eb128` `021ebf40`.
- **fresh accessor-helper members:** `021e97bc` `021f020c` `021f208c`
  `021f1458` `021eb300` `021efe44` `021eb630` `021ebfd0` `021ef5a0`. Each
  differs from orig by exactly one commutative `add` (the row-pointer
  `add ACC, idx20` vs orig's `add idx20, ACC`); the tool emits orig's order.

**REFUSE (deferred, no false ship):**

| func | refusal | class |
|---|---|---|
| `021ead68` | instruction count C=45 vs orig=46 | real structure gap (an extra guard the template misses) — needs full RE |
| `0220623c` | 5× `ldr/lsl/cmp` reg differs (`r1/r3` vs `r2/ip`) | **whole-function register-numbering** — a *distinct* wall from the commutative-add swap; not in asm_escape's scope |

`0220623c` is notable: a byte-near C (`if (cf016c[+0xCEC] == self->b0) return 0;
return 021ff3bc(self);`) that is structurally identical to orig but allocates
`r1/r3` where orig uses `r2/ip`. This **register-numbering residue is a new
sub-class** the commutative-swap hatch cannot reach — flagged for the brief-292
scaffolder's characterisation.

## (A) Families continued (4 `.c`)

- **`021ff3bc` predicate** — `0220c5a4`: bail on `021bcf00(bit0)` /
  `021bb90c(bit0, f0)`, else return the `021ff3bc(self, arg1)` query. (This
  caller passes a 2nd arg to the query, so it uses a local 2-arg `extern`, not
  the header's 1-arg one.)
- **`021ca2b8` predicate** (C-39d local-struct) — `022000e4` (cf178
  per-player count slot), `02209e00` (`021bc8c8(bit0, bit0, field5)`),
  `02202e98` (`field6 != 0x23` + `021bb068(0x13f2)` guards).

**Bitfield-offset idiom banked:** an N-bit field at bit P in the f2 halfword
reads as `ldrh; lsl #(32-P-N); lsr #(32-N)`. So `bit0` = `lsl#31;lsr#31`
(P0,W1); `field5` = `lsl#26;lsr#27` ⇒ **P=1, W=5** (right after bit0, *not* bit
5 — the `<<26` is the tell); `field6` = `lsl#20;lsr#26` ⇒ P=6, W=6. Lay the
struct out to put each field at its measured bit.

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | OK (all three) |
| per-pick | `.s`: asm_escape byte-verify ✅ (1 fix each); `.c`: objdump byte-identical |
| `tools/check_match_invariants.py` | 0 errors (4753 warns, pre-existing) |
| `ruff check .` | clean |
| `tests/` (full suite) | passed |

(`src/overlay002/` gains 12 `.s` + 4 `.c`; EUR ov002 `delinks.txt` gains 16
`complete` blocks. No USA/JPN config change. No tool change — `asm_escape.py`
is used as-is; `gen_asm_tu.py` left untouched for brief 292's retirement.)

## Recommendation for the brain

1. **The asm_escape drain has a long clean tail.** ~30 more `<0x100`
   accessor-helper members carry the cf1a4/cf1a2+f30 signature
   (`find_callsites 021c1ef0`/`021c1e44`, filter unshipped + signature). Each
   is one byte-near-C + one `asm_escape` run; the template + bitfield idiom are
   locked. A wave-11 batch could clear 10-15 more.
2. **A new residue sub-class surfaced: whole-function register-numbering**
   (`0220623c`). It is byte-near from C but neither `.c`- nor swap-`.s`-shippable.
   If it recurs, it wants its own hatch (emit orig stream when the only diff is a
   consistent register *renaming*) — distinct from the commutative-add tool.
   Candidate for the brief-292 scaffolder to characterise alongside loop/liveness.
3. **`021ead68`-style count gaps** (the accessor has an extra guard the
   m2c-draft template misses) are real RE, not hatch material — leave for a
   hand pass.

## Cross-references

- `docs/research/brief-290-asm-escape-hatch-generator.md` — the generator +
  the 93-function class sizing this wave drains.
- `docs/research/brief-291-coldre-wave9-families-asm.md` — the families +
  the (now-retired) first-gen `.s` generator this supersedes.
- `src/overlay002/func_ov002_02200378.c` — the C-39d local-struct predicate
  convention reused for the `021ca2b8` family.
- `tools/asm_escape.py` — the canonical `.s` hatch (brief 290/292).
