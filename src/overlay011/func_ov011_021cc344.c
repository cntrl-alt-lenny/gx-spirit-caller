/* func_ov011_021cc344: guarded free of the +0x174 handle. If
 * func_0201e7e4(handle) is true, free it with func_0207fd28(handle, 0x1000).
 *
 *     stmdb sp!, {r4, lr}
 *     ldr   r0, =data_ov011_021d4000
 *     ldr   r4, [r0, #0x174]
 *     mov   r0, r4
 *     bl    func_0201e7e4
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r4, pc}
 *     mov   r0, r4
 *     mov   r1, #0x1000
 *     bl    func_0207fd28
 *     ldmia sp!, {r4, pc}
 */

extern char data_ov011_021d4000[];
extern int func_0201e7e4(int handle);
extern void func_0207fd28(int handle, int flags);

void func_ov011_021cc344(void) {
    int handle = *(int *)(data_ov011_021d4000 + 0x174);
    if (func_0201e7e4(handle)) {
        func_0207fd28(handle, 0x1000);
    }
}
