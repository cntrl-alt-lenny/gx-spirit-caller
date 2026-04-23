/* func_020190ec: hard-tier forwarder — chains two void-returning calls.
 * Sibling of func_020139b4 (brief 010's two-call chain template).
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_8.s):
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_020190c0
 *     bl    func_020190d0
 *     ldmia sp!, {r3, pc}
 *
 * 4 ARM instructions, 0x10 bytes.
 */

extern void func_020190c0(void);
extern void func_020190d0(void);

void func_020190ec(void) {
    func_020190c0();
    func_020190d0();
}
