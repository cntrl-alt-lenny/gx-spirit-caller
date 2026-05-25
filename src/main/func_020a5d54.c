/* func_020a5d54: store arg to global, then tail-call func_020945f4(0, 0x21c).
 *
 *     ldr r3, .L_020a5d6c    ; data_021a9924
 *     ldr ip, .L_020a5d70    ; func_020945f4
 *     mov r1, #0x0
 *     mov r2, #0x21c
 *     str r0, [r3, #0x0]
 *     bx  ip
 *
 * Note: r0 is preserved across the str so the callee receives the original
 * arg as r0 (= data_021a9924's new value). r1/r2 set to 0/0x21c as constants.
 */

extern int func_020945f4(int a, int b, int c);
extern int data_021a9924;

int func_020a5d54(int v) {
    data_021a9924 = v;
    return func_020945f4(v, 0, 0x21c);
}
