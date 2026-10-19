typedef unsigned short u16;
struct Self {
    u16 id;
    u16 side:1, slot:5, rest:10;
    u16 pad:2, blocked:1, pad2:3, value:9, pad3:1;
};
struct Slot { unsigned int id:13, flag:1, rest:8, value:8, tail:2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c8940();
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
extern void func_ov002_021e2d94(int arg0, int arg1, int arg2, int arg3);
int func_ov002_0221146c(struct Self *self) {
    int side, slot;
    int off, index;
    struct Slot *p;
    if (self->blocked) return 0;
    off = (self->side & 1) * 0x868;
    index = self->slot * 20;
    p = (struct Slot *)(data_ov002_022cf16c + off + 0x30 + index);
    if (self->value != p->value * 2 + p->flag) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + off + index) == 0) return 0;
    func_ov002_021e2d94(self->side, self->slot, 5, 1);
    for (side = 0; side < 2; side++) {
        struct Slot *card = (struct Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30);
        char *base = data_ov002_022cf16c + (side & 1) * 0x868;
        for (slot = 0; slot < 5; slot++) {
            if (card->id && *(u16 *)(base + 0x38) != 0 &&
                func_ov002_021c8940(side, slot) == 2) {
                unsigned char a = self->side;
                unsigned char b = self->slot;
                func_ov002_021d59cc(side, slot, (u16)(a | (b << 8)), 7, 0);
            }
            card = (struct Slot *)((char *)card + 20);
            base += 20;
        }
    }
    return 0;
}

