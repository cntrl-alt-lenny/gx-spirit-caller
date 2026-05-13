/* func_ov015_021b3f28: tail-call into func_020371b8 with constant args.
 *
 *     ldr ip, .L_021b4058
 *     mov r0, #0x38                ; arg0 = 0x38
 *     sub r1, r0, #0x39            ; arg1 = 0x38 - 0x39 = -1
 *     mov r2, #0x0                 ; arg2 = 0
 *     mov r3, #0x1                 ; arg3 = 1
 *     bx  ip                       ; tail-call func_020371b8(...)
 * .L_021b4058: .word func_020371b8
 *
 * Notable: mwcc materialises `-1` via `sub r1, r0, #0x39` reusing
 * r0 (already 0x38), rather than `mvn r1, #0`. Same cost, the
 * compiler picks the sub-from-prior-reg form.
 */

extern int func_020371b8(int a, int b, int c, int d);

int func_ov015_021b3f28(void) {
    return func_020371b8(0x38, -1, 0, 1);
}
