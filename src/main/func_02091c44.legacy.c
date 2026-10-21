typedef struct {
    char pad[0xb4];
    void (*callback)(int);
} Thread;
extern Thread **data_021a63c8;
extern void OS_DisableIrq(void);
extern void func_02091be4(void);

void func_02091c44(int value) {
    Thread *thread = *data_021a63c8;
    void (*callback)(int) = thread->callback;
    if (callback != 0) {
        thread->callback = 0;
        callback(value);
        OS_DisableIrq();
    }
    func_02091be4();
}
