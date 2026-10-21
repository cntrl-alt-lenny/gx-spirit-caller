typedef struct { int pad[6]; int timer; } Timer;
typedef struct { int pad[2]; int total; int remaining; } State;
extern Timer data_ov010_021b9884;
extern State data_ov010_021b9890;
extern int func_020b3870(int a, int b);

int func_ov010_021b7218(int amount) {
    State *p = &data_ov010_021b9890;
    int half;
    data_ov010_021b9884.timer -= amount;
    if (data_ov010_021b9884.timer < 0)
        p->remaining = 0;
    half = func_020b3870(0x97 * (p->total - p->remaining), p->total) / 2;
    *(volatile unsigned short *)0x04001040 = 0x4e4;
    *(volatile unsigned short *)0x04001044 = (((0x6f - half) << 8) & 0xff00) | ((0x6f + half) & 0xff);
    if (p->remaining != 0) return 0;
    *(volatile unsigned short *)0x04001040 = 0x4e4;
    *(volatile unsigned short *)0x04001044 = 0x24bb;
    p->total = 0;
    return 1;
}
