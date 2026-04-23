/* func_ov010_021b3c48: tail-call wrapper f(const).
 *
 *     ldr ip, .L_...
 *     mov r0, #0x2
 *     bx  ip
 *     .word func_ov010_021b3a1c
 */

extern int func_ov010_021b3a1c(int arg);

int func_ov010_021b3c48(void) {
    return func_ov010_021b3a1c(2);
}
