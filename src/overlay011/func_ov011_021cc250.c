/* func_ov011_021cc250: free two handles held in the ov011 state struct.
 * Calls func_0207fd28(handle, 0x1000) on the +0x114 and +0x118 fields.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r0, =data_ov011_021d4000
 *     mov   r1, #0x1000
 *     ldr   r0, [r0, #0x114]
 *     bl    func_0207fd28
 *     ldr   r0, =data_ov011_021d4000
 *     mov   r1, #0x1000
 *     ldr   r0, [r0, #0x118]
 *     bl    func_0207fd28
 *     ldmia sp!, {r3, pc}
 */

extern char data_ov011_021d4000[];
extern void func_0207fd28(int handle, int flags);

void func_ov011_021cc250(void) {
    func_0207fd28(*(int *)(data_ov011_021d4000 + 0x114), 0x1000);
    func_0207fd28(*(int *)(data_ov011_021d4000 + 0x118), 0x1000);
}
