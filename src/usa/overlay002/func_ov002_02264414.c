/* func_ov002_02264414: tail-call into func_ov002_022630cc(1 - a, 0x1540).
 *
 *     ldr ip, .L_0226450c
 *     rsb r0, r0, #0x1                    ; r0 = 1 - a
 *     mov r1, #0x1540
 *     bx  ip
 *  .L_0226450c: .word func_ov002_022630cc
 */

extern int func_ov002_022630cc(int a, int b);

int func_ov002_02264414(int a) {
    return func_ov002_022630cc(1 - a, 0x1540);
}
