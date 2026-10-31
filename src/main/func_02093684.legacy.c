typedef unsigned long long u64;
typedef signed long long s64;
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
extern u64 func_020930b0(void);
extern unsigned int func_02090624(unsigned int mask);
extern void func_02090690(int timer, void (*handler)(int), int arg);
extern void func_02093294(int x);
void func_02093684(Alarm *a) {
    s64 delta;
    unsigned short count;
    u64 now = func_020930b0();
    *(volatile unsigned short *)0x04000106 = 0;
    delta = a->time - now;
    func_02090690(1, func_02093294, 0);
    count = 0;
    if (delta < 0) {
        count = 0xfffe;
    } else if (delta < 0x10000) {
        count = ~delta;
    }
    *(volatile unsigned short *)0x04000104 = count;
    *(volatile unsigned short *)0x04000106 = 0xc1;
    func_02090624(0x10);
}
