/* func_02089b24: family 4c88563e sibling of 02089bd4 — same shape,
 * second/third helpers are func_02094d44 / func_02095fb8.
 *
 *     push  {r4, r5, lr}
 *     sub   sp, sp, #0x4
 *     mov   r4, r1               ; b
 *     mov   r1, r2               ; c
 *     mov   r5, r0               ; a
 *     mov   r2, r3               ; d
 *     bl    func_02089b8c        ; (a, c, d)
 *     mov   r0, r5
 *     add   r1, r5, r4           ; a + b
 *     bl    func_02094d44        ; (a, a + b)
 *     mov   r0, r5
 *     bl    func_02095fb8        ; (a)
 *     add   sp, sp, #0x4
 *     pop   {r4, r5, pc}
 */

extern void func_02089b8c(int a, int c, int d);
extern void func_02094d44(int a, int ab);
extern void func_02095fb8(int a);

void func_02089b24(int a, int b, int c, int d) {
    func_02089b8c(a, c, d);
    func_02094d44(a, a + b);
    func_02095fb8(a);
}
