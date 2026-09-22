### cloud/per-region-cross-application

**Goal:** Solve the "libs/ ports are region-neutral but their
function symbol-names aren't" problem surfaced by brief 071
wave 2 (PR #445). Ship the refactor + tooling so the 87
existing cross-project ports in `libs/nitro/` actually unlock
EUR + USA + JPN simultaneously (currently they only contribute
to EUR's match count).

**Context — what's broken:**

Brief 064 part 2 (PR #419) explicitly carved `libs/` as
"region-neutral" — `configure.py`'s filter (PR #420) makes
all three regions' builds walk `libs/`. The theory:

> Brief 069's spec: "Each port unlocks EUR + USA + JPN
> simultaneously since libs/ is region-neutral."

The reality, surfaced experimentally in PR #445:

> Wave 2 tried adding a USA delinks.txt entry for
> `libs/nitro/func_0208b16c.legacy.c` at USA's matching
> address. Result: **all 27 USA modules failed checksum**
> (was 24/27 baseline).

Root cause: the `.c` file declares `func_0208b16c` (EUR's
address), but USA's symbols.txt has `func_0208b084` at the
equivalent address. dsd-lcf can't reconcile the name
mismatch and the function lands at the wrong layout position,
cascading into 27 module checksum failures.

**Two approaches** the wave-2 PR sketched out. Brief 073's
research half should pick:

### Approach A — per-region rename to match EUR's port names

Rename USA's `func_0208b084` → `func_0208b16c` (matching
EUR's port name). Same for JPN. Then USA's symbols.txt has
the same name at the right address; same `.c` file lands
cleanly in all three regions.

- **Cost:** 87 ports × 2 regions = 174 symbol renames. Each
  rename triggers `tools/rename_symbol.py`'s cross-TU
  reference cascade (typically 1-3 follow-up symbol changes
  per rename).
- **Pro:** Mechanical, well-understood, doesn't touch port
  `.c` files.
- **Con:** EUR addresses leak into USA + JPN symbol names
  (semantic noise — `func_0208b16c` in USA pretends to be at
  0x0208b16c when it's really at 0x0208b084).

### Approach B — refactor libs/ ports to use upstream NitroSDK names

Change `libs/nitro/func_0208b16c.legacy.c` to declare
`OSi_GetUnusedThreadId` (the upstream NitroSDK name), then
rename in all three regions' symbols.txt to use the same
NitroSDK name.

- **Cost:** 87 port `.c` files refactored + 87 × 3 = 261
  symbol renames + cross-TU cascades.
- **Pro:** Long-term clean naming. `libs/nitro/` becomes
  semantically meaningful (functions named after what they
  actually are). Symbol-archaeology bonus: 87 placeholders
  → 87 NitroSDK names "for free".
- **Con:** Bigger one-time refactor. Risk of cross-TU
  reference breakage if the rename cascade misses references
  in `src/<region>/` files.

**Method (research + impl):**

1. **Toolchain audit.** Survey `tools/rename_symbol.py`'s
   capabilities: does it handle 87-port batches cleanly? Does
   it cascade refs across `src/<region>/` AND `libs/`? If
   gaps, document.

2. **End-to-end smoke test on ONE port** (both approaches if
   feasible, otherwise pick approach A first since it's
   smaller). Verify ALL THREE regions hit 24/27 baseline
   after the per-region cross-application lands for that
   one port.

3. **Decision: which approach scales.** Based on smoke-test
   results, recommend A or B (or a hybrid — e.g., A for ports
   where upstream name is generic stub like `Init_<x>`, B for
   ports where upstream has a meaningful name like
   `OS_GetMacAddress`).

4. **Pilot batch.** Apply the chosen approach to ~10 ports
   end-to-end. Verify all three regions stay at 24/27
   baseline after the batch lands. Capture per-port byte-
   match data for the USA + JPN sides.

5. **Tooling.** If batching reveals friction (e.g.,
   `rename_symbol.py` is too one-at-a-time), write a small
   `tools/cross_apply_libs_port.py` that does the per-region
   rename + delinks.txt entries atomically per port.

6. **Verdict + pilot data.** PR ships:
   - `docs/research/libs-region-naming.md` — decision + one
     worked example
   - `tools/cross_apply_libs_port.py` (if needed)
   - ~10 ports refactored end-to-end as the pilot batch
   - The full 87-port refactor is brief 075 (decomper or
     cloud, depending on toolchain readiness).

**Non-scope:**

- ❌ Touching brief 072 (D5 struct vendoring) — independent.
- ❌ Modifying `port_external_source.py` to emit different
  port names — the naming is a post-port refactor, not a
  port-driver concern. (Although **going forward**, once
  the chosen approach is set, brief 075+'s new cross-project
  ports should emit the new naming directly.)
- ❌ The full 87-port refactor — pilot only (≤ 10 ports).
- ❌ AGENTS.md / state.md edits beyond the new research doc.

**Success:**

- ≤ 10-port pilot batch ships with all three regions at
  24/27 baseline.
- `docs/research/libs-region-naming.md` documents the
  decision with reproducible smoke-test evidence.
- USA + JPN README badges visibly increment by the pilot
  batch's contribution (currently both at 0.19%).

**Branch:** `cloud/per-region-cross-application`

**Priority:** MEDIUM. Brief 074 (cross-project wave 3) is
NOT gated on this — wave 3 can ship EUR-side and add the
USA + JPN per-region wiring afterward via the new pipeline.
But this brief is what makes the 3× compounding multiplier
on cross-project ports actually fire, so the sooner it
lands the better the bang-for-buck.

**After this brief lands:**

1. Brain queues brief 075 (full 87-port cross-application
   refactor — likely decomper-shaped given verification
   overhead, but cloud-shaped if `cross_apply_libs_port.py`
   ships and the work is fully mechanical).
2. Going forward, brief 074+'s new cross-project ports emit
   the chosen-approach naming directly — no post-port
   refactor needed.

## Brain accountability

The "small follow-up" guidance in state.md + the brief 071
wave-2 instructions was wrong. The .c-file-declares-EUR-addr
vs USA-symbols.txt-has-USA-addr conflict is genuinely brief-
sized work that needed its own scoping pass.
