[//]: # (markdownlint-disable MD013 MD041)

# Brief 267 — Over-fire drain wave 3

**Brief:** 267 (decomper). (A) Batch-drain StyleA helper-families via
brief-264's templates. (B) Clean frameless-leaf + the fresh C23-noMMIO
tier. Skip the diverse frameless tail + 6 reverted P-candidates (brief
266). Target ~35+.

## Headline

**24 .c shipped, all objdiff 100 % + 3-region SHA1 PASS** — 16
StyleA-real (`.legacy.c`) + 8 C23-noMMIO (default). **24/27 attempted =
89 % yield** (3 Copy32-family reverted). Below the ~35 target **because
the reliable template-family vein is now drained** after 3 waves — this
wave mined the *next* tier of families (dd30 / LCG / 928cc / 97848 /
dc8c-ternary) at high yield, and the residue is the heterogeneous
~50 %-tier the brief told me to skip.

## (A) StyleA-real — 16, new template families

The brief-264 templates (c94 A / b4a4 / B-E) were already drained in
waves 1-2; this wave found + locked the **next tier** of families:

| Family | Picks | Template |
|---|---|---|
| `func_0209dd30` guard-chain | 7 | `r=db88(1,K1); if(r)return r; de5c(K2,a0); r=dd30(K2,0); return r?r:2;` |
| `func_020928cc` global-ptr | 3 | `helper((char*)g+OFF, K); return *(T*)((char*)g+OFF);` (`g`=`data_021a8280`) |
| `func_02097848` setup-guard | 2 | `set fields; if(helper(self,K)==0)return 0; update fields; return 1;` |
| `func_0209dc8c` ternary | 2 | `r=dc8c(); return r ? CONST : load;` |
| `func_0206e504` bool | 1 | `return helper(g, a0) != 0;` |
| `func_0209c0a0` guard-tail | 1 | `r=c0cc(); if(r)return r; return 93bfc();` |

dd30 picks: `0209eb00` `0209edc8` `0209efe8` `0209f030` `0209f0d8`
`0209f120` `0209f168` (per-pick K1/K2 literals); 928cc: `02095cc8`
`02095cfc` `02095d34` (per-pick OFF/K/type); 97848: `02097ff0`
`02098104`; dc8c: `0209d758` `0209e4f8`; e504: `0206e474`.

## (B) C23-noMMIO — 8 (fresh tier, default `.c`)

| Pick(s) | Shape |
|---|---|
| `0202250c` `021b009c` `021aa50c` `021abb40` | **MSVC LCG rand** `s=s*0x343fd+0x269ec3; return (s>>16)&0x7fff` (3 global + 1 in-param) |
| `020a991c` | **glibc LCG** `s=s*0x41c64e6d+12345; …` |
| `02099298` | MD5/SHA **context seed init** (`0x67452301`…`0x10325476` + 2 zeros) |
| `020215ec` | `p=base+idx*0x618; p->f8\|=a0; return p->f4!=0` |
| `02034054` | range check `a1==0x4e85 \|\| 0x59d8<=a1<=0x5dbf` |

The LCG family is a per-overlay PRNG — found **all** instances by
grepping for the `0x343fd`/`0x41c64e6d` constants. `02034054` is notable:
a **3-branch** range check ships fine, where wave 2's **2-branch**
`a0==K\|\|a0==K+9` (`0202f3e8`) failed — mwcc predicates the 2-case form
but branches the 3-case form, matching orig.

No frameless-leaf this wave: the clean shapes (struct-copy / field-arith
/ bit-compare) were drained in waves 1-2; the ≤0x2c residue is the
diverse tail (brief 266).

## Non-shippers — Copy32 family (3) — P-candidate

`0208fd30` `0208fd90` `0208fe58` (16-25 %). The VRAM-copy shape
`if (*g != -1 && size > 0x30) func_02094030(*g, dst, CONST+src); else
Copy32(dst, CONST+src, size);` — the natural template diverges heavily
(control-flow + the `func_02094030` arg reconstruction + the CONST-hoist
into `ip`). Coercible-looking but needs per-pick disasm matching beyond
the 10-min cap. Filed as a lead, not a P-N permanent.

## Yield by tier

```text
StyleA-real (template families) : 16/19 (84%)  — 3 Copy32 reverted
C23-noMMIO                      :  8/8  (100%) — LCG + seed + range
frameless-leaf (clean)          :  0          — drained in waves 1-2
overall                         : 24/27 (89%)
```

## The reliable vein is drained — pivot signal

Waves 1-3 mined the over-fire cohort's **batch-template-able** families:
c94 / b4a4 (w1-2), dd30 / LCG / 928cc / 97848 / dc8c / e504 (w3), plus
the clean frameless-leaf + the LCG/seed C23. A helper-caller sweep
confirms the template helpers (`dd30`/`b4a4`/`928cc`/`97848`/`dc8c`/
`e504`) have **0-3 unmatched callers left**, all the complex
multi-helper / arg-pack / `ldm`-`stm` members.

**What remains of the 614 StyleA-real tier (~570) is heterogeneous:**
`OS_RestoreIrq` critical sections (18, each a unique body), `NO_BL`
leaf-with-frame (25, varied like the frameless tail), memcpy/memset
wrappers (`func_020945f4`, 5), and one-offs — the **~50 %-per-pick
regime**, same as brief 266's frameless tail, not batch-drainable.

**Recommendation for wave 4 / the brain:** the over-fire **cheap**
vein is effectively drained. Either (a) accept ~50 % per-pick yield
grinding the heterogeneous StyleA/C23/frameless tail (and merge it with
brief 266's frameless classification into one "diverse over-fire tail"
effort), or (b) treat the cheap vein as done and **pivot to the
Track-2 cold-RE** work (m2c / dsd-ghidra accelerators in state.md). This
wave's 89 % is the last high-yield template wave.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 24/24 at 100 % |
| `tools/check_match_invariants.py` | 0 errors (4567 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2276 passed |

## Cross-references

- `docs/research/recipe-gotchas.md` § StyleA over-fire families
  (brief-264 templates A-E this wave extends).
- `docs/research/brief-265-overfire-drain-wave2.md` — wave 2; the c94 /
  b4a4 families this wave's helpers follow on from.
- `docs/research/brief-263-overfire-drain-wave1.md` — the cohort tiering.
