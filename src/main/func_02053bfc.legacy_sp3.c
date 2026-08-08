/* func_02053bfc: iterate index from count-1 down to 0, calling
 * func_02053e58(self, i) each time. mwcc 1.2/sp3 (fused pop{pc}, no
 * r3-spill push + sub sp,#4 -- the sp3-unique signature).
 *
 *     stmdb  sp!, {r4, r5, lr}
 *     sub    sp, sp, #0x4
 *     mov    r5, r0
 *     bl     func_02054140
 *     subs   r4, r0, #0x1
 *     addmi  sp, sp, #0x4
 *     ldmmiia sp!, {r4, r5, pc}
 *   .L_4a4:
 *     mov    r0, r5
 *     mov    r1, r4
 *     bl     func_02053e58
 *     subs   r4, r4, #0x1
 *     bpl    .L_4a4
 *     add    sp, sp, #0x4
 *     ldmia  sp!, {r4, r5, pc}
 */

extern int  func_02054140(void *self);
extern void func_02053e58(void *self, int i);

void func_02053bfc(void *self) {
    int i = func_02054140(self) - 1;
    while (i >= 0) {
        func_02053e58(self, i);
        i--;
    }
}
