### cloud/permuter-wrapper

**Goal:** Make `tools/permute.py --run` (brief 063 D2,
PR #473) work cleanly on a fresh macOS Apple Silicon
worktree without the 5+ manual vendor patches brief 093
needed. Choice: wrap the patches via a project-side
shim layer in `tools/permute.py`, OR upstream them to
`tools/_vendor/decomp-permuter/`. Both options are
acceptable — pick whichever is cleaner architecturally.

**Context — the setup gaps brief 093 documented:**

Brief 093 (PR #487) needed five vendor patches plus one
project-specific `.s` normalization to run permuter
end-to-end against `func_02000cc4`:

1. **`tools/_vendor/decomp-permuter/import.py`** — catch
   `FileNotFoundError` in `homebrew_gcc_cpp` (Apple
   Silicon has no `/usr/local/bin`; upstream raises only
   on `ValueError`).
2. **`import.py`** — accept lowercase `-i` as an include
   flag (mwccarm convention; upstream scrapes `-I` only).
3. **`import.py`** — default `DEFAULT_AS_CMDLINE` to
   `arm-none-eabi-as -mcpu=arm946e-s -mthumb-interwork`
   (upstream hardcodes MIPS).
4. **`prelude.inc`** — replace MIPS `.set noat / .set
   noreorder / .set gp=64` with ARM-compatible macros.
5. **Per-work-dir `compile.sh`** — strip the
   `&& transform_dep.py …` suffix from the ninja-derived
   compile command (mwccarm rejects `&&` as a literal arg).

Plus: dsd-dis emits `.global` (with `e`), `arm_func_start`
+ `arm_func_end`, and `.include "macros/function.inc"`
macros that upstream permuter chokes on. Brief 093
hand-edited the `.s` into permuter-acceptable form.

Without wrapping these, the next autonomous permuter run
on a fresh worktree will hit the same wall. **Brief 097
medium-tier wave doesn't need permuter, so this brief
is not blocking — but it's a hard prereq for any future
P-class investigation** (P-1 / P-N / P-4 family / etc.).

**Method:**

1. **Decide wrapper vs upstream.** Trade-offs:

   - **Wrapper in `tools/permute.py`** — keeps
     `tools/_vendor/decomp-permuter/` unmodified (closer
     to upstream; easier to pull updates). Shim layer
     handles macOS-specific setup before invoking the
     vendor script. Preferred unless upstream changes
     are minimal.
   - **Upstream patches in `tools/_vendor/decomp-
     permuter/`** — cleaner runtime (no shim indirection)
     but makes future upstream pulls require manual
     reconciliation. Use only if the patches are tiny
     and stable.

   Cloud picks per its read of the codebase. Document
   the decision in the PR body.

2. **Cover all 5 vendor patches.** Each should resolve
   when `tools/permute.py --run` is invoked on a fresh
   worktree:
   - `homebrew_gcc_cpp` path resolution falls back to
     `arm-none-eabi-gcc` or skips gracefully if neither
     is found.
   - `-i` include flag treated as alias of `-I`.
   - `DEFAULT_AS_CMDLINE` overridden via env var or
     config-file to ARM target.
   - `prelude.inc` selected based on target architecture
     (ARM vs MIPS).
   - `compile.sh` template strips ninja `&& transform_
     dep.py` suffix before writing.

3. **Cover the dsd-dis `.s` normalization** — write a
   shim function that takes a dsd-extracted `.s` file
   and produces a permuter-acceptable version:
   - `.global` → `.globl` (or accept both via prefix
     match).
   - `arm_func_start` / `arm_func_end` → stripped (these
     are dsd-specific macros).
   - `.include "macros/function.inc"` → inlined or
     stripped.

4. **End-to-end test on a fresh worktree.** Pick brief
   091's P-N candidate (`func_02009758`) — it has the
   signed-modulo peephole that brief 093 didn't try yet.
   `tools/permute.py --run` should:
   - Resolve all toolchain paths without manual patches.
   - Accept the dsd-dis `.s` without hand-editing.
   - Run for at least a few hundred iterations without
     crashing.

   Whether the P-N candidate actually recovers byte-
   identical is **out of scope** for this brief — that's
   a future P-N permuter investigation. Brief 096 just
   needs to confirm the wrapper works.

5. **Document the workflow** — add a brief section to
   `docs/research/permuter-workflow.md` (or wherever
   brief 063 documented permuter usage) showing the new
   wrapper-driven invocation. Cross-reference brief 093's
   gap list so future readers see the full history.

**Non-scope:**

- ❌ Running permuter against any P-class candidate to
  recover byte-identical (separate future briefs).
- ❌ Improvements to permuter itself (loop unroll
  detection, new pass types, etc.).
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- `tools/permute.py --run` works on a fresh macOS Apple
  Silicon worktree without manual vendor patches.
- Brief 091's `func_02009758` runs through at least a
  few hundred iterations cleanly (recover-or-not is
  out of scope; just confirm no infrastructure crash).
- Workflow doc updated.
- Unit tests for the wrapper layer (if a wrapper is the
  chosen approach) — at minimum import-paths /
  CLI-flag-normalization tests.
- Markdown lint clean.

**Branch:** `cloud/permuter-wrapper`

**Priority:** MEDIUM. Decomper brief 097 (medium-tier
follow-on) is the higher-leverage immediate move. Brief
096 doesn't unlock new matches by itself — it unlocks
future P-class investigations. Land before brain queues
any permuter-dependent brief (likely brief 098 or 099
once 096/097 close).

**After this brief lands:**

1. Brain can queue a P-N permuter sweep (target
   `func_02009758` first; if it cracks, the entire P-N
   family from brief 091 + future surfacing may unlock).
2. Brain can queue a permuter sweep against the 3 brief-
   094 byte-diff drops (`func_020068d8`, `func_020331a4`,
   `func_02052b50`) — small leafs with reg-alloc
   divergence, classic permuter targets.
3. The brief 093 sub-note in codegen-walls.md can be
   updated to point to the wrapper rather than the
   manual patch list (housekeeping).
