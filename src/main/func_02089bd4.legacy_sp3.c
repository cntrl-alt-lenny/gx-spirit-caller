/* func_02089bd4: family 4c88563e — three sequential calls:
 * func_02089c74(a, c, d), func_02094e0c(a, a+b), func_02096060(a).
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
 *     bl    func_02094e0c        ; (a, a + b)
 *     mov   r0, r5
 *     bl    func_02096060        ; (a)
 *     add   sp, sp, #0x4
 *     pop   {r4, r5, pc}
 */

extern void func_02089c74(int a, int c, int d);
extern void func_02094e0c(int a, int ab);
extern void func_02096060(int a);

void func_02089bd4(int a, int b, int c, int d) {
    func_02089c74(a, c, d);
    func_02094e0c(a, a + b);
    func_02096060(a);
}
