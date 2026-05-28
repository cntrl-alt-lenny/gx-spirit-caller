/* func_0201fb8c: global ptr check + helper + return 1.
 *
 *     push {r3, lr}
 *     ldr r0, [pool]; ldr r0, [r0, #0x30]
 *     cmp r0, #2; movne r0, #0; popne
 *     mov r0, #3; bl func_0201f138(3)
 *     mov r0, #1; pop
 */
struct F0201fb8c {
    char pad[0x30];
    int f30;
};

extern struct F0201fb8c data_02191f40;
extern void func_0201f138(int n);

int func_0201fb8c(void) {
    if (data_02191f40.f30 != 2) return 0;
    func_0201f138(3);
    return 1;
}
