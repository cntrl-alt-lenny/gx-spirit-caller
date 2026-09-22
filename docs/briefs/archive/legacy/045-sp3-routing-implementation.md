### cloud/sp3-routing-implementation

**Goal:** Implement the third compiler routing tier per brief 044's
verdict (PR #337, `docs/research/sp3-routing-decision.md`). Files
matching a `*.legacy_sp3.c` (or your chosen suffix) convention
compile with mwcc 1.2/sp3, parallel to the existing
`*.legacy.c` → 1.2/sp2p3 and default `.c` → 2.0/sp1p5 routes.

**Context:**

Brief 044's sweep found 7 sp3-unique medium+easy candidates (5
medium + 2 easy) plus 416 hard-tier candidates (future leverage).
The clean 3-tier discriminator from cloud's research:

| Compiler | Push | Sub-sp? | Epilogue |
|---|---|---:|---|
| 2.0/sp1p5 | `push {r3, r4, r5, lr}` (r3-spill) | no | `pop {r3, r4, r5, pc}` |
| 1.2/sp2p3 | `push {r4, r5, lr}` | yes | `pop {r4, r5, lr}; bx lr` |
| **1.2/sp3** | `push {r4, r5, lr}` | yes | `pop {r4, r5, pc}` |

The brief 037 + brief 039 chain established the precedent for
adding a routing tier. This brief extends that pattern.

**Scope:**

1. **`tools/configure.py`** — add `LEGACY_SP3_MWCC_VERSION =
   "1.2/sp3"` + `LEGACY_SP3_C_SUFFIX = ".legacy_sp3.c"`
   constants. New `LEGACY_SP3_CC` path. New `mwcc_legacy_sp3`
   ninja rule. Extend `add_mwcc_builds()` and `is_legacy_c()`-
   adjacent helpers to discriminate three tiers.
2. **`tools/patch_objects_legacy.py`** — extend to also rewrite
   `*.legacy_sp3.o` entries (same dsd lcf bug applies). Tests
   should cover both suffixes + mixed cases.
3. **Tests** — extend `tests/test_configure_asm.py` +
   `tests/test_patch_objects_legacy.py`:
   - `.legacy_sp3.c` routes to mwcc 1.2/sp3.
   - `.legacy.c` still routes to mwcc 1.2/sp2p3.
   - Default `.c` still routes to mwcc 2.0/sp1p5.
   - patch_objects_legacy rewrites both `.legacy.o` and
     `.legacy_sp3.o`; ignores plain `.o`.
4. **AGENTS.md** — extend the "Wine on macOS (post-deprecation)"
   / Brain onboarding sections if the new compiler tier adds any
   user-visible step. Likely no change since `mwccarm latest`
   already ships every SP.

**Required smoke test (brain WILL re-run before merge):**

Brain re-runs the brief-038-style reproducer for both `.legacy.c`
*and* `.legacy_sp3.c`:

```
# Existing tier (regression check)
echo 'void func_X(int x) {}' > src/main/func_X.legacy.c
... delinks entry ... && ninja rom

# New tier
echo 'void func_Y(int x) {}' > src/main/func_Y.legacy_sp3.c
... delinks entry ... && ninja rom
```

Both must build clean (link succeeds; mwldarm finds both
`.legacy.o` and `.legacy_sp3.o`). Default-only path must remain
24/27 baseline preserved.

**Non-scope:**

- ❌ Any `src/` change — decomper handles W-B / brief-044 sp3
  candidates in a follow-up brief once routing lands.
- ❌ Touching the existing sp2p3 routing logic. Add the new tier
  alongside.
- ❌ AGENTS.md / state.md edits beyond the onboarding / wine
  sections.

**Success:**

- Both reproducer builds (sp2p3 and sp3) link clean on brain's
  side.
- 24/27 baseline preserved (no `.legacy*.c` files committed).
- Tests green; CI clean.
- PR body documents:
  - Which suffix was picked (`.legacy_sp3.c` recommended) +
    rationale.
  - Output of both reproducer runs (lcf + objects.txt lines
    showing the new tier's `.o` is consistent).

**Branch:** `cloud/sp3-routing-implementation`

**Priority:** HIGH. Brief 046 (decomper sp3 wave) follows.

**After this brief lands:**

1. Brain queues brief 046 (decomper) — re-attack the 5 medium
   sp3-unique candidates from brief 044's table:
   - `func_0203cff8`, `func_0203d078`, `func_020467f4` (W-B),
     `func_0207db8c`, `func_0208205c`.
   - Plus 2 easy candidates if brief 046 has bandwidth.
2. After 046 lands, brain may queue a sweep of the 416 hard-tier
   sp3 candidates as future leverage validation.
