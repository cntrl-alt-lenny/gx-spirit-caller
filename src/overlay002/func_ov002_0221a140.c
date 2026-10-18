typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 f0;
    u16 bit0 : 1;
    u16 pad2 : 15;
    u16 pad4 : 2;
    u16 flag2 : 1;
    u16 pad4b : 13;
    u16 pad6 : 8;
    u16 kind : 8;
} Obj;

typedef struct {
    u32 lo : 13;
    u32 b : 1;
    u32 mid : 8;
    u32 a : 8;
    u32 hi : 2;
} Slot;

extern char data_ov002_022cf16c[];
extern int func_ov002_0223def4(Obj *self, int a);
extern int func_ov002_021b99b4(int player, int a);
extern void func_ov002_021d8010(Obj *self, int player, u32 *slot);
extern void func_ov002_021e276c(int bit, u16 f0, int k, u16 idx);

int func_ov002_0221a140(Obj *self) {
    int idx;
    u32 *tab;
    Slot *sp;
    u32 hi;
    u32 lo;

    if (self->flag2) {
        return 0;
    }
    if (self->kind == 1) {
        idx = func_ov002_021b99b4(1 - self->bit0, func_ov002_0223def4(self, 0));
        if (idx >= 0) {
            tab = (u32 *)(data_ov002_022cf16c + ((1 - self->bit0) & 1) * 0x868 + 0x418);
            func_ov002_021d8010(self, 1 - self->bit0, &tab[idx]);
            sp = (Slot *)&tab[idx];
            func_ov002_021e276c(self->bit0, self->f0, 1,
                                sp->b + (sp->a << 1));
        }
    }
    return 0;
}
