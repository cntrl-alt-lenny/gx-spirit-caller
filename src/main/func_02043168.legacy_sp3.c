extern char *data_0219d9f0;
extern void func_020421d8(void *arg);
extern int func_02091ae0(void *thread);
extern void func_02091d24(void *thread, void (*fn)(void *), void *arg, void *stack, int stack_size, int prio);
extern void func_020919d8(void *thread);

void func_02043168(void) {
    if (*(int *)(data_0219d9f0 + 0x1188) != 0) {
        if (func_02091ae0(data_0219d9f0 + 0x111c) == 0) {
            return;
        }
    }
    func_02091d24(data_0219d9f0 + 0x111c, func_020421d8, data_0219d9f0, data_0219d9f0 + 0x1000, 0x1000, 0x10);
    func_020919d8(data_0219d9f0 + 0x111c);
}
