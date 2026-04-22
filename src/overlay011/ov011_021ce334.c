/* func_ov011_021ce334: zero r2 and tail-call func_ov011_021ce190.
 *
 *     ldr ip, =func_ov011_021ce190
 *     mov r2, #0x0
 *     bx  ip
 *
 * Sibling of func_ov011_021ce324 — same shape, one register over.
 */

extern void func_ov011_021ce190(int r0, int r1, int r2);

void func_ov011_021ce334(int r0, int r1) {
    func_ov011_021ce190(r0, r1, 0);
}
