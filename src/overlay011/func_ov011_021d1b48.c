/* func_ov011_021d1b48: if the view is settled (func_ov011_021cf060 is false)
 * return 1; otherwise run the three settle passes and return 0.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov011_021cf060
 *     cmp   r0, #0x0
 *     moveq r0, #0x1
 *     ldmeqia sp!, {r3, pc}
 *     bl    func_ov011_021cf048
 *     bl    func_ov011_021cc7f8
 *     bl    func_ov011_021cdb94
 *     mov   r0, #0x0
 *     ldmia sp!, {r3, pc}
 */

extern int func_ov011_021cf060(void);
extern void func_ov011_021cf048(void);
extern void func_ov011_021cc7f8(void);
extern void func_ov011_021cdb94(void);

int func_ov011_021d1b48(void) {
    if (func_ov011_021cf060() == 0) return 1;
    func_ov011_021cf048();
    func_ov011_021cc7f8();
    func_ov011_021cdb94();
    return 0;
}
