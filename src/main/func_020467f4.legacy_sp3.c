/* func_020467f4: zero two regions via Fill32 — `data_0219daf4`
 * (128 bytes) and `data_0219db74` (256 bytes). Style A push +
 * Style B pop = sp3 signature. Brief 042 verified byte-identical
 * via mwcc 1.2/sp3.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     ldr   r1, .L_02046824
 *     mov   r0, #0x0
 *     mov   r2, #0x80
 *     bl    Fill32
 *     ldr   r1, .L_02046828
 *     mov   r0, #0x0
 *     mov   r2, #0x100
 *     bl    Fill32
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 *  .L_02046824: .word data_0219daf4
 *  .L_02046828: .word data_0219db74
 *
 * W-B unblock from brief 040 — was the original "ldmia {pc}
 * variant — sp2p3 emits {lr}+bx" wall (4 bytes over). sp3 emits
 * the {pc} variant directly.
 */

extern void Fill32(int v, void *dst, int size);
extern char data_0219daf4[];
extern char data_0219db74[];

void func_020467f4(void) {
    Fill32(0, data_0219daf4, 0x80);
    Fill32(0, data_0219db74, 0x100);
}
