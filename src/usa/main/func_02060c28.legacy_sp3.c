/* func_02060c28: null-or-default. Calls func_02060c48(); if it
 * returns null, returns &data_021012f8 instead. sp3.
 *
 *     stmdb sp!, {lr}
 *     sub   sp, sp, #0x4
 *     bl    func_02060c48
 *     cmp   r0, #0x0
 *     ldreq r0, .L_02060cb8
 *     add   sp, sp, #0x4
 *     ldmia sp!, {pc}
 *  .L_02060cb8: .word data_021012f8
 */

extern void *func_02060c48(void);
extern void *data_021012f8;

void *func_02060c28(void) {
    void *r = func_02060c48();
    if (r == 0) return &data_021012f8;
    return r;
}
