/* func_02062918: store-then-tail-call. Writes 0x67 to b[2] then
 * tail-calls func_02062280(a, b, c).
 *
 *     ldr ip, .L_02062928
 *     mov r3, #0x67
 *     strb r3, [r1, #0x2]
 *     bx  ip
 *  .L_02062928: .word func_02062280
 */

extern int func_02062280(int a, char *b, int c);

int func_02062918(int a, char *b, int c) {
    b[2] = 0x67;
    return func_02062280(a, b, c);
}
