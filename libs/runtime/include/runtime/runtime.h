/*
 * runtime/runtime.h — CodeWarrior / NitroSDK bootstrap entry points.
 *
 * Declarations for the handful of named runtime functions already
 * identified in config/eur/arm9/symbols.txt:
 *
 *   Entry            0x02000800  size 0x13c  ARM  — CRT entry, called
 *                                                   from the ROM header
 *                                                   reset vector.
 *   AutoloadCallback 0x02000a74  size 0x004  ARM  — `bx lr`; stub
 *                                                   callback the
 *                                                   autoload mechanism
 *                                                   invokes for each
 *                                                   overlay as it loads.
 *   main             0x02000c34  size 0x010  ARM  — game main. Entry
 *                                                   tail-calls this
 *                                                   after static init.
 *
 * `__sinit_*` per-TU static initializers are declared at their call
 * sites, not here — each TU owns its own; there are 51 of them across
 * 15 overlays.
 */

#ifndef RUNTIME_RUNTIME_H_
#define RUNTIME_RUNTIME_H_

#ifdef __cplusplus
extern "C" {
#endif

/* CRT entrypoint. ROM header's ARM9 entrypoint (ARM9.rom_entry_address
 * in the NDS header) points here. Does autoload setup, static init,
 * then jumps to main(). Never returns in practice — if main() ever
 * does, Entry loops forever. */
void Entry(void);

/* The NDS autoload system calls this once per overlay as it's
 * dynamically loaded in. The retail binary's body is exactly `bx lr`:
 * a 4-byte no-op, preserving room for games that need to hook overlay
 * loads without patching the loader itself. */
void AutoloadCallback(void);

/* Game main. Runs after all __sinit_* have fired, never returns. */
int main(void);

#ifdef __cplusplus
}
#endif

#endif /* RUNTIME_RUNTIME_H_ */
