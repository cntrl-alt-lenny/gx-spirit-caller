/* func_ov002_021ca2b8: thunk — tail-call func_ov002_021ca0d4 with r1=0x0.
 *
 *     ldr ip, =
 *     mov r1, #0x0
 *     bx  ip
 */

extern int func_ov002_021ca0d4(int arg0, int arg1);

int func_ov002_021ca2b8(int a) {
    return func_ov002_021ca0d4(a, 0x0);
}
