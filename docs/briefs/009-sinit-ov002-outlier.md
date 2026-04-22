### decomper/sinit-ov002-outlier

**Goal:** Match the deferred 0x18-byte sinit outlier
`__sinit_ov002_022ca7e8` at 100% objdiff. It doesn't fit the standard
"construct + register global object" 0x2c template that brief 003
already drained across 43 siblings — instead it's a shorter variant
that just copies one pointer into a struct field and returns.

**Context:**

- Brief 003 matched the bulk of `__sinit_*` functions via a single
  template shared across 44 copies. This outlier was explicitly
  deferred in that brief because its disassembly diverges from the
  register-global-object pattern.
- Scouting report from 2026-04-21 (Codex-decomper, relayed via
  `docs/state.md`): *"loads `data_ov002_022d11bc`, stores
  `data_ov002_022cc4f4` at `+0x1f8`, and returns. The only wrinkle is
  getting mwcc to keep the `.init` placement and literal-load/store
  order."*
- Template reference for the `.init` section pragma and
  `runtime/sinit.h` include:
  [`src/overlay005/sinit_ov005_021b16e4.c`](../../src/overlay005/sinit_ov005_021b16e4.c).
  Copy the pragma shape exactly; only the body changes.
- ov002 is a passing module (not in the `{main, dtcm, ov004}` failing
  set). ov002's baseline must stay green.
- Symbols already on file:
  - `__sinit_ov002_022ca7e8 kind:function(arm,size=0x18) addr:0x022ca7e8`
  - `data_ov002_022d11bc kind:bss addr:0x022d11bc` — the "load"
    source. BSS-resident, so use the `extern char[]` take-address
    idiom (same trick as `src/overlay005/ov005_021ad048.c`).
  - `data_ov002_022cc4f4 kind:data(any) addr:0x022cc4f4` — the "store"
    destination. Also extern via char[].

**Suggested C shape (hypothesis — let objdiff decide):**

```c
/* __sinit_ov002_022ca7e8: 0x18 sinit outlier.
 *
 *     <insert actual ARM disassembly here after find_callsites /
 *      dsd dis gives you the exact instructions>
 *
 * Not the standard register-global-object template. Just writes the
 * address of data_ov002_022cc4f4 into data_ov002_022d11bc + 0x1f8.
 */

#include <runtime/sinit.h>

extern char data_ov002_022d11bc[];   /* bss, destination structure */
extern char data_ov002_022cc4f4[];   /* data, pointer being installed */

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov002_022ca7e8(void) {
    *(char **)(data_ov002_022d11bc + 0x1f8) = data_ov002_022cc4f4;
}

#pragma section INIT end
```

**Risk notes the decomper should watch for:**

1. **Literal-pool ordering.** mwcc emits `ldr rN, =literal` pseudo-ops
   and the resulting pool order affects byte match. If objdiff shows
   right-instructions-wrong-offsets, try swapping the two extern
   declarations' order, or moving the assignment's RHS/LHS forms.
2. **`.init` section placement.** The `#pragma define_section` /
   `begin`/`end` pair must surround the function exactly like the
   brief-003 sinit template. Skipping the pragma lands the function
   in `.text` and breaks the overlay layout.
3. **Store-width.** If the destination slot is actually a pointer
   (`void*`), `*(char **)` vs `*(void **)` should both produce the
   same code, but `*(unsigned int *)(… + 0x1f8) = (unsigned int)…`
   is also a valid candidate if mwcc generates a different str form.

**Scope:**

- `src/overlay002/sinit_ov002_022ca7e8.c` — new file.
- `config/eur/arm9/overlays/ov002/delinks.txt` — one new `complete`
  TU entry. `tools/scaffold_batch.py --apply-delinks` gets the block
  right.

**Non-scope:**

- ❌ Any other ov002 sinit (they're already matched by brief 003).
- ❌ `__sinit_ov004_02209a5c` — ov004 is still a failing module.
- ❌ The ov010 `__sinit_021b89a8` / `021b89f0` pair — brief 010's
  territory (pair + register-preservation-across-calls subtlety).
- ❌ `__sinit_ov011_021d3620` — also brief 010 territory (zeroes
  memory before registering).
- ❌ `tools/`, `libs/`, `include/`, `AGENTS.md`, `docs/state.md`.
- ❌ Renaming `data_ov002_022d11bc` or `data_ov002_022cc4f4` to
  real names. Leave as placeholders; the structure-of-interest
  isn't identified yet and guessing now just creates rename churn.

**Success:**

- `__sinit_ov002_022ca7e8` at 100% objdiff, 24/24 matched code bytes.
- `ninja rom && ./dsd.exe check modules -c config/eur/arm9/config.yaml`
  stays at **24/27 OK**.
- `python tools/check_match_invariants.py --version eur` exits 0
  (warnings for unrelated placeholder names are fine).
- `python tools/progress.py --version eur` ticks up by 24 bytes.
- One PR, this one function. Include the actual ARM disassembly
  block in the C file's header comment (replacing the hypothesis
  above) so future readers see how it was derived.

**Branch:** `decomper/sinit-ov002-outlier`.

**After this brief lands:**

1. **Brief 010 candidate:** the ov010 sinit pair `__sinit_ov010_021b89a8`
   / `__sinit_ov010_021b89f0` (two 0x48 shapes sharing a ctor-chain
   pattern; r4 must hold the base across calls). Then `__sinit_ov011_021d3620`.
   Both trickier than 009, but closes the sinit tier to ≤1 outlier
   (the ov004 one stays deferred while ov004 is a failing module).
2. **Brief 011 candidate:** first pass at the **named** tier (22
   unmatched candidates). Likely a BIOS-thunk-esque or libc-adjacent
   function — first genuinely non-trivial matching.
3. **Data-tier opener** — still sitting at 0%. Worth scoping once
   the sinit tier is closed.
