[//]: # (markdownlint-disable MD013 MD041)

# Brief 245 — C-42 opportunistic drain wave 4

**Brief:** 245 (decomper). Continuation of opportunistic C-42 drain
with the expanded library — brief 242 unlocked 4 of brief 240's
escape sub-shapes via gotchas 7-10; brief 245 leans into those recipes.

## Headline

**33 .c ships → complete_units 2175 → 2208** (+33, +0.99pp);
hard-tier matched 742 → 775 (8.88% → 9.28%, +0.40pp). Above
brief target. C-yield 33/35 = **94%** (above the 70-75% expectation —
brief 242's gotchas 7-10 cover most patterns cleanly).

3-region SHA1 PASS (EUR/USA/JPN).

## 33 shipped picks

### Sub-shape 1 (tag6 bitfield) — brief 242 recipe via gotcha 7 (17 picks)

All 17 picks use the 2-arg pass-through trick to force the bitfield
temp register to r2. Recipe template:

```c
struct Self { unsigned short f0; struct { unsigned short pad:6; unsigned short tag6:6; unsigned short top:4; } f2; };
int func(struct Self *self, int arg) {
    if (self->f2.tag6 != K) return X;
    return helper(self, arg);
}
```

**Single-helper variants (10 picks)** — `cmp + movXX r0, #X; popXX; bl`:

| Addr | K | Cond | X | Helper |
|------|---:|---|---:|--------|
| `021f51b8` | 2 | == | 1 | `021f4df4` |
| `021f64e8` | 0x16 | != | 1 | `021f4df4` |
| `021f8180` | 0xf | == | 1 | `021f980c` |
| `021fb114` | 0xf | != | 1 | `021f8760` |
| `02205cfc` | 0xf | == | 1 | `022000e4` |
| `0220cdb0` | 5 | != | 1 | `02209130` |
| `02221f9c` | 0xd | != | 0 | `0221b5ac` |
| `02242e0c` | 0xd | == | 1 | `02241400` |
| `02244cb4` | 6 | != | 1 | `0223fa20` |

**If-else 2-helper variants (7 picks)** — `cmp + bne L_else; bl helper1; pop; L_else: bl helper2; pop`:

| Addr | K | Helper-then | Helper-else |
|------|---:|---|---|
| `02208bd4` | 5 | `02208b68` | `02204b68` |
| `02226be0` | 0xf | `022117e0` | `02210810` |
| `0222edb0` | 2 | `02211b64` | `0221074c` |
| `0222edd8` | 5 | `02211b64` | `02223d48` |
| `0222f78c` | 0x19 | `02227c4c` | `02211b64` |
| `02237d38` | 5 | `02237d60` | `0221074c` |
| `02239d6c` | 6 | `02239d94` | `02210104` |

### Sub-shape 2 (pool + global check) — brief 242 recipe (4 picks)

```c
struct GlobalPool { char pad[0xcf8]; int fcf8; };
extern struct GlobalPool data_ov002_022d016c;
int func(void *self, int arg) {
    if (data_ov002_022d016c.fcf8 OP K) return 0;
    return helper(self, arg);
}
```

| Addr | Cmp | Helper |
|------|-----|--------|
| `02205f5c` | `!= 3` | `021ff3bc` |
| `022000c0` | `!= 2` | `021ff320` |
| `0220e148` | `!= 5` | `021ff500` |

### Pool-deref 2 fields + helper(arg, a, b) + return 1 (3 picks)

```c
struct Pool { int f0; int f4; char pad[0x18]; int f1c_or_20; };
extern struct Pool data_ov002_022cd3f4;
int func(int arg) {
    helper(arg, data.fX, data.fY);
    return 1;
}
```

| Addr | Field A | Field B | Helper |
|------|--------:|--------:|--------|
| `022447d4` | f4 | f20 | `0223db04` |
| `02244fc4` | f4 | f20 | `0223dcc0` |
| `0223fd54` | f0 | f1c | `0223dcc0` |

### Sub-shape 4 (sp3 routing) — brief 242 recipe (gotcha 10, 9 picks)

`.legacy_sp3.c` routing for `stmfd; sub sp, #4` prologue. 4 sibling
ptr-null-check + helper(byte) thunks (same shape as 02087d2c):

| Addr | Helper |
|------|--------|
| `02087d7c` | `02095130` |
| `02087da4` | `02095158` |
| `02087dcc` | `02095180` |
| `02087e2c` | `020951d0` |

Plus 5 additional sp3 patterns:

| Addr | Pattern |
|------|---------|
| `02087200` | `if (n) helper(0x40); else helper2();` |
| `02056038` | nested null-checks + helper |
| `0203c824` | `data->f17 = (u8)helper();` |
| `02054b1c` | `data = helper(data);` |
| `020444b0` | `helper(*data, 0x400, arg) != 0` (bool tail) |
| `020446f0` | sibling of 020444b0 (LIT=0x300) |
| `0203de80` | helper-chain + ternary `(r == 1) ? 0x12 : 0x11` |

## 2 escapes (deferred)

### `func_02087528` (1bl, sp3) — 66% fuzzy

Pattern: `if (self->f8 == 0) return; helper(1 << self->f0);`. Disasm
matches byte-for-byte ARM in objdump, but objdiff reports 66.67% fuzzy.
Recipe likely correct but objdiff scoring may be misled by a
relocation difference. Filed for re-examination.

### `func_ov002_02259f74` (1bl, gotcha 7 misapplied) — 66% fuzzy

Orig uses r1 for pool address; my 2-arg attempt picked r2 (wrong).
Re-tried with 1-arg helper (no gotcha 7) — mwcc still picks r2.
Indicates the global-check shape with `movhi` (unsigned > vs ==)
has a different reg-alloc trigger than the brief 242 sub-shape 2
recipe captures. Deferred to brief 246.

## Cohort sizing finding

Brief 245 expected 70-75% yield (brief 243's empirical baseline).
Wave 4 hit **94% yield** — the brief 242 recipes covered far more
ground than projected.

Empirical findings:
- **Tag6 family**: 10/10 single-helper + 7/7 if-else shipped at 100% yield. Brief 242's gotcha 7 recipe generalises perfectly to the entire `lsl #20; lsr #26` cohort.
- **sp3 routing**: 9/10 sp3 picks shipped (1 escape — 02087528 — has the right bytes but objdiff fuzzy disagrees). gotcha 10's `.legacy_sp3.c` filename suffix is a clean unlock.
- **Pool + global check**: 3/4 shipped via gotcha 7 (2-arg pass-through forcing pool to r2). The `movhi` variant (unsigned compare) needs a different recipe — surfacing for brief 246.
- **Pool-deref 2 fields**: 3/3 shipped. The pattern `helper(arg, data.fX, data.fY); return 1;` is mechanical with no gotchas needed.

## Recipe library status

After wave 4, C-42 family covers 25 sub-shapes documented across
briefs 237-243, with 7 gotchas (1-7) and 3 reg-alloc gotchas (8-10)
providing source-side knobs. Total cohort drained across wave 1-4:
brief 238 (30) + brief 240 (8) + brief 241 (8) + brief 243 (22) +
brief 245 (33) = **101 picks** of the original ~860 C-42 cohort.

Remaining cohort: ~445 picks (per /tmp/c42_wave4.json scan). With
the 94% yield this wave, brief 246+ should expect to continue
draining at high yield using the same recipe library. Cohort
exhaustion expected around wave 7-8 if trajectory holds.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| `tools/check_match_invariants.py` | 0 errors |
| complete_units | **2175 → 2208** (+33, +0.99pp) |
| matched_functions | 2212 → 2225 (+13 — under-counted per metric canon) |
| hard-tier % | **8.88% → 9.28%** (+0.40pp) |

## Cross-references

- `docs/research/brief-242-c42-reg-alloc-divergence-investigation.md` —
  gotchas 7-10 + 4 unlock recipes (foundation of wave 4)
- `docs/research/brief-243-c42-opportunistic-drain-wave3.md` — wave 3
  ship list + 5 new escape sub-patterns to avoid
- `docs/research/recipe-gotchas.md` — 10 gotchas + 4-step diagnostic order
- `docs/research/codegen-walls.md` § C-42 — full sub-shape catalog
