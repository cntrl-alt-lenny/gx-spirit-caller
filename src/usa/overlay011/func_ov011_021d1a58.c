/* func_ov011_021d1a58: if the view is settled (func_ov011_021cef9c is false)
 * return 1; otherwise run the three settle passes and return 0.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov011_021cef9c
 *     cmp   r0, #0x0
 *     moveq r0, #0x1
 *     ldmeqia sp!, {r3, pc}
 *     bl    func_ov011_021cef84
 *     bl    func_ov011_021cc734
 *     bl    func_ov011_021cdad0
 *     mov   r0, #0x0
 *     ldmia sp!, {r3, pc}
 */

extern int func_ov011_021cef9c(void);
extern void func_ov011_021cef84(void);
extern void func_ov011_021cc734(void);
extern void func_ov011_021cdad0(void);

int func_ov011_021d1a58(void) {
    if (func_ov011_021cef9c() == 0) return 1;
    func_ov011_021cef84();
    func_ov011_021cc734();
    func_ov011_021cdad0();
    return 0;
}
