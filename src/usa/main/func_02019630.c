/* func_02019630: hard-tier bitfield-getter — signed-byte-2 extract
 * from state[0x8d4]. Same word as func_02019668 (top byte) and
 * func_02019000 (low u16), different byte slice.
 *
 * Disassembly:
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     ldr   r0, [r0, #0x8d4]
 *     mov   r0, r0, lsl #0x8     ; sign-extended byte-2 extraction:
 *     mov   r0, r0, asr #0x18    ; (x << 8) then arithmetic-shift-right 24
 *     ldmia sp!, {r3, pc}
 *
 * 6 ARM instructions, 0x18 bytes. The `(x << 8) asr 24` idiom is
 * mwcc-ARM's codegen for `(signed char)(x >> 16)`.
 */

extern char *GetSystemWork(void);

int func_02019630(void) {
    int v = *(int *)(GetSystemWork() + 0x8d4);
    return (v << 8) >> 24;       /* signed byte-2 extract (2-shift form) */
}
