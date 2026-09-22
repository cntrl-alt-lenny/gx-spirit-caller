### decomper/cluster-a-wave-1-dtcm-parity

**Goal:** First scale-out data-tier wave. Two-part:

**Part 1 — Cluster A `.bss` wave 1.** Per brief 113's
data-tier plan + brief 115's mwasmarm `.s` recipe.
Cluster A is `.bss` (zero-fill) symbol placement —
**structurally easier than function-tier matching**
(no byte-by-byte comparison; just address placement).
Brief 114's `data_worklist.py v2` cluster A filter
enumerates 1586 candidates total; wave 1 picks ~50
from main module.

**Part 2 — Cross-region DTCM parity.** Brief 115 shipped
EUR DTCM but USA + JPN remain at 24/27 because IRQ
handler names aren't in their `symbols.txt` and
`src/dtcm/` is EUR-only. Quick fix: move
`src/dtcm/dtcm_data.s` to `libs/dtcm/dtcm_data.s`
(region-neutral path), promote SDK IRQ handler names
to USA + JPN symbols.txt, add `libs/dtcm/dtcm_data.s`
claim to all 3 regions' `dtcm/delinks.txt`.

**Context — what brief 115 established:**

- Recipe: mwasmarm `.s` source + dsd LCF auto-routing
  via delinks.txt address claims. No
  `__attribute__((section))` or `#pragma section`
  needed.
- mwasmarm syntax: `;` comments, `.extern` for refs,
  `.byte` / `.word` / `.space` directives, no
  `.syntax unified`.
- For `.bss`: use `.space N` for zero-init storage.

**Part 1 method (cluster A wave 1):**

1. **Pool selection** via brief 114's tooling:

   ```bash
   python tools/data_worklist.py --version eur \
       --cluster A --module main --top 60
   ```

   This emits the top 60 cluster A candidates in main
   by cross-module reader density. Pick ~50 by:
   - Skipping symbols already in `.text` (won't happen
     via cluster A filter but sanity-check).
   - Prioritizing higher-reader-count candidates first
     (cross-module density = SDK-fundamental shapes).
   - Skipping any with `kind:bss` placeholder names
     that lack a reasonable type signature (handle in
     a future wave).

2. **Per-symbol workflow:**
   - Identify the symbol's containing section + address
     in `config/eur/arm9/symbols.txt`.
   - Add the symbol declaration to a new
     `src/main/bss/data_main_bss.s` (or similar)
     using mwasmarm syntax:

     ```
     .extern data_<addr>  ; if cross-module referenced
     .global data_<addr>
     .section .bss
     data_<addr>:
         .space <size>
     ```

   - Add TU claim to `config/eur/arm9/delinks.txt`
     pointing at the `.bss` range.
   - `ninja rom` + verify byte-identical (or rather:
     section placement-identical since `.bss` is
     zero-fill).

3. **Verify gate** per brief 115:
   - `dsd check modules -c config/eur/arm9/config.yaml`
   - Main module should still report OK (or flip from
     FAILED to OK if cluster A wave 1 closes the
     remaining cross-module data-symbol relocations
     for ARM9 main).

**Part 2 method (cross-region DTCM parity):**

1. **Move** `src/dtcm/dtcm_data.s` → `libs/dtcm/dtcm_data.s`.
2. **Update** all 3 regions' `dtcm/delinks.txt` to
   claim `libs/dtcm/dtcm_data.s`.
3. **Promote IRQ handler names** in USA + JPN
   `arm9/symbols.txt`:
   - `OSi_IrqHandlerTimer0` through `Timer3` (4 names)
   - `OSi_IrqHandlerDma0` through `Dma3` (4 names)
   - `OS_DefaultIrqHandler` (1 name)
   - `OSi_IrqCallbackTable` + `OSi_IrqCheckBuf` (2 names)
   Cross-reference EUR's symbols.txt for the exact
   address translations per `port_to_region.py`'s
   D2 v2 + D3 auto-promote.
4. **Verify gate:** USA + JPN flip DTCM module from
   FAILED → OK = **3-region DTCM parity at 25/27 each**.

**Self-extend clause:**

If Part 1 yields well (≥ 40 of ~50 candidates land),
self-extend wave 2 with the next 50 candidates from
the worklist. If Part 1 falls flat (< 20 candidates
land), hand back to brain for re-scoping.

Part 2 is a one-shot — small effort, no self-extend.

**Non-scope:**

- ❌ Cluster B / C / D / E waves (separate briefs).
- ❌ ARM9 main module checksum recovery (depends on
  cross-module relocations; eventual side effect of
  cluster A scale-out, not this wave's gate).
- ❌ Overlay 4 recovery (still pending; placeholder-
  injection artifact).
- ❌ Function-tier work (back-burner during data-tier
  arc).
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- Part 1: ≥ 40 cluster A symbols ported (target ~50;
  floor 40).
- Part 2: USA + JPN both flip DTCM to OK → 25/27
  baseline.
- Per-wave PR with funnel + per-symbol table + recipe
  refinements.

**Branch:** `decomper/cluster-a-wave-1-dtcm-parity`

**After this brief lands:**

1. **3-region 25/27 baseline.** All 3 regions report
   DTCM OK. Visual milestone for badge tracking
   (currently DTCM module separately tracked from
   function-tier %).
2. **Cluster A momentum.** Wave 2 (brief 118) inherits
   the recipe. Per brief 113's 1586-candidate cluster
   A pool, ~15-25 waves of 50-100 symbols each cover
   the cluster.
3. **Brief 117 (cloud) cluster B recipe lands in
   parallel,** unblocking brief 120+ scalars work.
