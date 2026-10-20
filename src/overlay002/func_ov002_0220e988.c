typedef unsigned short u16;
struct Self {
    u16 id;
    u16 side:1, slot:5, rest:10;
    u16 pad:6, value:9, tail:1;
};
struct Slot { unsigned int id:13, flag:1, rest:8, value:8, tail:2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf26c[];
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
extern int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_021d95fc(int arg0);
int func_ov002_0220e988(struct Self *self) {
    int side, slot;
    char *base = data_ov002_022cf16c + (self->side & 1) * 0x868;
    int other = 1 - self->side;
    int off = (other & 1) * 0x868;
    unsigned int id = ((struct Slot *)(data_ov002_022cf16c + off + 0xf8))->id;
    struct Slot *p = (struct Slot *)(base + 0x30 + self->slot * 20);
    if (self->value != p->value * 2 + p->flag) return 0;
    if (id && *(u16 *)(data_ov002_022cf26c + off)) {
        func_ov002_021de480(other, 10, 0, 0);
    }
    for (side = 0; side < 2; side++) {
        struct Slot *card = (struct Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30);
        char *b = data_ov002_022cf16c + (side & 1) * 0x868;
        for (slot = 0; slot <= 4; slot++) {
            if (card->id && *(u16 *)(b + 0x38)) {
                unsigned char a = self->side;
                unsigned char c = self->slot;
                func_ov002_021d59cc(side, slot, (u16)(a | (c << 8)), 9, 0);
            }
            card = (struct Slot *)((char *)card + 20);
            b += 20;
        }
    }
    if (self->id != id) func_ov002_021d95fc(self->id);
    return 0;
}

