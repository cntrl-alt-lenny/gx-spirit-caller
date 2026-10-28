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
struct Global { char pad[0xcec]; int player; };
extern char data_ov002_022cf16c[];
extern struct Global data_ov002_022d016c;
extern void func_ov002_021d8904(int player, int idx, int value);
/* The original caller sets only r0 and r1; r2 is overwritten by this thunk. */
extern int func_ov002_021e104c();
/* The original does not supply the unused argument to either hub. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
int func_ov002_0223af48(struct Obj *self, struct Obj *other) {
    int n;
    struct Word *w;
    other->bit1 = 1;
    other->bit2 = other->bit1;
    other->bit3 = other->bit2;
    w = (struct Word *)(data_ov002_022cf16c + (other->player & 1) * 0x868 + 0x30 + other->index * 0x14);
    if (w->half + (w->level << 1) == other->value)
        func_ov002_021d8904(other->player, other->index, other->value);
    func_ov002_021e2b3c();
    for (n = 0; n < 2; n++)
        func_ov002_021e104c(data_ov002_022d016c.player ^ n, 1);
    func_ov002_021e2c5c();
    return 0;
}

