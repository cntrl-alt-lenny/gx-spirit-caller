/* func_02008cd4: 2-prelim-call gate + conditional call.
 *
 *     push  {r4, lr}
 *     bl    func_02019210
 *     bl    func_02011b38
 *     subs  r4, r0, #0x1
 *     movmi r0, #0x0
 *     popmi {r4, pc}
 *     mov   r1, r4
 *     mov   r0, #0x1
 *     bl    func_02008d1c
 *     cmp   r0, #0x0
 *     movne r0, #0x0
 *     popne {r4, pc}
 *     mov   r0, #0x1
 *     mov   r1, r4
 *     mov   r2, r0
 *     bl    func_02008c84
 *     mov   r0, #0x1
 *     pop   {r4, pc}
 */

extern int func_02019210(void);
extern int func_02011b38(void);
extern int func_02008d1c(int a, int b);
extern void func_02008c84(int a, int b, int c);

int func_02008cd4(void) {
    int r;
    func_02019210();
    r = func_02011b38() - 1;
    if (r < 0) return 0;
    if (func_02008d1c(1, r) != 0) return 0;
    func_02008c84(1, r, 1);
    return 1;
}
