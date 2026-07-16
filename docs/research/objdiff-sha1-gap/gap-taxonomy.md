# objdiff-100% / sha1-FAIL gap — failure-mode taxonomy

**Status:** build-free analysis, 2026-06-30.
**Key number:** empirical campaign yield on HIGH candidates is ~20–40%. The other 60–80% pass `verify.py` / raw objdiff TUI at 100% but fail `ninja sha1`. This document explains every mechanism and how to close each one.

---

## How the comparison pipeline works (and where each tool stops)

### What `ninja objdiff` produces

`dsd objdiff --scratch --compiler mwcc_30_131 --c-flags "..." --custom-make ninja` generates `objdiff.json`. Each unit has:

- `target_path` → the mwcc-compiled `.o` (raw, unrelocated)
- `base_path` → the dsd-delinked gap `.o` (raw, unrelocated)

The gap `.o` uses **ELF relocs for every pool word**: where mwcc writes a raw 32-bit literal `0x02104f4c` into the const pool, dsd writes a zeroed slot + an `R_ARM_ABS32` reloc record pointing to the external symbol `data_02104f4c`. The linker resolves both to the same final byte, but the pre-link `.o` files have different raw bytes at that position.

### What `verify.py` does

`parse_words` calls `arm-none-eabi-objdump -d -r` on both `.o` files and records `(word_hex, is_reloc)` for each 4-byte slot. `compare_words` then runs:

```python
if mw and ow and (mw[1] or ow[1]):
    continue  # reloc'd → wildcard
```

**If EITHER side has a reloc at position i, position i is skipped entirely.** Because the gap `.o` always has `R_ARM_ABS32` relocs for its pool words, every pool word entry in the comparison is a wildcard. `verify.py` cannot detect pool word VALUE mismatches.

`strip_pool_tail` additionally strips any trailing words that are reloc'd (gap side) or zero-filled (mwcc side). This makes the comparison insensitive to pool entries that differ in count as well, if the extras are at the end.

### What `ninja report` does (the fix)

`ninja report` chains three post-processors before `objdiff-cli report generate`:

1. `objdiff_filter_panic_units.py` — drop crash-trigger units
2. `objdiff_resolve_relocs.py` — apply every `R_ARM_ABS32` and `R_ARM_PC24` reloc to a fictional base, strip reloc tables, write `.resolved.o` sidecars; repoint `objdiff.json` to those sidecars
3. `patch_arm_mapping_symbols.py` — fix `$d`/`$a` mapping symbols for hand-written `.s`

After step 2, both the mwcc `.o` and the gap `.o` have IDENTICAL resolved bytes at pool word positions if and only if they reference the same underlying address. Mismatches are now visible.

**Consequence: `ninja objdiff` + open TUI = fuzzy comparison (pool wildcarded). `ninja report` + open TUI = exact comparison (pool resolved). `ninja sha1` = the ground truth.**

---

## Failure modes

### Mode A — Wrong pool word value (most common in HIGH tier)

**Mechanism:** The C code references the WRONG global at a pool position. The pool entry count and order are correct (instruction bytes match), but one pool word holds the wrong address.

**Why objdiff/verify.py miss it:** The gap `.o` has an `R_ARM_ABS32` reloc for that pool word. `compare_words` wildcards it. The mwcc raw literal sits at the same pool slot index, so the LDR instruction's PC-relative offset is unchanged → instruction byte matches too. objdiff TUI reports 100%.

**Why sha1 catches it:** At link time, the mwcc code loads from the wrong global. The ROM bytes at the pool word differ from orig → hash mismatch.

**Concrete example — `func_02000e34` (HIGH class A, 72B):**

Risk annotation: "Pool-word order/scheduling of the 3 literal loads may reorder vs orig."

The function stores zero into three globals. If the C draft uses `data_02104f4c` for the first LDR but the orig puts `data_02102c60` first (mwcc may schedule stores differently), pool values are swapped. The LDR instructions are at the same PC offsets (pool entries remain at positions 0, 1, 2) but now load wrong globals. objdiff TUI: 100%. sha1: FAIL.

