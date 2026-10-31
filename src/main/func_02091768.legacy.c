typedef unsigned long long u64;
typedef struct Alarm Alarm;
struct Alarm {
    void (*handler)(void *);
    void *arg;
    unsigned int tag;
    u64 time;
    Alarm *prev;
    Alarm *next;
    u64 period;
    u64 start;
};
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern void func_0209360c(int *p);
extern void func_02093454(Alarm *a, u64 delay, void (*handler)(void *), void *arg);
extern void func_02091748(void **obj);
extern void func_02091a8c(void *q);
extern void **data_021a63c8;
void func_02091768(unsigned int delay) {
    Alarm alarm;
    void *thread;
    int irq;
    func_0209360c((int *)&alarm);
    thread = *data_021a63c8;
    irq = OS_DisableIrq();
    *(Alarm **)((char *)thread + 0xb0) = &alarm;
    func_02093454(&alarm, ((u64)delay * 0x82ea) >> 6, (void (*)(void *))func_02091748, &thread);
    while (thread != 0) {
        func_02091a8c(0);
    }
    OS_RestoreIrq(irq);
}
