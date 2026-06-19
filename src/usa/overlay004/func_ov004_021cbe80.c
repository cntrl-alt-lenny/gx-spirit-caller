/* func_ov004_021cbe80: family 967f3c53 — call func_0202c06c on
 * self+0x3b6, forward its result to func_ov004_021cb55c(0, ret, 0x80).
 *
 *     push  {r3, lr}
 *     add   r0, r0, #0xb6
 *     add   r0, r0, #0x300        ; r0 = self + 0x3b6
 *     bl    func_0202c06c
 *     mov   r1, r0
 *     mov   r0, #0x0
 *     mov   r2, #0x80
 *     bl    func_ov004_021cb55c   ; (0, func_0202c06c(self+0x3b6), 0x80)
 *     pop   {r3, pc}
 */

extern int func_0202c06c(void *p);
extern void func_ov004_021cb55c(int a, int b, int c);

void func_ov004_021cbe80(void *self) {
    func_ov004_021cb55c(0, func_0202c06c((char *)self + 0x3b6), 0x80);
}