```c
/* Prep draft — may have pool words in wrong order vs orig */
void func_02000e34(void) {
    *(int *)(data_02104f4c + 0xa38) = 0;  // ← may be pool[1] not pool[0] in orig
    *(int *)(data_02102c60) = 0;
    *(int *)(data_021040ac + 0xb64) = 0;
    func_020057dc(func_02001540);
}
```

**Fix:** Use `ninja report` instead of raw `ninja objdiff` to compare, OR use `verify.py --gap` with the actual delinked gap object and inspect the pool word values in objdump output manually. The `ninja report` resolved comparison will flag the mismatch.

---

### Mode B — Wrong callee / BL target (common in HIGH with indirect dispatch)

**Mechanism:** The C code calls function `func_XXXX` but the orig calls `func_YYYY` (different address). Both BL slots have `R_ARM_PC24` relocs. compare_words wildcards both → shows 100%. After linking the BL goes to the wrong function → wrong bytes → sha1 fail.

**Concrete example — `func_02006524` (HIGH class A, 132B):**

Risk annotation: "Three indirect calls reload data_02103da4 each time in orig; binding base would diverge; field offsets guessed."

The function dispatches via function pointers at specific table offsets. If the C draft calls `func_020919d8` but the orig's BLX goes to `func_020919e0` (adjacent entry), both BL encodings have relocs → wildcarded. sha1 fails.

**Fix:** For dispatch patterns, always cross-check the called function address against the `.s` file. BL targets in the `.s` are the ground truth. Do not rely on objdiff for callee verification — use `ninja report` which resolves `R_ARM_PC24` relocs to the correct embedded addresses.

---

### Mode C — Extra .rodata or .data section (invisible to both tools)

**Mechanism:** The C file introduces a `static const` array, a string literal, or a static initialized variable. mwcc places these in `.rodata` or `.data`. The gap object only has `.text` (the function code). The extra section is linked into the ROM at a different location than expected, shifting all subsequent data → sha1 fail.

**Why both tools miss it:** `verify.py` uses `objdump -d` which disassembles `.text` only. `ninja objdiff` in scratch mode compares `.text` functions, not data sections.

**Concrete example — any HIGH candidate that adds `static const u16 table[] = {...}`**

If the prep draft uses a switch lookup table modeled as `static const` instead of an inline if-chain (or vice versa), mwcc may emit the table into `.rodata`. The gap object from `dsd delink` doesn't include that `.rodata` (it lives in a data gap, separately delinked). The extra `.rodata` breaks the link.

**Fix:** Avoid `static const` arrays or initialized static variables entirely. Model switch tables as `if-else` chains or as extern references to existing data symbols. Use `extern const` for any table that already exists in the game's data segment.

---

### Mode D — Pool entry count mismatch (deduplication)

