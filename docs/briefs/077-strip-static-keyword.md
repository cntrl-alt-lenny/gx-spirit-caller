### cloud/strip-static-keyword

**Goal:** Fix the `static`-keyword silent-corruption mode
decomper diagnosed in brief 074 wave 3 (PR #457). When
upstream declares a function `static`, the current D1
driver preserves the keyword in the rewritten port — but
our dsd-gap TUs are NEVER static, so the rewritten port
shifts mwldarm's symbol allocation by 8 bytes per
affected function. Two ports in wave 3 (`OSi_IdleThreadProc`
+ `OSi_CancelThreadAlarmForSleep`) shifted cumulative 32
bytes, breaking all 27 modules until decomper bisected and
manually stripped the keyword.

**Method:**

Two-line fix in `port_external_source.py`'s `_compose_port_source`:

```python
# Strip leading `static` from the rewritten body's function
# signature. dsd-gap TUs are never static; upstream's static
# qualifier is preserved by D1's body copy, but it shifts
# mwldarm's symbol allocation and breaks the per-port byte
# layout invariant brief 071's verify gate depends on.
body = re.sub(r"^\s*static\s+", "", body, count=1)
```

The `count=1` ensures we only strip the function-definition
`static`, not any local-scope `static` declarations inside
the function body.

**Validate:** re-run wave 3's two affected ports
(`OSi_IdleThreadProc`, `OSi_CancelThreadAlarmForSleep`)
through the driver post-fix; both should emit non-static
output and byte-match without manual intervention.

**Non-scope:**

- ❌ Any other source-rewrite changes — minimal patch.
- ❌ Re-running wave 3 — decomper already shipped those 12
  ports byte-identical with the manual strip; future waves
  benefit.
- ❌ AGENTS.md / state.md edits.

**Success:**

- 2-line regex applied to `_compose_port_source`.
- Unit test: `static u32 foo(void) { return 1; }` → port
  emits `u32 foo(void) { return 1; }`.
- Unit test: `void foo(void) { static int x = 0; x++; }` →
  local-scope `static` preserved (only outer-function
  `static` stripped).
- Full suite stays green.

**Branch:** `cloud/strip-static-keyword`

**Priority:** SMALL — tiny patch, prevents recurring silent-
corruption mode. Cloud autonomous candidate.

**After this brief lands:**

1. Future cross-project waves don't hit the static-keyword
   trap. Brief 078 wave 2 benefits if any of brief 076's
   ~46 unlocked candidates were marked `static` upstream.
2. Calibration baseline for similar source-rewrite traps
   if any surface in future waves (e.g. `inline`,
   `__attribute__` directives).
