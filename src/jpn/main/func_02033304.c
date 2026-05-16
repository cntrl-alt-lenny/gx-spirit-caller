/* func_02033304: P-9 early-return — kind-filter + helper call.
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     bl    func_020455d0
 *     cmp   r0, #0x4
 *     beq   .L_02033388
 *     cmp   r0, #0x7
 *     cmpne r0, #0x8
 *     bne   .L_02033388
 *     mov   r0, r4
 *     bl    func_0203347c
 *     cmp   r0, #0x0
 *     mvnne r0, #0x0
 *     popne {r4, pc}
 * .L_02033388:
 *     mov   r0, #0x0
 *     pop   {r4, pc}
 */

extern int func_020455d0(void);
extern int func_0203347c(void *p);

int func_02033304(void *p) {
    int kind = func_020455d0();
    if (kind == 4) goto end;
    if (kind != 7 && kind != 8) goto end;
    if (func_0203347c(p) != 0) return -1;
end:
    return 0;
}
