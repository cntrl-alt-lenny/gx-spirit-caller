/* func_ov006_021b8de0: prod a subsystem, then lazily post a task into the
 * +0xca90 slot if empty; return 1. */
extern void func_0202b410(void *p);
extern int  Task_PostLocked(int a, int b, int c);
int func_ov006_021b8de0(char *base) {
    func_0202b410(base);
    if (*(int *)(base + 0xca90) == 0)
        *(int *)(base + 0xca90) = Task_PostLocked(0xbe0, 0x10, 0);
    return 1;
}
