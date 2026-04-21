/*
 * runtime/sinit.h — shared extern for CodeWarrior __sinit_* shells.
 *
 * Every `__sinit_<module>_<addr>` that mwcc emits for a non-trivial
 * C++ global object follows the same two-call template:
 *
 *   1. Construct:  ctor(&obj)
 *   2. Register:   __register_global_object(&obj, dtor, &chain_slot)
 *
 * Step 2's registrar is **one shared function** — `func_020b42f4` in
 * ARM9 main — called by all 44 per-TU `__sinit_*` shells across 15
 * overlays. This header declares it once so every `__sinit_*.c` file
 * can `#include <runtime/sinit.h>` and share the declaration, rather
 * than copy-pasting the extern into each of the 44 TUs.
 *
 * Provisional name: `__register_global_object`. This is the
 * CodeWarrior runtime library's canonical name for this routine
 * (identical spelling across pokediamond, pokeplatinum, and
 * NitroSDK-Decomp). When the decomper renames `func_020b42f4 →
 * __register_global_object` via `tools/rename_symbol.py`, every
 * include of this header resolves to the correct symbol
 * automatically — no per-TU `.c` edits needed because the address is
 * unchanged by the rename.
 *
 * Signature confirmed from the first matched __sinit body
 * (src/overlay005/sinit_ov005_021b16e4.c, PR #36):
 *
 *     void f(void *obj, void (*dtor)(void *obj), void *chain_slot);
 *
 *     obj         — address of the just-constructed global.
 *     dtor        — destructor to enqueue; the runtime calls it with
 *                   `obj` at process exit.
 *     chain_slot  — per-TU atexit-chain node. Writable storage the
 *                   registrar links into its global chain; typically
 *                   12 bytes of .bss allocated alongside the `obj` in
 *                   the same TU.
 *
 * What is deliberately NOT declared here:
 *
 *   - Per-TU ctor / dtor functions. Each `__sinit_*.c` has its own
 *     `extern void <overlay>_<ctor_addr>(void *obj);` — those are
 *     local to their TU and don't belong in a shared header.
 *   - Per-TU data objects (the constructed global + chain slot).
 *     Same reason: TU-local.
 */

#ifndef RUNTIME_SINIT_H_
#define RUNTIME_SINIT_H_

#ifdef __cplusplus
extern "C" {
#endif

void __register_global_object(void *obj,
                              void (*dtor)(void *obj),
                              void *chain_slot);

#ifdef __cplusplus
}
#endif

#endif /* RUNTIME_SINIT_H_ */
