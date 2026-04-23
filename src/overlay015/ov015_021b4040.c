/* func_ov015_021b4040: tail-call into func_02037208 with constant args.
 *
 *     ldr ip, .L_021b4058
 *     mov r0, #0x38                ; arg0 = 0x38
 *     sub r1, r0, #0x39            ; arg1 = 0x38 - 0x39 = -1
 *     mov r2, #0x0                 ; arg2 = 0
 *     mov r3, #0x1                 ; arg3 = 1
 *     bx  ip                       ; tail-call func_02037208(...)
 * .L_021b4058: .word func_02037208
 *
 * Notable: mwcc materialises `-1` via `sub r1, r0, #0x39` reusing
 * r0 (already 0x38), rather than `mvn r1, #0`. Same cost, the
 * compiler picks the sub-from-prior-reg form.
 */

extern int func_02037208(int a, int b, int c, int d);

int func_ov015_021b4040(void) {
    return func_02037208(0x38, -1, 0, 1);
}
