/* func_ov011_021d2c7c: forward a 3-arg update to the data_ov011_021d472c
 * object as two calls (a,b) then (c).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   ip, r0 ; mov r3, r1 ; mov r4, r2
 *     ldr   r0, =data_ov011_021d472c ; mov r1, ip ; mov r2, r3 ; bl func_ov011_021d1f18
 *     ldr   r0, =data_ov011_021d472c ; mov r1, r4 ; bl func_ov011_021d2068
 *     ldmia sp!, {r4, pc}
 */

extern char data_ov011_021d472c[];
extern void func_ov011_021d1f18(void *obj, int a, int b);
extern void func_ov011_021d2068(void *obj, int c);

void func_ov011_021d2c7c(int a, int b, int c) {
    func_ov011_021d1f18(data_ov011_021d472c, a, b);
    func_ov011_021d2068(data_ov011_021d472c, c);
}
