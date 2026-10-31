typedef unsigned long long u64;
typedef long long s64;
typedef struct Alarm {
    unsigned int pad[3];
    u64 time;
} Alarm;
extern u64 func_020930b0(void);
extern void func_02093294(int x);
extern void func_02090690(int timer, void (*handler)(int), int arg);
extern unsigned int func_02090624(unsigned int mask);
void func_02093684(Alarm *a) {
    u64 now = func_020930b0();
    s64 delay;
    unsigned short count;
    *(unsigned short *)0x04000106 = 0;
    delay = a->time - now;
    func_02090690(1, func_02093294, 0);
    count = 0;
    if (delay < 0) {
        count = 0xfffe;
    } else if (delay < 0x10000) {
        count = ~delay;
    }
    *(unsigned short *)0x04000104 = count;
    *(unsigned short *)0x04000106 = 0xc1;
    func_02090624(0x10);
}

