/* func_ov002_021bce20: thunk — `func_ov002_021bce38(arg0, 0, 0, 1)`.
 * Replaces args 1, 2, 3 with constants and tail-calls.
 *
 *     ldr ip, .L_021bcf14
 *     mov r1, #0x0
 *     mov r2, r1
 *     mov r3, #0x1
 *     bx  ip
 * .L_021bcf14: .word func_ov002_021bce38
 *
 * mwcc reuses r1 (already 0) for r2 via `mov r2, r1` rather than a
 * second `mov r2, #0` — saves nothing but is the standard emit.
 */

extern int func_ov002_021bce38(int a, int b, int c, int d);

int func_ov002_021bce20(int a) {
    return func_ov002_021bce38(a, 0, 0, 1);
}
