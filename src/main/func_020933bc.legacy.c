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
extern struct { Alarm *head; Alarm *tail; } data_021a66d4;
/* The IRQ primitive returns its previous mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern void func_02093684(Alarm *a);
void func_020933bc(Alarm *a) {
    int irq = OS_DisableIrq();
    Alarm *next;
    if (a->handler == 0) {
        OS_RestoreIrq(irq);
        return;
    }
    next = a->next;
    if (next == 0)
        data_021a66d4.tail = a->prev;
    else
        next->prev = a->prev;
    if (a->prev != 0)
        a->prev->next = next;
    else {
        data_021a66d4.head = next;
        if (next != 0)
            func_02093684(next);
    }
    a->handler = 0;
    a->period = 0;
    OS_RestoreIrq(irq);
}
