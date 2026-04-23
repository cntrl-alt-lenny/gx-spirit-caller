/* func_ov011_021cacec: 2-arg thunk with -1 leading arg.
 *
 *     ldr ip, .L_021cacfc          ; ip = &func_ov011_021cabbc
 *     mov r1, r0                    ; r1 = arg
 *     mvn r0, #0x0                  ; r0 = -1
 *     bx  ip                        ; tail-call with args (-1, arg)
 *
 * mwcc emits -1 via `mvn r0, #0` rather than the `sub r0, r0, #0x39`
 * form used in ov015_021b4040 — because r0 hasn't been pre-set here,
 * so the mvn-based materialisation is the natural choice.
 */

extern int func_ov011_021cabbc(int tag, int arg);

int func_ov011_021cacec(int arg) {
    return func_ov011_021cabbc(-1, arg);
}
