### cloud/patcher-ctor-terminator-detection

**Goal:** Fix the residual bug in `tools/patch_ov004_veneers.py`
that brief 145 (PR #566) surfaced. Brief 142 generalised the
patcher to accept `n ∈ [0, 86]` veneer counts via
`expected_output_delta_for(n) = n × 12 - 8`, but
`_fix_ctor_and_pad` still assumes a fixed 16-byte input shape
(8-byte ctor + 8-byte pad). At `n < 86`, mwldarm emits only 12
bytes (4-byte ctor + 8-byte pad — no `WRITEW(0)` terminator),
so the patcher over-reads by 4 bytes → output is 4 bytes short
of orig → SHA1 fails.

This is the final blocker before decomper can ship any ov004
`.rodata` source-level claims.

**Context:**

Brief 145 (PR #566) was specified to ship ≥ 20 ov004 `.rodata`
cluster claims. **0 shipped.** Decomper reproduced the bug
across three independent claim shapes (Pattern 1 .c, Pattern 1
.s, Pattern 3 chunk via brief 125 generator) — all produced
an identical 4-byte shift in `.data`. Decomper filed the
research note at [`docs/research/ov004-rodata-patcher-blocker.md`](../research/ov004-rodata-patcher-blocker.md)
characterising the bug + recommending the fix shape.

Diagnostic (from PR #566 body):

```text
ext: 2e4c5a4e 43455200 2e4c5a4e 434c5200  # ".LZNCER\0.LZNCLR\0"
bld: 43455200 2e4c5a4e 434c5200 2e4c5a4e  # "CER\0.LZNCLR\0.LZN"
```

First diff at file offset `0x0003fd40` (vaddr `0x02209aa0` —
start of ov004 `.data`). All downstream `.data` content shifted
+4 bytes earlier, indicating 4 bytes consumed from `.data` by
the patcher's `.ctor` fix.

Math:

| n | mwldarm raw size | patcher splice | ctor/pad fix | output | expected |
|---|---:|---:|---:|---:|---:|
| 86 | orig + 1024 | -1032 | +8 | orig | orig ✓ |
| 9 | orig + 96 | -108 | +8 | **orig - 4** ✗ | orig |

The `expected_output_delta_for(n) = n × 12 - 8` formula assumes
the ctor/pad fix always nets +8. At `n < 86`, mwldarm's ctor
lacks the `WRITEW(0)` terminator, so the fix actually nets +12
(consumes 12 bytes, writes 24) — the formula and the patcher
disagree about input shape.

**Scope:**

Per decomper's recommendation in the research note:

1. **Shape detection in `_fix_ctor_and_pad`.** Detect the
   ctor terminator's presence by reading bytes 4-7 of the
   post-splice ctor region:
   - All zero → 16-byte shape (n == 86 historical case;
     terminator present).
   - Non-zero → 12-byte shape (n < 86 new generalised case;
     no terminator).
   Set `fix_end` accordingly so the patcher reads exactly the
   right number of bytes from the ctor/pad region.

2. **`expected_output_delta_for(n)` update.** Reflect the
   variable net delta:
   - n == 86 → +8 (current behaviour, preserves historical
     SHA1 PASS bit-for-bit).
   - n < 86 → +12 (the new shape that brief 145 surfaced).
   Either parametrise the formula or branch by shape.

3. **Tests.** Pin the new behaviour explicitly. Decomper's
   recommended test additions:
   - Pin patched output size against orig for `n ∈ {86, 9, 0}`.
   - Pin first-100-byte hash of patched output against orig
     for the same three n values.
   - Optionally: extend brief 142's `n=43` and `n=1` cases to
     also assert against orig (currently they assert deltas
     only).

**Required smoke test (brain re-runs before merge):**

```
git checkout cloud/patcher-ctor-terminator-detection
python tools/configure.py eur && ninja sha1   # must PASS — preserves historical n=86 SHA1
python tools/configure.py usa && ninja sha1   # must PASS
python tools/configure.py jpn && ninja sha1   # must PASS
```

Then a positive test of the new shape: claim ONE ov004
`.rodata` Pattern 1 chunk in `src/overlay004/`, regenerate,
rebuild EUR, confirm `ninja sha1` still PASSES at the
post-source-claim n value (likely n == 9). Decomper's research
note has the exact reproducer.

If any region's `ninja sha1` drops from PASS to FAIL, the PR
doesn't merge.

**Non-scope:**

- ❌ Re-attempting brief 145's ≥ 20 ov004 `.rodata` cluster
  claims. That's brief 147 (decomper, queued post-146).
- ❌ Modifying brief 125's Pattern 3 generator. Brief 144
  (PR #565) just landed and is independently sufficient.
- ❌ Touching `src/`, `libs/`, `AGENTS.md`, `docs/state.md`,
  or any decomper-owned path.
- ❌ Adding broader veneer-count edge-case handling beyond
  `_fix_ctor_and_pad` shape detection. The brief 142 splice
  arithmetic (`expected_output_delta_for`) was correct for
  variable n; only the ctor/pad shape assumption was wrong.

**Success:**

- All 3 regions' `ninja sha1` PASS after the patch.
- A representative ov004 `.rodata` claim (Pattern 1 .c or
  Pattern 3 chunk — pick one from decomper's three repro
  shapes) ships in the same PR's smoke-test verification and
  preserves SHA1 PASS.
- New tests pin output size + first-100-byte hash for
  `n ∈ {86, 9, 0}`.
- 1770+/1770+ full test suite still green (brief 144's count;
  this brief adds tests, doesn't remove any).
- PR body shows the n=86 historical case still produces
  delta=1024 (brief 142's pin held) AND the n=9 new case
  produces the orig size.

**Branch:** `cloud/patcher-ctor-terminator-detection`

**Priority:** HIGH. **Brief 147 (decomper retry of 145) is
parked until this lands.** Without this fix, no ov004
`.rodata` source-level work can ship — the entire
ov004 cluster wavefront is gated on this one patcher fix.

**After this brief lands:**

1. Brain runs the 3-region SHA1 PASS smoke test on merged
   main, confirms historical case + new case both preserve
   orig.
2. Brain queues brief 147 (decomper retry of brief 145):
   ship ≥ 20 ov004 `.rodata` cluster claims with the now-
   working patcher.
3. Decomper unblocks for ov004 `.rodata` wave.
