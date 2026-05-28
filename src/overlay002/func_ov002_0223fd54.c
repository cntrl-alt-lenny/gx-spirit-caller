/* func_ov002_0223fd54: pool-deref 2 fields (f0, f1c) + helper + return 1.
 *
 *     push {r3, lr}
 *     ldr r2, [pool]
 *     ldr r1, [r2, #0x0]
 *     ldr r2, [r2, #0x1c]
 *     bl func_ov002_0223dcc0(arg, data.f0, data.f1c)
 *     mov r0, #1; pop
 */
struct F0223fd54Pool {
    int f0;
    char pad[0x18];
    int f1c;
};

extern struct F0223fd54Pool data_ov002_022cd3f4;
extern int func_ov002_0223dcc0(int r0, int a, int b);

int func_ov002_0223fd54(int arg) {
    func_ov002_0223dcc0(arg, data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f1c);
    return 1;
}
