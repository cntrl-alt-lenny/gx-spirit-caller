typedef unsigned short u16;
struct Obj {
    u16 pad;
    u16 player:1;
    u16 index:5;
    u16 :10;
    u16 bit0:1;
    u16 bit1:1;
    u16 bit2:1;
    u16 bit3:1;
    u16 :2;
    u16 value:9;
    u16 :1;
};
struct Word {
    unsigned int id:13;
    unsigned int half:1;
    unsigned int :8;
    unsigned int level:8;
    unsigned int :2;
};
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf184[];
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern void func_ov002_021d8904(int player, int idx, int value);
extern void func_ov002_021e16a4(int player, int id, int a, int b);
int func_ov002_0223b02c(struct Obj *self, struct Obj *other) {
    int n;
    struct Word *w;
    if (*(unsigned int *)(data_ov002_022cf184 + (self->player & 1) * 0x868) == 0) return 0;
    other->bit1 = 1;
    other->bit2 = other->bit1;
    other->bit3 = other->bit2;
    w = (struct Word *)(data_ov002_022cf16c + (other->player & 1) * 0x868 + 0x30 + other->index * 0x14);
    if (w->half + (w->level << 1) == other->value)
        func_ov002_021d8904(other->player, other->index, other->value);
    n = func_ov002_021b00d0(*(unsigned int *)(data_ov002_022cf184 + (self->player & 1) * 0x868));
    w = (struct Word *)(data_ov002_022cf16c + (self->player & 1) * 0x868 + 0x3a0 + n * 4);
    func_ov002_021e16a4(self->player, w->id, 0, 0);
    return 0;
}

