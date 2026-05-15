### decomper/c24-recipe-wave-2

**Goal:** Continue brief 101's C-24 recipe application
chain. Wave 1 hit 12 / 17 = 71% yield with 816 bytes —
both gates pass with significant margin; up to 2 follow-
up waves are allowed under the self-extend clause. Wave 2
targets another 10-15 candidates from the remaining 32 in
the broader 49-candidate cross-corpus pool, plus
**opportunistic C-25 / C-26 application** when candidate
asm signatures match those walls.

**Context — what brief 101 produced:**

12 ports / 816 bytes / 71% yield. The 12 covered 12
distinct sub-patterns under the C-24 umbrella:
strict-signature matches (push {lr}; sub-sp), callback-
table-struct dispatch, helper-then-dispatch, masked-flag
check + dispatch, lazy-alloc + dispatch, alloc + register
+ dispatch, set-bit-and-dispatch, node walk + per-node
callback, etc. **5 reg-alloc-blocked skips** (mwcc 1.2/sp3
reliably picks different scratch register than natural
source).

**Recipe refinements brief 101 surfaced — apply forward:**

1. **`flags |= mask` vs `flags = flags | mask`:** the
   compound-op form (`|=`) coerces dedup'd codegen for
   `flags = flags | mask` shape. If brief 101's wave 1
   used the non-compound form somewhere and it didn't
   match, switch to `|=`.

2. **Hoist fn-ptr load before conditional branch:** force
   speculative `ldr` of the function pointer by writing
   `fn_t fn = ctx->fn;` OUTSIDE any `if` block guarding
   the call. mwcc 1.2/sp3 emits the speculative load to
   keep the function pointer in a register across the
   branch.

3. **`do { ... } while (p != 0)` instead of `while`:**
   when the target has no entry null check (i.e., orig
   doesn't branch-over-the-body at function start), use
   `do { ... } while (p != 0)` to force the loop body
   to emit before the test.

**Candidate selection — wave 2:**

- **Remaining 32 candidates** from the 49-pool minus
  brief 101's 17. Re-enumerate via the cross-corpus
  signature scan brief 099 documented (indirect call +
  ≥ 2 LDR-from-pool to same slot).
- **Skip the 5 reg-alloc-blocked candidates from brief
  101's funnel** unless willing to retry with a permuter
  sweep (out of scope for this brief). Specifically:
  `func_02054314` / `func_02084a9c` / `func_02084ac4` /
  `func_020480b4` / `func_020525dc`.
- **Skip P-class candidates** per the existing skip-list
  (P-N signed-modulo peephole, P-4 reg-alloc swap,
  P-1..P-8 family).
- **Wave 2 size:** 10-15 candidates. Prioritize 0x20-0x60
  size band again — brief 101 worked example was 0x40,
  smaller iterates faster.

**Opportunistic C-25 / C-26 application:**

While scanning wave 2 candidates' asm signatures, also
check for the **C-25** and **C-26** wall signatures
brief 100 just codified:

- **C-25 (W-N temp-reg / store-reload pattern):** asm
  signature is `orr rN, rM, #imm; str rN, [...]; ldr rM,
  [...]; bic rM, rN, #imm2` — intermediate write to
  higher-N reg, store, reload, bic into lower-N reg. If
  spotted, split bitfield-chain expression into two
  statements (per the codegen-walls.md C-25 entry).
  Default `2.0/*` SPs work; no routing needed.

- **C-26 (critical-section + helper-signature
  mismatch):** asm signature is `bl OS_DisableIrq` →
  field-write → `bl <helper>` (where the helper's first
  non-prologue instruction overwrites r0, e.g. `ldr r0,
  [pc, #...]`) → `bl OS_RestoreIrq`. If spotted, declare
  the helper as **no-arg** in C source (`extern void
  helper(void);`) and route the caller via `*.legacy.c`
  (1.2/sp2p3).

- **CRITICAL — brief 100 NEGATIVE finding:** try
  **natural form FIRST** before invoking C-26 routing.
  4 critsec candidates byte-match natural form
  (`func_02034754`, `func_02095484`, `func_0208a684`,
  `func_02032e8c`); brief 097's broad classification was
  over-inclusive. The brief 100 NEGATIVE pattern likely
  applies elsewhere too — natural form is the right
  first-pass attempt for any new wall classification.

**Method:**

1. **Enumerate wave 2 candidates** via the C-24 signature
   scan + brief 101's strict/broad subset accounting.
2. **Per-candidate workflow** — same as brief 101:
   write `.legacy_sp3.c` source (single-global form for
   C-24); add delinks.txt entry; `ninja rom`;
   `ninja objdiff && python tools/progress.py`; verify.
3. **Opportunistic C-25 / C-26 checks** during the asm
   review pass.
4. **Per-byte-identical:** commit. Per-byte-diff:
   investigate (sub-variant? different wall?). Per-skip:
   document the reason in the wave PR funnel.

**Self-extend clause:** Same as wave 1. Yield ≥ 40% +
bytes ≥ 250 triggers wave 3. Cap at 3 waves total (this
is wave 2).

**Non-scope:**

- ❌ Permuter sweeps (separate future brief).
- ❌ Walls research on patterns not yet codified (those
  are cloud brief 103+ scope).
- ❌ Cross-region apply for the new wave 2 matches
  (await wave 3 + pool accumulation; cross-region wave
  is a brief 104+ candidate).
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 5 EUR matches in wave 2.
- ≥ 40% yield, ≥ 250 bytes (self-extend gate).
- Per-wave PR with funnel + per-candidate table +
  opportunistic C-25 / C-26 applications flagged.
- All 3 regions stay at 24/27 baseline.

**Branch:** `decomper/c24-recipe-wave-2`

**After this brief lands:**

1. **Strong wave 2 (yield ≥ 50%):** wave 3 self-extends.
   The 49-pool may absorb most of itself by wave 3 end.
   Brief 104 candidate: cross-region apply for the
   accumulated brief 101 + 102 + 103 matches.
2. **Mid-band wave 2 (40-50%):** brain queues brief 104
   = either C-26 strict-sig wave OR predicated-cascade
   wave (depending on brief 103 outcome).
3. **Wave 2 floors (< 40%):** chain closes. Brain
   pivots to next single-region pool (C-26 strict-sig
   if cloud brief 103 closes with a recipe; otherwise
   data-tier scoping).
