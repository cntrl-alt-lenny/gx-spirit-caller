/* func_020190b8: hard-tier forwarder — chains two void-returning calls.
 * Sibling of func_02013980 (brief 010's two-call chain template).
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_8.s):
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_0201908c
 *     bl    func_0201909c
 *     ldmia sp!, {r3, pc}
 *
 * 4 ARM instructions, 0x10 bytes.
 */

extern void func_0201908c(void);
extern void func_0201909c(void);

void func_020190b8(void) {
    func_0201908c();
    func_0201909c();
}
