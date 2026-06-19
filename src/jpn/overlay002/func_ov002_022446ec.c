/* func_ov002_022446ec: pool-deref 2 fields + helper(r0,a,b) + return 1.
 *
 *     push {r3, lr}
 *     ldr r2, [pool]
 *     ldr r1, [r2, #0x4]
 *     ldr r2, [r2, #0x20]
 *     bl func_ov002_0223da14(arg, data.f4, data.f20)
 *     mov r0, #1; pop
 */
struct F022447d4Pool {
    int f0;
    int f4;
    char pad[0x18];
    int f20;
};

extern struct F022447d4Pool data_ov002_022cd314;
extern int func_ov002_0223da14(int r0, int a, int b);

int func_ov002_022446ec(int arg) {
    func_ov002_0223da14(arg, data_ov002_022cd314.f4, data_ov002_022cd314.f20);
    return 1;
}
