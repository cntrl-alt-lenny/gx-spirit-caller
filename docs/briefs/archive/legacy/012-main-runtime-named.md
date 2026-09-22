### decomper/main-runtime-named

**Goal:** Match the 4 non-BIOS-thunk named targets in ARM9 `main` —
the runtime scaffolding the linker puts around every user program.
Closes named tier to **12/22** (brief 011 wave 1 got 8, this gets 4).
The remaining 9 are the Thumb-align-wall deferred thunks from brief
011; they stay blocked until the LCF / linker investigation lands
(cloud is on it).

**Targets (all in `main`, all ARM-mode — no Thumb alignment wall):**

| Address | Symbol | Size | Notes |
|--------:|--------|-----:|-------|
| `0x02000800` | `Entry` | 0x13c | Program entry trampoline — largest target yet (~0x13c = 316 bytes). Sets up stacks, zeroes bss, calls `main`. See `libs/runtime/README.md` for the canonical shape in similar mwcc-ARM decomps (dqix, pokediamond). |
| `0x02000a74` | `AutoloadCallback` | 0x4 | One-instruction ARM stub. Per CLAUDE.md bootstrap section, this is "just a `bx lr`" — empty C function `void AutoloadCallback(void) {}` should suffice. |
| `0x02000c34` | `main` | 0x10 | The C `main()` function. 16 bytes ARM = ~4 instructions. Probably calls into Nitro's `NitroMain` or similar and returns. |
| `0x020b42f4` | `__register_global_object` | 0x20 | CodeWarrior dtor-chain registrar. 32 bytes ARM, used by every `__sinit_*` function. Signature already declared in [`libs/runtime/include/runtime/sinit.h`](../../libs/runtime/include/runtime/sinit.h). |

**Context:**

- After this lands, named tier is 12/22. The 9 deferred SWI thunks
  from brief 011 wave 1 unblock once cloud's Thumb alignment
  investigation produces a fix (configure.py LCF template tweak or
  an mwcc directive we haven't tried).
- `__register_global_object` is the highest-leverage match in this
  brief — every `__sinit_*` calls it, so naming + matching it
  closes a call-graph edge that's currently unresolved across 46
  matched sinits. `find_callsites` will confirm a healthy caller
  count.
- `Entry` is the longest function matched so far in the project.
  Non-trivial assembly: stack setup, copy loops, BL to `main`, BL
  to `_exit`. Read the disassembly carefully; don't guess from
  other decomps without verifying the exact instruction order.

**Scope:**

- `src/main/Entry.c`, `src/main/main.c`, `src/main/AutoloadCallback.c`,
  `src/main/register_global_object.c` (or `__register_global_object.c`
  — filename is the decomper's call; per-function files consistent
  with brief 011's pattern).
- `config/eur/arm9/delinks.txt` — append per-function `complete`
  entries.
- `libs/runtime/` is **not** in scope for `.c` files (that's cloud's
  column per AGENTS.md). If you need a declaration that isn't in
  `sinit.h` yet, add it to a local extern in your `.c` file for now
  and we'll promote it to a header in a follow-up if it shows up
  elsewhere.

**Non-scope:**

- ❌ The 9 Thumb-align-wall SWI thunks from brief 011 (blocked on
  cloud's research).
- ❌ Any other `func_*` in `main` (placeholder tier; separate work).
- ❌ Other failing modules (`dtcm`, `ov004`).
- ❌ Changes to `tools/`, `libs/` source, `AGENTS.md`.

**Success:**

- 4 functions at 100% objdiff. If any don't match on the first
  attempt, post the objdiff diff + your hypothesis (brief 009
  pattern — don't fall back to `asm` silently).
- `./dsd check modules -c config/eur/arm9/config.yaml` stays at
  24/27 (main's checksum won't flip — the placeholder-symbol
  artifacts are elsewhere).
- Named tier: 8/22 → 12/22.
- `tools/check_match_invariants.py` exits 0.

**Cadence:** **One PR, all 4.** Same reasoning as brief 011 wave 1 —
non-overlapping, small, per-function-carved. Brain reviews the
largest (`Entry`) carefully; the other three are short enough to
verify at a glance.

**Branch:** `decomper/main-runtime-named`.

**Useful references:**

- [`libs/runtime/README.md`](../../libs/runtime/README.md) — the
  canonical shape of CodeWarrior runtime glue in sibling decomps.
- [`libs/runtime/include/runtime/sinit.h`](../../libs/runtime/include/runtime/sinit.h)
  — for `__register_global_object`'s signature.
- pokediamond / pokeplatinum `arm9/src/main.c` and Entry files —
  cross-reference only; verify against our baserom.
- [`src/overlay002/sinit_ov002_022ca7e8.c`](../../src/overlay002/sinit_ov002_022ca7e8.c)
  if you hit an RHS-evaluation-order quirk and need the `asm void`
  escape hatch.

**After this brief lands:**

1. **Cloud's brief**: Thumb-section-alignment investigation (open
   as a parallel track; unblocks the 9 deferred SWI thunks from
   brief 011).
2. **Brief 013**: the 9 deferred SWI thunks, once the alignment
   fix lands.
3. **Brief 014**: `nitro_suggest_renames` for passing-overlay
   `func_*` placeholders. Now that Cloud's #99 usability pass gives
   HIGH/MEDIUM/LOW labels + excludes failing modules by default,
   this produces actionable candidates instead of noise.
4. More easy-tier sweep (~1062 left across the heavy overlays).
