typedef unsigned short u16;
struct Self { u16 f0; u16 bit0 : 1; u16 rest : 15; };
struct Slot { unsigned int id : 13; unsigned int rest : 19; char pad[16]; };
struct Side { int life; char pad[44]; struct Slot slots[11]; char tail[1884]; };
extern struct Side data_ov002_022cf16c[];
extern int func_ov002_021c8470(int a, int b);
/* The callee's void/pointer declaration conflicts with its integer callers and returned r0. */
extern int func_ov002_0227d660(int side, int arg);
int func_ov002_02295670(struct Self *self) {
    int i;
    int sum = 0;
    int value;
    for (i = 0; i <= 10; i++) {
        if (data_ov002_022cf16c[self->bit0 & 1].slots[i].id != 0)
            sum += func_ov002_021c8470(self->bit0, i) / 2;
    }
    if (data_ov002_022cf16c[(1 - self->bit0) & 1].life <= sum)
        return 1;
    value = func_ov002_0227d660(self->bit0, 0);
    if (value >= 0) {
        if (func_ov002_021c8470((unsigned char)value, (unsigned char)((u16)value >> 8)) >= 1000)
            return 1;
    }
    return 0;
}



