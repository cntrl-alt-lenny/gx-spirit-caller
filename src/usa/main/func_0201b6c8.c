/* func_0201b6c8: GetSystemWork + helper + OR field write.
 *
 *     push {r3, r4, r5, lr}
 *     mov r5, r0
 *     bl GetSystemWork; mov r4, r0
 *     mov r0, r5; bl func_0201b694
 *     ldr r1, [r4, #0x8f4]; orr r0, r1, r0; str r0, [r4, #0x8f4]
 *     pop
 */
struct F0201b708_SysWork {
    char pad[0x8f4];
    int f8f4;
};

extern struct F0201b708_SysWork *GetSystemWork(void);
extern int func_0201b694(int arg);

void func_0201b6c8(int arg) {
    struct F0201b708_SysWork *w = GetSystemWork();
    w->f8f4 |= func_0201b694(arg);
}
