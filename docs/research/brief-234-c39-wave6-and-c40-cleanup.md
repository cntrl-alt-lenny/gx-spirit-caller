[//]: # (markdownlint-disable MD013 MD041)

# Brief 234 — C-39 wave 6 + C-40 3-pick cleanup

**Brief:** 234 (decomper, two-part). Part A: C-39b-solo continuation.
Part B: C-40 3-pick mechanical cleanup. Target 25-35 ships, hard-tier
7.42% → 7.7-7.9%.

## Headline

**31 .c ships → hard-tier 7.42% → 7.79%** (651/8351, +31).

- **Part A (28 picks)** — C-39 cohort drain across C-39b-solo (5),
  C-39-alone-no-sub (23). All `src/overlay002/`.
- **Part B (3 picks)** — C-40 MMIO bit-extract mechanical cleanup
  (brief 219 deferreds). All `src/main/`.

`complete_units +31`. 3-region SHA1 PASS preserved (EUR/USA/JPN).

## Part B — C-40 3-pick cleanup

Brief 233 locked the recipe; 3 brief-219 picks remained:

| Pick | Pool | Mask | ASR | LSL | Notes |
|------|------|-----:|----:|----:|-------|
| `func_0208df40` | `0x04001008` | `0x3c`  | 2 | 14 (`0xe`) | VRAMCNT_C/D OFS |
| `func_0208e1ac` | `0x0400100a` | `0x1f00` | 8 | 11 (`0xb`) | VRAMCNT_E wide |
| `func_0208e200` | `0x04001008` | `0x1f00` | 8 | 11 (`0xb`) | VRAMCNT_C/D wide |

Recipe template (from brief 233 `mmio-bit-extract.md`):

```c
#define VRAMCNT_x (*(volatile unsigned short *)POOL_ADDR)

void *func_NAME(void) {
    return (void *)((((VRAMCNT_x & MASK) >> ASR) << LSL) + 0x6200000);
}
```

3/3 byte-identical on first attempt. Each .s deleted, .c added,
`config/eur/arm9/delinks.txt` switched `.s` → `.c`.

## Part A — C-39 cohort drain (28 picks)

Mixed cohort:

- **5 picks from C-39b-solo** (E5-style early-return + tail or tag6
  helper-chain):
  `02207204`, `0220ad24`, `021ff354`, `02206a98`, `022070e4`
- **23 picks from C-39-alone (no sub-shape)** — brief 227/228
  bool-from-helper variants with `return CONST` tail instead of bool
  tail. Sizes 0x24-0x34. Single-bl shape but the C-39d detector
  doesn't fire because there's only one `ldrh` (no re-read across
  bl).

### Pattern recap (used this wave)

| Pattern | C source template |
|---|---|
| **E5 chain** | `if (helperX) return 0; if (helperY) return 0; return helperZ;` |
| **tag6 chain** | `if (self->f2.tag6 != 0x23) { int n = h1(self); if (h2(bit0, n, fld9, 0, 0) == 0) return 0; } return 1;` |
| **simple return-K** | `helper(bit0, args...); return 0;` (or `return 1`) |
| **bool tail** | `return helper(bit0, lit) <CMP> N;` |

### Methodology lesson recap

- Multi-helper chains with **stack-spilled 5th arg** (`mov r3, #0;
  str r3, [sp]`) ship cleanly when the helper signature in C
  declares 5 args. mwcc handles the AAPCS stack-spill automatically
  from natural source.
- The `(u16)(1-bit0)` cast pattern (pick `0223fd2c`) **does NOT
  reproduce** under natural `(unsigned short)(1 - bit0)` source — mwcc
  peepholes the redundant cast when source semantics prove the value
  is ≤ 1. Reverted; deferred to brief 236+ scaffolder if the cohort
  grows.

### 31 shipped picks

All `src/overlay002/` unless noted:

| Addr | Module | Size | Pattern | Notes |
|---|---|---:|---|---|
| `0208df40` | main | 0x18 | C-40 | VRAMCNT_C/D OFS |
| `0208e1ac` | main | 0x18 | C-40 | VRAMCNT_E wide |
| `0208e200` | main | 0x18 | C-40 | VRAMCNT_C/D wide |
| `02207204` | ov002 | 0x4c | E5 chain | 2 early-returns + tail |
| `0220ad24` | ov002 | 0x54 | E5 chain | stack-spill 5th arg |
| `021ff354` | ov002 | 0x68 | tag6 chain | brief 224 021f4a00 extended |
| `02206a98` | ov002 | 0x68 | tag6 chain | sibling of 021ff354 |
| `022070e4` | ov002 | 0x60 | E5 chain | 2 early-returns + bool >= 2 |
| `02212b34` | ov002 | 0x24 | return-K | helper(!bit0, 2); return 0 |
| `021f6754` | ov002 | 0x28 | return-K | helper(bit0, 0xffff, 2); return 1 |
| `021f8290` | ov002 | 0x28 | return-K | helper(bit0, f0, 1, 0); return 1 |
| `021f89c0` | ov002 | 0x28 | return-K | helper(bit0, 1, 0, 1); return 1 |
| `022117e0` | ov002 | 0x28 | return-K | helper(!bit0, 1, 1); return 0 |
| `0221a118` | ov002 | 0x28 | return-K | helper(!bit0, 0, 1); return 0 |
| `02220b78` | ov002 | 0x28 | return-K | helper(bit0, f0, 4, 0); return 0 |
| `02225cc4` | ov002 | 0x28 | return-K | helper(bit0, f0, 5, 0); return 0 |
| `02226838` | ov002 | 0x28 | return-K | helper(!bit0, 1, 1); return 0 |
| `022344a0` | ov002 | 0x28 | return-K | helper(bit0, 1, 0, 0); return 0 |
| `0220c2f4` | ov002 | 0x2c | bool tail | helper(bit0, 0x19a7) != 0 |
| `0220c9d0` | ov002 | 0x2c | bool tail | helper(bit0, 0x1a1a) > 0 |
| `02211b38` | ov002 | 0x2c | return-K | helper(bit0, fld9, 1); return 0 |
| `0221a214` | ov002 | 0x2c | 2-helper | helper1(!bit0,1); helper2(60); return 0 |
| `0221eea0` | ov002 | 0x2c | 2-helper | helper1(self); helper2(bit0,0,1); return 0 |
| `0222623c` | ov002 | 0x2c | return-K | helper(!bit0, f0, 17, 0); return 0 |
| `0222a23c` | ov002 | 0x2c | return-K | helper(!bit0, f0, 5, 0); return 0 |
| `022953ec` | ov002 | 0x2c | bool tail | helper(bit0, 0x12d7) > 0 |
| `02295c10` | ov002 | 0x2c | bool tail | helper(bit0, 0x19a4) == 0 |
| `02296a0c` | ov002 | 0x2c | bool tail | helper(bit0, 0x19fd) == 0 |
| `02296ce8` | ov002 | 0x2c | bool tail | helper(bit0, fld5) >= 2 |
| `021f7ff8` | ov002 | 0x30 | return-K | helper(bit0, f0, 1, fld9); return 1 |
| `021f8214` | ov002 | 0x30 | helper-reuse | h1(self); h2(bit0, fld5, -n); return 1 |

## One reverted

- **`func_ov002_0223fd2c`** — `helper((u16)(1-bit0)); return 1`. Orig
  has explicit `lsl r1, #16; lsr r1, #16` cast pair after the rsb;
  mwcc peepholes when source has `(unsigned short)(1 - bit0)` since
  the value is provably ≤ 1. Defer to a focused brief.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | ✓ OK |
| USA `ninja sha1` | ✓ OK |
| JPN `ninja sha1` | ✓ OK |
| `dsd check modules` | ✓ 27/27 OK |
| `tools/check_match_invariants.py` | ✓ 0 errors |
| `ruff check .` | ✓ All checks passed |
| Hard tier % | **7.42% → 7.79%** (651/8351) |

## What's deferred

- **C-39b large picks (0x68+)** — multi-helper chains with global
  flags, MLA-encoded indexing, MMIO global checks. Each needs
  individual recipe research. Defer.
- **Redundant `(u16)(small-value)` cast** (e.g. `0223fd2c`) — mwcc
  peepholes when value is bounded by `1 - bit0`. New brief 236+
  candidate.

## Cross-references

- `docs/research/brief-232-c39-drain-wave-5.md` — E1-E5 sub-patterns
- `docs/research/mmio-bit-extract.md` — C-40 recipe + variant matrix
- `docs/research/brief-230-c39-wave4-cohort-hunt.md` — branch-form discipline
- `src/main/func_0208deec.c` — C-40 worked example
- `src/overlay002/func_ov002_02286f74.c` — brief 232 E5 canonical
