/* func_02060c9c: null-or-default. Calls func_02060cbc(); if it
 * returns null, returns &data_021013d8 instead. sp3.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_02060cbc
 *     cmp   r0, #0x0
 *     ldreq r0, .L_02060cb8
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 *  .L_02060cb8: .word data_021013d8
 */

extern void *func_02060cbc(void);
extern void *data_021013d8;

void *func_02060c9c(void) {
    void *r = func_02060cbc();
    if (r == 0) return &data_021013d8;
    return r;
}
