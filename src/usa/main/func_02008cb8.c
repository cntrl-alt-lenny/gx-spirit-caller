/* func_02008cb8: 2-prelim-call gate + conditional call.
 *
 *     push  {r4, lr}
 *     bl    func_020191dc
 *     bl    func_02011b04
 *     subs  r4, r0, #0x1
 *     movmi r0, #0x0
 *     popmi {r4, pc}
 *     mov   r1, r4
 *     mov   r0, #0x1
 *     bl    func_02008d00
 *     cmp   r0, #0x0
 *     movne r0, #0x0
 *     popne {r4, pc}
 *     mov   r0, #0x1
 *     mov   r1, r4
 *     mov   r2, r0
 *     bl    func_02008c68
 *     mov   r0, #0x1
 *     pop   {r4, pc}
 */

extern int func_020191dc(void);
extern int func_02011b04(void);
extern int func_02008d00(int a, int b);
extern void func_02008c68(int a, int b, int c);

int func_02008cb8(void) {
    int r;
    func_020191dc();
    r = func_02011b04() - 1;
    if (r < 0) return 0;
    if (func_02008d00(1, r) != 0) return 0;
    func_02008c68(1, r, 1);
    return 1;
}
