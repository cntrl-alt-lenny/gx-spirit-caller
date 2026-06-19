/* func_ov010_021b2764: tail-call thunk into Fill32.
 *
 *     ldr ip, .L_021b2878          ; ip = &Fill32
 *     mov r1, r0                    ; arg1 = caller's x
 *     mov r0, #0x0                  ; arg0 = 0
 *     mov r2, #0x24                 ; arg2 = 0x24 (36)
 *     bx  ip                        ; tail-call Fill32(0, x, 0x24)
 * .L_021b2878: .word Fill32
 *
 * Three-arg adapter: caller passes `x` in r0, this routes it to
 * `Fill32(0, x, 36)` via tail-call.
 */

extern int Fill32(int zero_tag, int x, int sz);

int func_ov010_021b2764(int x) {
    return Fill32(0, x, 0x24);
}
