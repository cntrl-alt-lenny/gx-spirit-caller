/* func_0202c1b4: null-guarded offset call. If arg == 0, return
 * &data_020c69bc (predicated `ldreq + ldmeqia`). Else call
 * func_0202c06c(arg + 0x1f4).
 *
 *     stmdb sp!, {r3, lr}
 *     cmp   r0, #0x0
 *     ldreq r0, .L_0202c224
 *     ldmeqia sp!, {r3, pc}
 *     add   r0, r0, #0x1f4
 *     bl    func_0202c06c
 *     ldmia sp!, {r3, pc}
 *  .L_0202c224: .word data_020c69bc
 */

extern char data_020c69bc[];
extern int  func_0202c06c(void *p);

int func_0202c1b4(char *p) {
    if (p == 0) return (int)data_020c69bc;
    return func_0202c06c(p + 0x1f4);
}
