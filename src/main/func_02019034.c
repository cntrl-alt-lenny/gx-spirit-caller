/* func_02019034: hard-tier bitfield-getter — extracts the low u16 from
 * state[0x8d4] (the same 32-bit word sign-extracted by func_02019664 /
 * func_0201969c in adjacent slots).
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_8.s):
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     ldr   r0, [r0, #0x8d4]
 *     mov   r0, r0, lsl #0x10
 *     mov   r0, r0, lsr #0x10
 *     ldmia sp!, {r3, pc}
 *
 * 6 ARM instructions, 0x18 bytes. The `(x << 16) >> 16` shift-shift
 * idiom is mwcc-ARM's standard codegen for `(unsigned short)x` — see
 * brief 013's shift-shift note.
 */

extern char *GetSystemWork(void);

unsigned short func_02019034(void) {
    int v = *(int *)(GetSystemWork() + 0x8d4);
    return (unsigned short)v;
}
