/* func_02033354: P-9 early-return — kind-filter + helper call.
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     bl    func_02045678
 *     cmp   r0, #0x4
 *     beq   .L_02033388
 *     cmp   r0, #0x7
 *     cmpne r0, #0x8
 *     bne   .L_02033388
 *     mov   r0, r4
 *     bl    func_020334cc
 *     cmp   r0, #0x0
 *     mvnne r0, #0x0
 *     popne {r4, pc}
 * .L_02033388:
 *     mov   r0, #0x0
 *     pop   {r4, pc}
 */

extern int func_02045678(void);
extern int func_020334cc(void *p);

int func_02033354(void *p) {
    int kind = func_02045678();
    if (kind == 4) goto end;
    if (kind != 7 && kind != 8) goto end;
    if (func_020334cc(p) != 0) return -1;
end:
    return 0;
}
