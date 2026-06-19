/* func_ov011_021ce270: zero r2 and tail-call func_ov011_021ce0cc.
 *
 *     ldr ip, =func_ov011_021ce0cc
 *     mov r2, #0x0
 *     bx  ip
 *
 * Sibling of func_ov011_021ce260 — same shape, one register over.
 */

extern void func_ov011_021ce0cc(int r0, int r1, int r2);

void func_ov011_021ce270(int r0, int r1) {
    func_ov011_021ce0cc(r0, r1, 0);
}
