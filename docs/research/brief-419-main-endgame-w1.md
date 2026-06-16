# Brief 419 — Main (arm9) Endgame Wave 1

**PR:** #951  
**Branch:** `decomper/main-endgame-w1`  
**Date:** 2026-06-15  
**Method:** `asm_escape --whole-function` sweep over all uncarved arm9 main functions

---

## Background

The ov002 scaffolder vein and arm9 main are the last two large veins. Brief 417 drained the
overlay residue (355 ships). This wave opens main.

arm9 main had 243 `.s` files already in `src/main/` before this sweep (pre-existing tracked
files from earlier waves).

## Census

```
Total uncarved in gap objects:  2674
classify-data REFUSE:             53  (kind:data C-absorbed)
classify-data clean:            2621
```

REFUSE rate: 2.0% — nearly all main functions are data-ref-clean.

## Sweep pipeline

1. `get_gap_funcs()` — enumerate F .text symbols from `build/eur/delinks/_dsd_gap@main_*.o`
2. `classify_data_refs()` (in-process, cached config files) — filter REFUSE
3. `asm_escape --whole-function --version eur <func>` (4 concurrent workers)
4. Copy `.s` → `src/main/`, append delinks block; sort at end

## asm_escape fixes required (applied to `tools/asm_escape.py`)

### 1. MCR/MRC coprocessor instruction conversion (b419)

objdump emits: `mcr 15, 0, r0, cr7, cr10, {4}`  
mwasmarm needs: `mcr p15, 0, r0, c7, c10, 4`  
Fix: regex in `to_mwasm()` adds `p`-prefix to coprocessor number and `c`-prefix to register names.

### 2. Tail-call branch (b419)

Functions that branch to the immediately following function have no reloc record for the
branch target. The target address is not in the function's instruction set. Fix: detect
forward branches past the function end → emit `.L_FUNCEND:` label after pool words.

### 3. Conditional LDM/STM mode+condition reorder (b419)

objdump emits `ldmfdne`, `ldmfdeq`, etc. (condition AFTER addressing mode suffix).  
mwasmarm requires condition BEFORE suffix: `ldmnefd`, `ldmeqfd`.  
Fix: regex in `to_mwasm()` matches `(ldm|stm)(fd|fa|ea|ed|ia|ib|da|db)(cond)(...)` and
reorders to `(ldm|stm)(cond)(mode)(...)`.

### 4. rrx / rrxs shorthand (b419)

objdump emits `rrxs r1, r1`; mwasmarm needs `movs r1, r1, rrx`.  
Fix: handler in `to_mwasm()` detects `rrx[s][cond]` and expands to `mov[cond][s] Rd, Rm, rrx`.

### 5. ALU S+condition reorder (b419)

objdump emits `<op>s<cond>` (e.g. `andseq`, `subsge`); mwasmarm requires `<op><cond>s`.  
Fix: general regex `^(\w+?)s(COND_LIST)(\s.*)?$` reorders condition before S flag.

### 6. Cross-function backward/forward branch detection (b419)

Original tail-call detection added ALL non-in-function branch targets to `end_targets`,
causing `.L_FUNCEND` to be placed at wrong position for branches that jump into another
function's body or backwards (cross-function).  
Fix: only add to `end_targets` if `t == approx_func_end` (exactly one word after function's
last instruction/pool word).

### 7. Size overrun bug fix (post-sweep, b419)

**Root cause:** `parse_objdump()` stops at the next `<func_...>:` label in the gap object
disassembly. When a gap object contained an unshipped function with no `func_` label
immediately after a shipped function, `parse_objdump` continued past the declared end
boundary, including 3–6 extra instructions from the following entity.

The `bytes_match()` check used `zip(..., strict=False)` which stopped at the shorter
(gap object) list — so the extra trailing instructions were never compared and the check
PASSED, but the compiled `.o` had extra bytes.

**Three affected functions found and fixed:**

| Function | Declared | Compiled | Extra |
|----------|----------|----------|-------|
| `func_020b2cc4` | 0x5c | 0x68 | +0x0c (3 instr) |
| `func_020b31e4` | 0x1e0 | 0x1ec | +0x0c (3 instr) |
| `func_020b3a7c` | 0x1e4 | 0x1fc | +0x18 (6 instr) |

Total extra: 0x30 bytes in uncompressed arm9.bin. After BLZ compression, this manifested
as 0x3930 bytes extra in the NDS ROM (compression ratio ~123× for these trailing bytes,
since they disrupted a well-compressed region). EUR sha1 failed; after removing the trailing
instructions the gate passed.

The extra instructions were XOR-swap patterns (`eor r0, r0, r1; eor r1, r0, r1; eor r0, r0, r1`)
that are the start of the next (unshipped) function in the gap object. They appear immediately
after the last `bx lr` in the shipped function.

**Fix:** truncate the three `.s` files to their declared sizes by removing the trailing
instructions. Future-proofing note: `asm_escape` should cap `parse_objdump` at the declared
function size (or at the next GLOBAL symbol). A later sweep must re-audit any function whose
gap object had no `func_` label at its declared end.

## Results

```
Ships (sweep + retry):   2600 new src/main/func_*.s files
REFUSE:                    53  (C-absorbed data refs; parked for brief 418 tooling)
no-match:                   0
asm-fail (net):            21  (22 initial − 1 fixed by retry)
  ↳ intermediate-pool:      6  (funcs with `....` literal pools; parked for brief 418)
  ↳ other:                 15  (edge-case encodings; small residue)
Total candidates:        2674
```

## 3-region sha1 gate

```
EUR: gx-spirit-caller_eur.nds: OK
USA: gx-spirit-caller_usa.nds: OK
JPN: gx-spirit-caller_jpn.nds: OK
```

3-region sha1 PASS (2026-06-15, after size-overrun fix to 3 `.s` files).

## Buckets (final)

| Bucket | Count | Notes |
|--------|-------|-------|
| (a) .s shipped | 2600 | byte-identical whole-function (after trailing-instruction fix) |
| (b) intermediate-pool-blocked | 6 | funcs with `....` literal pools (brief 418 tooling) |
| (c) kind:data REFUSE | 53 | C-absorbed; park rule applies |
| (d) other asm-fail / edge-case | 15 | small residue |

## Intermediate-pool-blocked (parked)

| Function | Size | Notes |
|----------|------|-------|
| `func_02099718` | 0x1fc | `.....` pool markers |
| `func_020b21ec` | 0x19c | rrxs + embedded data table |
| `func_020b2d2c` | 0x3b8 | data table decoded as coprocessor instructions |
| `func_020b3c78` | 0x544 | intermediate pool |
| `func_02024630` | 0x1048 | large function, intermediate pool |
| `func_0205dba4` | 0x1ca0 | large function, intermediate pool |

Blocked on `asm_escape` gaining intermediate-pool support (brief 418).

## Region isolation

`src/main/` is EUR-implicit (`configure.py`: "no region prefix → EUR baseline").
USA/JPN have `src/usa/main/` and `src/jpn/main/` for region-specific variants.
EUR carves of arm9 main do not affect USA/JPN sha1 unless the functions differ between
regions. 3-region sha1 PASS confirms isolation is clean.

## Next

- Brief 418: intermediate-pool asm_escape tooling (unlocks the 6 parked functions above)
- Arm9 main ~100 residue `.s` from ov002 scaffolder (brief 416 track)
- Main func_02002678 region-divergent functions (USA/JPN diverge; decomper opens b419)
