/* func_ov010_021b2864: tail-call thunk into func_020944c0.
 *
 *     ldr ip, .L_021b2878          ; ip = &func_020944c0
 *     mov r1, r0                    ; arg1 = caller's x
 *     mov r0, #0x0                  ; arg0 = 0
 *     mov r2, #0x24                 ; arg2 = 0x24 (36)
 *     bx  ip                        ; tail-call func_020944c0(0, x, 0x24)
 * .L_021b2878: .word func_020944c0
 *
 * Three-arg adapter: caller passes `x` in r0, this routes it to
 * `func_020944c0(0, x, 36)` via tail-call.
 */

extern int func_020944c0(int zero_tag, int x, int sz);

int func_ov010_021b2864(int x) {
    return func_020944c0(0, x, 0x24);
}
