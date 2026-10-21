typedef unsigned short u16;
typedef struct {
    u16 f0;
    u16 flag0:1;
    u16 field:5;
    u16 :10;
} Card021c1e44;
struct Ov002Self {
    u16 id;
    u16 side:1;
    u16 :15;
    char pad[16];
    unsigned value:9;
    unsigned :23;
};
struct Slot { unsigned id:13; unsigned flag:1; unsigned pad:8; unsigned value:8; unsigned rest:2; char extra[16]; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021b947c(int);
extern int func_ov002_021c1a2c(int, int, int);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021d5a08(struct Ov002Self *arg0, int arg1, int arg2, int arg3, u16 arg4, u16 arg5);
extern void func_ov002_0226b11c(int unused0, int unused1);
int func_ov002_022341c8(struct Ov002Self *self) {
    int out = func_ov002_021b947c(self->value);
    int p = out & 0xff;
    int i = ((u16)out >> 8) & 0xff;
    if (p != self->side) {
        struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + (p & 1) * 0x868 + 0x30);
        if (slot[i].value * 2 + slot[i].flag == self->value) {
            func_ov002_021d5a08(self, p, i, self->id, 5, self->side);
            if (p != self->side && func_ov002_021c1e44((Card021c1e44 *)self, p, i) == 0 && func_ov002_021c1a2c(p, i, self->id) != 0) {
                func_ov002_0226b11c(p, i);
            }
        }
    }
    return 0;
}
