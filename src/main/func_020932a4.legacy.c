typedef unsigned long long u64;
typedef struct Alarm Alarm;
struct Alarm {
    void (*callback)(void *);
    void *arg;
    unsigned int tag;
    u64 time;
    Alarm *prev;
    Alarm *next;
    u64 period;
    u64 start;
};
extern struct { Alarm *head; Alarm *tail; } data_021a66d4;
extern struct { unsigned char pad[0x3ff8]; unsigned int flags; } data_027e0000;
extern unsigned int func_020905dc(unsigned int mask);
extern u64 func_020930b0(void);
extern void func_020934cc(Alarm *a, u64 time);
extern void func_02093684(Alarm *a);
void func_020932a4(void) {
    Alarm *a;
    void (*callback)(void *);
    u64 now;
    Alarm *next;
    *(volatile unsigned short *)0x04000106 = 0;
    func_020905dc(0x10);
    *(unsigned int *)((unsigned int)&data_027e0000 + 0x3ff8) |= 0x10;
    now = func_020930b0();
    a = data_021a66d4.head;
    if (!a) return;
    if (now < a->time) {
        func_02093684(a);
        return;
    }
    if (!(data_021a66d4.head = a->next))
        data_021a66d4.tail = 0;
    else
        data_021a66d4.head->prev = 0;
    callback = a->callback;
    if (a->period == 0) a->callback = 0;
    if (callback) callback(a->arg);
    if (a->period != 0) {
        a->callback = callback;
        func_020934cc(a, 0);
    }
    a = data_021a66d4.head;
    if (a) func_02093684(a);
}




