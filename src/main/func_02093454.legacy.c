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
/* The assembly primitive returns the previous IRQ mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern u64 func_020930b0(void);
extern void func_020934cc(Alarm *a, u64 time);
extern void func_02093bfc(void);
void func_02093454(Alarm *a, u64 delay, void (*handler)(void *), void *arg) {
    int irq;
    if (a == 0 || a->handler != 0) {
        func_02093bfc();
    }
    irq = OS_DisableIrq();
    a->period = 0;
    a->handler = handler;
    a->arg = arg;
    func_020934cc(a, delay + func_020930b0());
    OS_RestoreIrq(irq);
}
