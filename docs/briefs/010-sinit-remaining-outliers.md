### decomper/sinit-remaining-outliers

**Goal:** Close out the remaining sinit outliers deferred from brief
003 by matching three targets across two overlays: the ov010 sinit
pair (`__sinit_ov010_021b89a8` + `__sinit_ov010_021b89f0`, both 0x48)
and the ov011 zeroing sinit (`__sinit_ov011_021d3620`, 0x34). After
this brief lands, the sinit tier should be at **49 / 51** — the only
unmatched sinit left is `__sinit_ov004_02209a5c`, which stays deferred
while ov004 is a failing module.

**Context:**

- Brief 003 drained the bulk `__sinit_*` population (46 of 51 matched
  via a single 0x2c register-global-object template).
- Brief 009 just closed `__sinit_ov002_022ca7e8` (0x18 outlier) — it
  required `asm void` because mwcc's RHS-first evaluation order
  couldn't be beaten in plain C. That PR's header comment at
  [`src/overlay002/sinit_ov002_022ca7e8.c`](../../src/overlay002/sinit_ov002_022ca7e8.c)
  documents the escape-hatch pattern and is a useful reference if
  you run into the same wall here.
- Both ov010 and ov011 are in the passing module set. Their baselines
  must stay green (24/27 OK total).
- Scouting from 2026-04-21 (Codex-decomper, via
  [`docs/state.md`](../state.md) history):
  - **`__sinit_ov010_021b89a8` / `__sinit_ov010_021b89f0`**: "natural
    pair, same 0x48 shape. Each calls two empty ctors, calls another
    empty ctor on base + 0x84/0x8c, then registers a dtor. Likely
    matchable, but more fiddly because **r4 must hold the base across
    calls**."
  - **`__sinit_ov011_021d3620`**: "registers a global object, but
    also zeroes `data_ov011_021d4800 + 0xc` first. Trick is
    **instruction ordering / register allocation**."

**Suggested C shapes (hypotheses — let objdiff decide):**

### `__sinit_ov010_021b89a8` / `__sinit_ov010_021b89f0` (the pair)

Standard register-global-object shell with two extra empty-ctor calls
inside. r4 holds the base between calls — mwcc should pick that
naturally from the calling convention if the body is written
register-free.

```c
/* __sinit_ov010_021b89a8: extended ctor-then-register-dtor shell.
 *
 *     <insert actual disasm here>
 *
 * Pattern:
 *   empty_ctor1(&obj);
 *   empty_ctor2(&obj);
 *   empty_ctor3(&obj + 0x84);   // 0x8c for the _021b89f0 sibling
 *   __register_global_object(&obj, dtor, atexit_slot);
 */

#include <runtime/sinit.h>

extern void func_ov010_<ctor1>(void *);
extern void func_ov010_<ctor2>(void *);
extern void func_ov010_<ctor3>(void *);
extern void func_ov010_<dtor>(void *);
extern char data_ov010_<obj>[];
extern char data_ov010_<atexit>[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov010_021b89a8(void) {
    func_ov010_<ctor1>(data_ov010_<obj>);
    func_ov010_<ctor2>(data_ov010_<obj>);
    func_ov010_<ctor3>(data_ov010_<obj> + 0x84);
    __register_global_object(data_ov010_<obj>, func_ov010_<dtor>,
                             data_ov010_<atexit>);
}

#pragma section INIT end
```

Fill in the `<ctor1>`, `<ctor2>`, `<ctor3>`, `<dtor>`, `<obj>`,
`<atexit>` blanks from `tools/find_callsites.py --version eur ov010
0x021b89a8` — that's what the new `--caller-depth` flag (PR #93) is
for: expand the call graph around these to spot whether the ctors are
already-named or placeholders.

The `021b89f0` sibling only differs by the `+ 0x84` → `+ 0x8c` offset
and possibly different ctor/dtor symbols. Don't copy-paste blindly —
verify with `find_callsites` per function.

### `__sinit_ov011_021d3620` (the zeroing sinit)

```c
/* __sinit_ov011_021d3620: zero a field, then register-global-object.
 *
 *     <insert actual disasm here>
 *
 * Pattern:
 *   *(int *)(data_ov011_021d4800 + 0xc) = 0;
 *   <standard ctor + register_global_object>
 */

#include <runtime/sinit.h>

extern void func_ov011_<ctor>(void *);
extern void func_ov011_<dtor>(void *);
extern char data_ov011_021d4800[];
extern char data_ov011_<atexit>[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov011_021d3620(void) {
    *(int *)(data_ov011_021d4800 + 0xc) = 0;
    func_ov011_<ctor>(data_ov011_021d4800);
    __register_global_object(data_ov011_021d4800, func_ov011_<dtor>,
                             data_ov011_<atexit>);
}

#pragma section INIT end
```

If mwcc emits the zero store *before* the ctor call when you want it
after (or vice versa), that's the instruction-ordering risk. Same
`asm void` escape hatch as brief 009 is available if C can't be
persuaded.

**Scope:**

- `src/overlay010/sinit_ov010_021b89a8.c` — new file.
- `src/overlay010/sinit_ov010_021b89f0.c` — new file.
- `src/overlay011/sinit_ov011_021d3620.c` — new file.
- `config/eur/arm9/overlays/ov010/delinks.txt` — two new `complete`
  entries.
- `config/eur/arm9/overlays/ov011/delinks.txt` — one new `complete`
  entry.

**Non-scope:**

- ❌ `__sinit_ov004_02209a5c` — ov004 is a failing module, leave it.
- ❌ Renaming any `func_ov0NN_<addr>` placeholders the ctors/dtors
  turn out to map to. If they're clearly named methods (e.g. a real
  vtable ctor is identified), rename via `tools/rename_symbol.py` —
  otherwise leave them.
- ❌ `tools/`, `libs/`, `include/`, `AGENTS.md`, `docs/state.md`.

**Success:**

- Three new units at 100% objdiff: the two ov010 sinits and the
  ov011 sinit. 24/24 + 24/24 + 0x34 bytes matched respectively.
- `./dsd.exe check modules` still **24/27 OK**.
- `python tools/check_match_invariants.py --version eur` exits 0.
- `python tools/progress.py --version eur` ticks up by
  `0x48 + 0x48 + 0x34 = 0xc4 = 196 bytes` and 3 units.
- sinit tier in `next_targets.py` reports **49 / 51** matched
  (94.2%).
- **One PR, all three targets** in it. They're all the same category
  (sinit outliers) and the PR is still small.

**Branch:** `decomper/sinit-remaining-outliers`.

**After this brief lands:**

1. **Brief 011 candidate: first pass at the `named` tier** (22
   unmatched candidates). Per `build/eur/analysis/targets.md`, these
   include `LZ77UnCompReadByCallbackWrite16bit`, `Div`, and other
   BIOS / libc-adjacent functions with known names. Start with a
   single-function PR to prove the shape, same cadence as brief 007.
2. **Brief 012 candidate: data-tier opener.** First `.data` / `.bss`
   TU carving. No precedent in the repo yet; needs its own scoping
   pass before briefing.
3. The ov004 failing-module story eventually needs its own brief
   (after the rest of the placeholder-symbol cleanup from
   `--allow-unknown-function-calls` resolves). Not this wave.
