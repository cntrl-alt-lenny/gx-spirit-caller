### decomper/cluster-d-wave-1-d1

**Goal:** First production application of brief 121's
**cluster D-1 dispatch table recipe**. Brief 123 v3's
`pointer-code` shape filter surfaces clean D-1
candidates. ~71 candidates in the D-1 sub-pool. Wave 1
picks 10-15 dispatch tables.

**Context — what brief 121 codified:**

- D-1 sub-cluster: dispatch / pointer tables. Native
  fnptr_table shape + 32 brief-117 4-byte pointers
  folded.
- Recipe: `.c` with `extern` refs + `void *[]` array.
- **Naturally 4-aligned by construction** (4 × N
  pointers) → no W6 risk.
- Worked example: `src/main/data_0210210c.c` (20
  bytes = 5 × pointer).

**Recipe template:**

```c
/* src/<module>/data_<addr>.c */
extern char data_<addr1>;
extern char data_<addr2>;
/* ... more externs ... */

void *data_<addr>[N] = {
    &data_<addr1>, &data_<addr2>, ...
};
```

Notes:
- One TU per dispatch table.
- `extern char` for each referenced symbol; cast via
  `&` for the array elements.
- No `const` qualifier (preserves `.data` placement
  per brief 117's W4 finding).

**Wave 1 method:**

1. **Enumerate the D-1 pool** via brief 123 v3:

   ```bash
   python tools/data_worklist.py --version eur \
       --cluster D --top 30
   ```

   v3's cluster D filter now includes `fnptr_table`
   + `pointer-code` shapes. Filter to size ≥ 0x10
   (≥ 4 pointers) for dispatch tables specifically;
   smaller size-4 pointer-code candidates are D-1
   too but trivial (single function pointer).

2. **Pick 10-15 candidates** for wave 1 from the top
   of the worklist (highest cross-module reader
   density first). Skip:
   - Candidates that reference symbols across multiple
     overlays (need `extern` from each overlay's
     namespace).
   - Candidates with mixed code+data pointers (those
     are D-2 territory or need typedef discovery).

3. **Per-candidate workflow:**
   - Identify the target addresses each pointer slot
     resolves to (use brief 123 v3's pointer-code
     classification output).
   - Map each target address to its symbol name in
     `symbols.txt`. Most should be `func_*` placeholders
     or named SDK fns.
   - Write source as `src/<module>/data_<addr>.c`.
   - Add TU claim to the appropriate `delinks.txt`.
   - `ninja rom` + `dsd check modules`.
   - Verify byte-identical via `xxd` against extract.

**Self-extend clause:**

If wave 1 covers 12+ candidates cleanly, optionally
extend to 20-25 in the same brief. Pool drains in 4-6
waves.

**Non-scope:**

- ❌ D-2 application (separate brief 126+; recipe
  ready but different shape).
- ❌ D-3 (complex nested) — deferred to typedef tool.
- ❌ Cluster C / B / A work.
- ❌ Function-tier carryovers.
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 10 cluster D-1 dispatch tables claimed.
- All 3 regions stay at 25/27 baseline (no regression).
- Per-wave PR with funnel + per-table byte-match
  confirmation + cross-module reloc notes.

**Branch:** `decomper/cluster-d-wave-1-d1`

**After this brief lands:**

1. **D-1 drain trajectory established** — 4-6 waves
   close the sub-pool.
2. **D-2 application brief 126 candidate** — ~30-40
   scalar struct/byte arrays per brief 121's recipe.
3. **Cluster C wave 2 (Pattern 1 continuation)** —
   parallel work; 110-150 Pattern 1 candidates
   remaining.
