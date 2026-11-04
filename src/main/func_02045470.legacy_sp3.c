/* func_02045470: 5-arg call with constant 5th arg (0x20) on
 * stack. sp3 signature (sub sp + 1-step pop).
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     mov   ip, #0x20
 *     str   ip, [sp, #0x0]
 *     bl    func_020453fc
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 */

extern void *func_020453fc(int heap, void *p, int size, int d, int align);

void *func_02045470(int heap, void *p, int size, int d) {
    return func_020453fc(heap, p, size, d, 0x20);
}