**Mechanism:** mwcc deduplicates identical pool entries. The orig (via the `.s` ship) has two pool words for the same address (one via symbol reference, one via raw literal — to defeat the patcher's trim heuristic). Clean C produces one pool word. The function size changes by 4 bytes, cascading shifts through all subsequent symbols → sha1 fail.

**Concrete example — `func_020071c4` (HIGH class A, 84B):**

Risk annotation: "Orig uses TWO pool words for same addr (patcher trim bypass); clean C dedupes to one — likely 1-word diff."

The `.s` ship has:

```asm
.L_02007210:
    .word   data_02104f1c      ; pool[0] — symbol reloc
.L_02007214:
    .word   0x02104f1c         ; pool[1] — raw literal, bypasses trim
```

A clean C reference dedupes to one pool word. The function shrinks by 4 bytes → ALL subsequent ROM bytes shift → sha1 fails.

**Why verify.py partially catches this:** strip_pool_tail strips the reloc'd pool entries from both sides. If pool counts differ enough that lengths mismatch after stripping, compare_words reports DIFF. But the stripping may consume the reloc'd entry from the gap side, leaving lengths equal, masking the count difference. **This candidate is known-problematic and must be shipped as `.s`** (it's already correctly shipped as `.s` on main). Do not attempt a `.c` replacement.

**Fix:** Candidates flagged with "patcher trim bypass" or "TWO pool words" in the risk annotation are `.s`-only. Mark them as `.s`-class and skip `.c` matching.

---

### Mode E — Instruction scheduling differences (caught by verify.py, but explains the ~20-40% that does pass)

**Mechanism:** mwcc with `-O4,p` schedules instructions for throughput. The prep draft's store order, load-before-use distance, or loop form may cause mwcc to emit a different instruction sequence. This changes instruction bytes → verify.py detects it → reports DIFF.

This is NOT the gap mode; it's the normal iteration loop. Most of the "80% failure" stems from Modes A–D (where the root cause is hidden from the quick comparison). Mode E failures are visible and guiding — they tell you what to reshape.

---

## Summary table

| Mode | What differs | Visible to verify.py | Visible to `ninja report` | Visible to sha1 |
|------|-------------|---------------------|--------------------------|-----------------|
| A — Wrong pool value | Pool word bytes | **NO** (reloc wildcard) | **YES** (resolved) | YES |
| B — Wrong callee | BL target bytes | **NO** (PC24 wildcard) | **YES** (resolved) | YES |
| C — Extra .rodata/.data | Section size | **NO** (only .text) | **NO** (only .text) | YES |
| D — Pool count mismatch | Function size | Partially | YES | YES |
| E — Scheduling diff | Instruction bytes | YES | YES | YES |

**The campaign's 80% false-positive rate on verify.py/raw objdiff is dominated by Modes A and B** — cases where pool words or BL targets use the wrong global/function address, but the instruction-byte comparison is wildcarded.

---

## How to make a candidate sha1-clean

### Step 1 — Use `ninja report` as the gate, not just raw objdiff

The CLAUDE.md workflow shows `ninja → ninja objdiff → open TUI`. This misses pool word mismatches. Add `ninja report` before declaring a match:

```bash
ninja
ninja objdiff
ninja report          # ← runs objdiff_resolve_relocs.py; resolves pool words
# Now open TUI — pool word mismatches are visible
ninja sha1            # final gate
```

### Step 2 — Audit pool words against the `.s` file before writing C

Before writing the `.c`, read the `.s` file (the current ship or the original disassembly) and list every `.word` in the const pool. The `.c` must reference the same globals in the same order:

```
; .s const pool:
.L_addr1:  .word data_02104f4c    → C: *(int*)(data_02104f4c + 0xa38) = 0;
.L_addr2:  .word data_02102c60    → C: *(int*)(data_02102c60 + 0) = 0;
.L_addr3:  .word data_021040ac    → C: *(int*)(data_021040ac + 0xb64) = 0;
```

Force the correct order: write the statements in exactly the order that forces mwcc to load the bases in pool order. Interleaving loads (loading R2, then R1, then R0) can change pool ordering — check the `.s` instruction sequence, not just the pool.

### Step 3 — Verify callee functions by address

Every BL in the `.s` has an explicit target address. Cross-check every `extern void func_XXXXXXXX(void)` in the C draft against the BL targets in the `.s`. Even one wrong callee address causes sha1 failure that verify.py hides.

### Step 4 — Avoid .rodata-generating C constructs

In the C draft:
- No `static const` arrays (use extern data symbols)
- No string literals (no printf strings, etc.)
- No initialized static variables
- Prefer `extern T name;` over `static const T name = {...}`

### Step 5 — Flag `.s`-only candidates upfront

Candidates with these risk patterns are NOT safely matchable as clean C:

- "patcher trim bypass" / "TWO pool words" → `.s`-only, skip
- "pool word dedup" with count mismatch → `.s`-only unless you can force the duplicate

For `.s`-only candidates: the `.s` ship is already correct. Do not invest time on `.c` replacement.

---

## Quick-reference: which gate catches what

| Gate | Catches Mode A | Catches Mode B | Catches Mode C | Catches Mode D | Cost |
|------|---------------|---------------|---------------|---------------|------|
| `verify.py` | NO | NO | NO | Partial | ~2s |
| `ninja objdiff` + raw TUI | NO | NO | NO | Partial | ~20s |
| `ninja report` + TUI | YES | YES | NO | YES | ~30s |
| `ninja sha1` | YES | YES | YES | YES | ~30s |

**Recommended loop:** `verify.py` for cheap instruction-byte iteration → `ninja report` once instruction bytes look right (catches pool/callee mismatches before the full sha1) → `ninja sha1` as the final confirm.
