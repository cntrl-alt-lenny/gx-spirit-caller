/* func_02089c0c: family 4c88563e sibling of 02089bd4 — same shape,
 * second/third helpers are func_02094e38 / func_020960ac.
 *
 *     push  {r4, r5, lr}
 *     sub   sp, sp, #0x4
 *     mov   r4, r1               ; b
 *     mov   r1, r2               ; c
 *     mov   r5, r0               ; a
 *     mov   r2, r3               ; d
 *     bl    func_02089c74        ; (a, c, d)
 *     mov   r0, r5
 *     add   r1, r5, r4           ; a + b
 *     bl    func_02094e38        ; (a, a + b)
 *     mov   r0, r5
 *     bl    func_020960ac        ; (a)
 *     add   sp, sp, #0x4
 *     pop   {r4, r5, pc}
 */

extern void func_02089c74(int a, int c, int d);
extern void func_02094e38(int a, int ab);
extern void func_020960ac(int a);

void func_02089c0c(int a, int b, int c, int d) {
    func_02089c74(a, c, d);
    func_02094e38(a, a + b);
    func_020960ac(a);
}
