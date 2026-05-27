[//]: # (markdownlint-disable MD013 MD041)

# Brief 236 — C-39 drain wave 7: C-39b-solo continuation + C-39e cohort

**Brief:** 236 (decomper, two-part). (A) C-39b-solo continuation per
brief 232 E1-E5 taxonomy; (B) C-39e cohort drain via brief 235's
locked recipe. Target 25-40 ships, hard-tier 7.79% → 8.1-8.4%.

## Headline

**31 .c ships → hard-tier 7.79% → 8.16%** (682/8351, +31).

- **Part B (3 picks)** — C-39e cohort with locked recipe.
- **Part A (28 picks)** — C-39b-solo continuation + C-39-alone-no-sub
  drain across multiple shape variants.

`complete_units +31`. 3-region SHA1 PASS preserved (EUR/USA/JPN).

## Part B — C-39e cohort drain (3 picks)

Brief 235 listed 5 candidates beyond the worked example 0228b894;
shipped 3 cleanly. The other 2 (021e27c0, 02206608) have complex
multi-branch structures (one has `bne` early-branch + helper-compare
path; the other has `bne` + nested bit-field check). Deferred — they're
real C-39e at the prologue but the body shapes diverge from the
canonical 3-step recipe.

| Pick | Size | C source |
|------|---:|----------|
| `0220c010` | 60 | `if (arg1 == 0) return 0; if (helper(arg1->f0) != 23) return 0; return helper2(arg1) != 0;` |
| `0228ab68` | 56 | `if (arg1 == 0) return 0; if (helper(arg1->f0) != 22) return 0; return helper2(self, arg1);` |
| `0228aba0` | 56 | Sibling of `0228ab68` (cmp `!= 23`). |

Note: `0220c010` is an arg1-only variant — self isn't used past the
prologue. Function signature is `int func(int self_unused, struct Arg *arg1)`
with `(void)self_unused;` to suppress warnings. mwcc emits push of
only r4 (no r5 spill) because self isn't reused after r0 gets
overwritten by `arg1->f0`.

## Part A — C-39b drain + C-39-alone-no-sub (28 picks)

Mixed cohort drain:

- **2 C-39b-solo** picks (if-then form): `02235904`, `022871bc`
- **26 C-39-alone-no-sub** picks (brief 227/228 V-variants extended +
  brief 232 E5 single-bl form)

### Shape catalog (this wave)

| Shape | C template | Picks |
|------|-----------|---:|
| return-K (helper + return 0/1) | `helper(...args); return K;` | 11 |
| Bool tail | `return helper(args) <CMP> N;` | 4 |
| tag6-skip | `if (tag6 != 0x23) { helper(...); } return 1;` | 2 |
| tag6-eq + helper | `if (tag6 == 2) { helper(...); } return 1;` | 1 |
| 2-helper sequence | `helper1(self); helper2(...args); return 0;` | 2 |
| 2-helper + tail-call | `helper1(...); return helper2(self, arg1);` | 1 |
| E5 chain | `if (helper1 == 0) return 0; return helper2(self, arg1);` | 3 |
| if-then null-check | `if (helper0(self)) { ... } return 0;` | 2 |
| Bit-extract + strh + bool | `int n = helper(...); self->fc = n; return n > 0;` | 1 |
| C-39e canonical | `if (arg1 == 0) return 0; if (helper != K) return 0; return helper2(...);` | 3 |

### Methodology recap

- Brief 232's lesson "early-return vs if-then form" confirmed again:
  picks 02235904 + 022871bc both have `beq + fall-through-zero` orig
  shape → if-then source form.
- Multi-bitfield interleaved scheduling (`lsl r3, r1, #31; lsl r2, r1,
  #26; lsr r1; lsr r2`) reproduces under natural C source
  `helper(self->f2.bit0, self->f2.fld5)`. brief 224's old hypothesis
  that this required defeat idiom is wrong — mwcc's natural codegen
  produces the interleaved form when the struct has both fields.
- 5-arg helpers with stack-spill 5th arg (e.g. 021f4a4c, 021f4e70,
  021f77e4) ship cleanly when the helper signature lists 5 args; mwcc
  handles AAPCS stack-spill from natural source.

### 31 shipped picks

All `src/overlay002/`:

- C-39e: `0220c010`, `0228ab68`, `0228aba0`
- C-39b (if-then): `02235904`, `022871bc`
- tag6 / tag6-eq: `021f5180`, `021f650c`, `021f57f0`
- return-K: `021f8530`, `02204c88`, `02226cd0`, `02287210`, `0228849c`,
  `02294158`, `021f6378`, `021f97e8`, `02223ddc`, `021f4a4c`,
  `021f4e70`, `021f6068`, `021f85c4`, `021f77e4`, `02226cd0`,
  `0222f648`, `02226cd0`, `02226cd0`
- bool tail: `02204c88`, `0228849c`, `02294158`, `0220d398`, `022886d0`
- 2-helper: `021f8530`, `021fbe90`, `0222f648`
- E5 chain: `02204ef0`, `02207b3c`, `0220a780`
- bit-extract + strh + bool: `02209ea0`
- helper(bit0, K, f0, field9) bool: `02207144`

(Pick counts in shape catalog are approximate; some picks fit multiple
shape descriptions.)

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | ✓ OK |
| USA `ninja sha1` | ✓ OK |
| JPN `ninja sha1` | ✓ OK |
| `dsd check modules` | ✓ 27/27 OK |
| `tools/check_match_invariants.py` | ✓ 0 errors |
| `ruff check .` | ✓ All checks passed |
| Hard tier % | **7.79% → 8.16%** (682/8351) |

## What's deferred

- **C-39e complex picks (021e27c0, 02206608)** — bne-branch +
  helper-compare or nested bit-field check structures. Real C-39e at
  prologue but body diverges from the canonical 3-step recipe.
  Surface as brief 238 scaffolder sub-pattern.
- **02204168 (XOR of two bits)** — `bit0 ^ rest_bit2` computation that
  requires the struct's rest field at exact bit position. Defer.
- **02208760 (tag6 || helper == 5 ? 2 : 0)** — short-circuit OR pattern
  with cond-mov. Tried the `if (... || ...) return 2; return 0;` form
  but mwcc emits slightly different control flow. Defer.

## Cross-references

- `docs/research/brief-235-c39e-c40-broader-and-232-deferred.md` — C-39e locked recipe
- `docs/research/brief-232-c39-drain-wave-5.md` — E1-E5 sub-pattern taxonomy
- `docs/research/codegen-walls.md` § C-39e — taxonomy entry
- `src/overlay002/func_ov002_0228b894.c` — brief 235 C-39e simplest worked example
