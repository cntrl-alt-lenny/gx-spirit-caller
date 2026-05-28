/* func_ov002_022447d4: pool-deref 2 fields + helper(r0,a,b) + return 1.
 *
 *     push {r3, lr}
 *     ldr r2, [pool]
 *     ldr r1, [r2, #0x4]
 *     ldr r2, [r2, #0x20]
 *     bl func_ov002_0223db04(arg, data.f4, data.f20)
 *     mov r0, #1; pop
 */
struct F022447d4Pool {
    int f0;
    int f4;
    char pad[0x18];
    int f20;
};

extern struct F022447d4Pool data_ov002_022cd3f4;
extern int func_ov002_0223db04(int r0, int a, int b);

int func_ov002_022447d4(int arg) {
    func_ov002_0223db04(arg, data_ov002_022cd3f4.f4, data_ov002_022cd3f4.f20);
    return 1;
}
