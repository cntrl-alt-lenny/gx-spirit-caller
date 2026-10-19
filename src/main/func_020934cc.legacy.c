typedef unsigned long long u64;
typedef long long s64;
typedef struct Alarm Alarm;
struct Alarm {
    unsigned int pad[3];
    u64 time;
    Alarm *prev;
    Alarm *next;
    u64 period;
    u64 start;
};
extern Alarm *data_021a66d4[2];
extern u64 func_020930b0(void);
extern u64 func_020b3808(u64, u64);
extern void func_02093684(Alarm *);
void func_020934cc(Alarm *a, u64 time) {
    Alarm *p;
    if (a->period != 0) {
        u64 now = func_020930b0();
        time = a->start;
        if (time < now) {
            u64 period = a->period;
            time += period * (func_020b3808(now - time, period) + 1);
        }
    }
    a->time = time;
    for (p = data_021a66d4[0]; p; p = p->next) {
        if ((s64)(time - p->time) < 0) {
            a->prev = p->prev;
            p->prev = a;
            a->next = p;
            if (a->prev) {
                a->prev->next = a;
                return;
            }
            data_021a66d4[0] = a;
            func_02093684(a);
            return;
        }
    }
    a->next = 0;
    p = data_021a66d4[1];
    data_021a66d4[1] = a;
    a->prev = p;
    if (p) {
        p->next = a;
        return;
    }
    data_021a66d4[1] = a;
    data_021a66d4[0] = a;
    func_02093684(a);
}

