typedef struct { char pad[0xb4]; int timer; } Context;
typedef struct { int a, b, current, total; char pad[0x210]; struct { unsigned low:5; unsigned bit5:1; unsigned bit6:1; unsigned high:25; } flags; } State;
extern Context data_ov010_021b91b4;
extern State data_ov010_021b9260;
extern struct { char pad[0x60]; int blend; } data_ov010_021b8d44;
extern int func_020b3870(int a, int b);
extern void func_0208e318(int *out, int a, int b, int c, int d);
int func_ov010_021b4fdc(int amount) {
    State *s = &data_ov010_021b9260;
    int total, current, shade, blend, inverse;
    data_ov010_021b91b4.timer -= amount;
    if (data_ov010_021b91b4.timer < 0) s->current = 0;
    total = s->total;
    current = s->current;
    shade = func_020b3870((total-current)*15,total);
    blend = func_020b3870(current*16,total);
    *(volatile unsigned short *)0x04001008 |= 0x40;
    inverse = 16-blend;
    func_0208e318((int *)0x04001050,17,8,blend,inverse);
    *(volatile unsigned short *)0x0400000a |= 0x40;
    *(volatile unsigned short *)0x0400000c |= 0x40;
    func_0208e318((int *)0x04000050,6,8,blend,inverse);
    if (s->flags.bit6 == 0 && s->flags.bit5 == 0) {
        data_ov010_021b8d44.blend = 0;
    } else {
        unsigned layers = (*(volatile unsigned *)0x04000000 & 0x1f00) >> 8;
        data_ov010_021b8d44.blend = blend;
        *(volatile unsigned *)0x04000000 = (*(volatile unsigned *)0x04000000 & ~0x1f00) | ((layers & ~1) << 8);
    }
    if (!((s->current >> 12) & 1)) {
        unsigned char c = shade;
        *(volatile unsigned char *)0x0400104c = c;
        *(volatile unsigned char *)0x0400104d = c;
        *(volatile unsigned char *)0x0400004c = c;
        *(volatile unsigned char *)0x0400004d = c;
    } else {
        unsigned char c = shade << 4;
        *(volatile unsigned char *)0x0400104c = c;
        *(volatile unsigned char *)0x0400104d = c;
        *(volatile unsigned char *)0x0400004c = c;
        *(volatile unsigned char *)0x0400004d = c;
    }
    if (s->current == 0) { s->total = 0; return 1; }
    return 0;
}



