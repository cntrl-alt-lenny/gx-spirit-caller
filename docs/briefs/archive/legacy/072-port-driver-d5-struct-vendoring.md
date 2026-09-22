### cloud/port-driver-d5-struct-vendoring

**Goal:** Extend `port_external_source.py`'s D2+D3 framework
(PR #441) from "header fragments" to **full struct
definitions**. Brief 071 wave 2 (PR #445) surfaced 112 ports
blocked on `incomplete struct/union/class _OSThread/_OSThreadQueue/OSMutex`
compile errors — our `libs/nitro/include/` has forward decls
but not the struct bodies. D5 closes that gap so the framework
unlocks the full-struct-access pool.

**Context:**

Brief 070 D1+D4+D2+D3 shipped a 171-candidate pool but brief
071 wave 2 hit floor at 13 ports / 0.68 precision. The funnel
diagnostic from PR #445 was sharp:

| Stage | Count | Drop reason |
|-------|------:|-------------|
| Sweep OK candidates | 478 | — |
| Port files written | 140 | (CSV duplicates) |
| Compile OK | 33 | **header gaps (112 instances)** |
| Link OK | 21 | callee remap |
| Byte-identical | 13 | reloc remap |

The compile-stage drop dwarfs everything below it. The single
biggest contribution: `incomplete struct/union/class _OSThread`
(69 instances), `_OSThreadQueue` (32), `OSMutex` (11). These
are struct types that pokediamond defines fully but our
`libs/nitro/include/` only forward-declares.

D5 vendors those struct bodies and the framework's existing
relax-refusal logic (PR #441) automatically widens the OK
bucket.

**Method:**

1. **Audit pokediamond's NitroSDK headers** for the top-N
   struct types that brief 071 wave 2 hit:
   - `_OSThread` (in `nitro/include/nitro/os/common/thread.h`
     or similar — verify upstream path)
   - `_OSThreadQueue`
   - `OSMutex`
   - `printfStr` (D4 mentions this as another)
   - Top-5-by-instance-count from a fresh sweep against
     wave-2's HEAD

2. **Vendor full struct definitions into `libs/nitro/include/`.**
   Minimal extraction — only the struct fields the framework's
   `_STRUCT_TYPE_HINT_RE` would touch, plus their transitive
   type dependencies (e.g. `_OSThread.queue` may reference
   `_OSThreadQueue *`). Cap the vendoring depth: if the
   transitive close requires more than ~10 additional struct
   types, leave the outer struct as forward-decl and let it
   stay in the `struct-access` refusal bucket.

3. **Smoke-test against wave-2's 112 compile-error cases.**
   Re-run the brief 071 wave-2 sweep with the new headers in
   place; aim for ≥ 80 of the 112 to flip from `compile fail`
   → byte-identical (the remaining ~30 will hit other gates).

4. **Keep `libs/nitro/include/` organisationally clean.**
   Group struct defs by upstream header origin
   (`os/thread.h`, `os/mutex.h`, etc.) so future ports + future
   decomper work both find them easily.

**Non-scope:**

- ❌ Modifying `port_external_source.py`'s detection logic.
  The framework already relaxes refusals based on vendored
  identifiers — this brief is the *content* side, not the
  detection side.
- ❌ Vendoring upstream functions or .c source. Headers only.
- ❌ Per-region cross-application (brief 073).
- ❌ Touching wave-2's already-landed ports.
- ❌ AGENTS.md / state.md edits.

**Success:**

- Top-3 struct types (`_OSThread`, `_OSThreadQueue`, `OSMutex`)
  fully vendored into `libs/nitro/include/`.
- Smoke-test: re-run brief 071 wave-2 sweep after D5 lands;
  ≥ 80 of the 112 compile-fail candidates flip to byte-
  identical or to a different (non-D5) skip reason.
- All transitive struct/typedef dependencies vendored.
- Markdown lint + ruff + tests-pass on CI.

**Branch:** `cloud/port-driver-d5-struct-vendoring`

**Priority:** MEDIUM-HIGH. Largest single unlock for brief
074 (decomper next cross-project wave); ~80 expected
recoverable ports.

**After this brief lands:**

1. Brain queues brief 074 (decomper) — next cross-project
   bulk-port wave with D5 + #444's pre-filter + #446's reloc
   classification all in place. Pool should be substantially
   cleaner.
2. If D5 returns less than ~50 recovered candidates (well
   below estimate), brain investigates whether transitive
   struct deps form a "long-tail" that needs a different
   vendoring strategy.
