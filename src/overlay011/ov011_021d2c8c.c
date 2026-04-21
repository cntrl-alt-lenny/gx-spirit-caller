/* func_ov011_021d2c8c: two-word store of (r1, r2) to [r0], [r0+4].
 *
 *     stmia r0, {r1, r2}
 *     bx    lr
 *
 * `stmia` is the one-instruction way to write two consecutive 32-bit
 * values — mwcc collapses `p[0]=a; p[1]=b;` into this at -O4,p when
 * both writes clearly target adjacent word slots.
 */

void func_ov011_021d2c8c(int *p, int a, int b) {
    p[0] = a;
    p[1] = b;
}
