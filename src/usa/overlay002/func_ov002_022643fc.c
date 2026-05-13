/* func_ov002_022643fc: thunk — tail-call `func_ov002_022630cc(1 - arg, 0x1468)`.
 *
 *     ldr ip, .L_022644f4
 *     ldr r1, .L_022644f8
 *     rsb r0, r0, #0x1        ; r0 = 1 - r0
 *     bx  ip
 * .L_022644f4: .word func_ov002_022630cc
 * .L_022644f8: .word 0x1468
 *
 * 4 insns + 2 pool words = 0x18 bytes. Sibling of the
 * `func_0202b3e8` cluster — same `(size, sig=1)` fingerprint, but
 * the opcode mix differs from the matched main-module thunks: this
 * shape passes a constant in r1 and computes `1 - arg` for r0
 * rather than passing arg through unchanged.
 */

extern int func_ov002_022630cc(int x, int id);

int func_ov002_022643fc(int arg) {
    return func_ov002_022630cc(1 - arg, 0x1468);
}
