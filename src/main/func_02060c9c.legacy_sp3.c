/* func_02060c9c: null-or-default. Calls func_02060cbc(s, name); if it
 * returns null, returns data_021013d8 instead. sp3.
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

extern char *func_02060cbc(char *s, char *name);
extern char data_021013d8[];

char *func_02060c9c(char *s, char *name) {
    char *r = func_02060cbc(s, name);
    if (r == 0) return data_021013d8;
    return r;
}
