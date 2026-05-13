/* func_ov010_021b3b48: tail-call wrapper f(const).
 *
 *     ldr ip, .L_...
 *     mov r0, #0x2
 *     bx  ip
 *     .word func_ov010_021b391c
 */

extern int func_ov010_021b391c(int arg);

int func_ov010_021b3b48(void) {
    return func_ov010_021b391c(2);
}
