/* func_020a5c60: store arg to global, then tail-call func_02094500(0, 0x21c).
 *
 *     ldr r3, .L_020a5d6c    ; data_021a9844
 *     ldr ip, .L_020a5d70    ; func_02094500
 *     mov r1, #0x0
 *     mov r2, #0x21c
 *     str r0, [r3, #0x0]
 *     bx  ip
 *
 * Note: r0 is preserved across the str so the callee receives the original
 * arg as r0 (= data_021a9844's new value). r1/r2 set to 0/0x21c as constants.
 */

extern int func_02094500(int a, int b, int c);
extern int data_021a9844;

int func_020a5c60(int v) {
    data_021a9844 = v;
    return func_02094500(v, 0, 0x21c);
}
