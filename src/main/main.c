/* main: game entry point (C main), ARM-mode.
 *
 *     stmdb sp!, {r3, lr}
 *     bl func_02006394
 *     bl func_020065a8
 *     ldmia sp!, {r3, pc}
 *
 * 4 ARM instructions = 16 bytes. Two calls into the game's init /
 * main-loop pair, then returns. The first (func_02006394, 0x190
 * bytes) is likely the NitroSDK / game init. The second
 * (func_020065a8, 0x250 bytes) is likely the top-level game loop —
 * on NDS, main typically never returns, so this function's return
 * path only runs in exceptional cases.
 *
 * Declared as `void main(void)` in `runtime.h` — the baserom's
 * 0x10-byte body has no `mov r0, #0` before the pop, which is what
 * a C `int main()` would emit. Matches the void signature.
 */

extern void func_02006394(void);
extern void func_020065a8(void);

void main(void) {
    func_02006394();
    func_020065a8();
}
