/* func_ov002_022644fc: tail-call into func_ov002_022631b4(1 - a, 0x1540).
 *
 *     ldr ip, .L_0226450c
 *     rsb r0, r0, #0x1                    ; r0 = 1 - a
 *     mov r1, #0x1540
 *     bx  ip
 *  .L_0226450c: .word func_ov002_022631b4
 */

extern int func_ov002_022631b4(int a, int b);

int func_ov002_022644fc(int a) {
    return func_ov002_022631b4(1 - a, 0x1540);
}
