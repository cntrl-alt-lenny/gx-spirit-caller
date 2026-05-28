/* func_02038c54: global check + helper + return 1.
 *
 *     push {r3, lr}
 *     ldr r0, [pool0]; ldr r0, [r0]
 *     cmp r0, #0; moveq r0, #0; popeq
 *     ldr r0, [pool1]; bl func_02092748(&data2)
 *     mov r0, #1; pop
 *
 * data1: int at pool0; data2: array ptr at pool1.
 */
extern int data_0219b328;
extern char data_0219b384[];
extern void func_02092748(char *p);

int func_02038c54(void) {
    if (data_0219b328 == 0) return 0;
    func_02092748(data_0219b384);
    return 1;
}
