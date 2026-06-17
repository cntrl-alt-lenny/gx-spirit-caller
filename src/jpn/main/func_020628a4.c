/* func_020628a4: store-then-tail-call. Writes 0x67 to b[2] then
 * tail-calls func_0206220c(a, b, c).
 *
 *     ldr ip, .L_02062928
 *     mov r3, #0x67
 *     strb r3, [r1, #0x2]
 *     bx  ip
 *  .L_02062928: .word func_0206220c
 */

extern int func_0206220c(int a, char *b, int c);

int func_020628a4(int a, char *b, int c) {
    b[2] = 0x67;
    return func_0206220c(a, b, c);
}
