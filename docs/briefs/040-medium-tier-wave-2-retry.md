### decomper/medium-tier-wave-2-retry

**Goal:** Re-run brief 038's medium-tier wave 2 now that brief 039
fixed the `dsd lcf` filename inconsistency. Same 11 IRQ-bracket
targets from brief 034 / 038. The Style A unblock chain
(brief 036 diagnosis + brief 037 routing + brief 039 link-step
fix) is now end-to-end working — brain verified the reproducer.

**Pre-condition:** Brief 039 (PR #330) must be merged. Verify by
checking that `tools/patch_objects_legacy.py` exists and that
`build.ninja`'s `lcf` rule chains through it. If not, brief 039
hasn't landed.

**Workflow:**

Same as brief 038 (which itself referenced brief 037's filename
convention). Quick recap:

1. For each target, write the `.c` at
   `src/main/func_<addr>.legacy.c` (or appropriate overlay
   directory). The `.legacy.c` suffix triggers mwcc 1.2/sp2p3
   routing.
2. Add a `delinks.txt` entry pointing at the `.legacy.c` source.
3. Build, byte-compare. The Style A epilogue should now match;
   remaining body divergences fall back to existing
   codegen-walls patterns (most should resolve via C-2
   *local-pointer reuse*).
4. Iterate.

`find_shape_templates --version eur --target main <addr>` may
surface clone candidates from already-matched sp2p3 functions
once the first 1-2 land — though the matched corpus has zero
sp2p3 matches yet, so the first wave's tool-leverage will be
limited.

**Targets (priority order from brief 034's PR body, unchanged
from brief 038):**

| Sym | Brief 034 best partial | Why now |
|---|---:|---|
| `func_02091690` | 79% | Highest partial; cloud's brief 036 confirmed unblock |
| `func_0209d6f0` | 77% | Same family as 02091690 |
| `func_020a1e3c` | 73% | Cloud verified byte-identical with sp2p3 in brief 036 |
| `func_020916c8` | 71% | Same family |
| `func_0209d724` | 69% | Same family |
| `func_0207cbbc` | 67% | Cloud verified byte-identical with sp2p3 in brief 036 |
| `func_ov000_021ac85c` | 85% | Highest partial overall but had reg-alloc-only divergence — try with sp2p3 anyway |
| `func_0207b5f8` | 62% | |
| `func_02091714` | 54% | |
| `func_020467f4` | 57% | Style A only (no pool-dedup) |
| `func_02023fec` | 29% | Lowest; pool-dedup + Style A — may still need work |

**Scope / non-scope / verification gate / success / branch:**
identical to brief 038. Branch:
`decomper/medium-tier-wave-2-retry` (note `-retry` suffix; brief
038's branch was already merged with the empty escalation).

**After this brief lands:**

1. Brain refreshes state.md + writes brief 041 (next medium-
   tier wave, expanding past brief 034's 11 targets if 040
   yields well).
2. If yield ≥80%, the medium-tier dual-compiler unlock has
   roughly the same magnitude as the original easy-tier
   cluster pipeline did — work resumes at full pace.
3. If yield 50–80%, expected — IRQ-bracket targets are bigger
   and have more body-shape variety than easy clusters.
4. If yield <50%, brain investigates whether more
   codegen-walls patterns surface for sp2p3 specifically.
