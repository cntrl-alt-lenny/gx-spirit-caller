struct Ov002Self { unsigned short f0; unsigned short b0 : 1; };
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern int func_ov002_0228dbe4(int bit0, int i);
int func_ov002_022952dc(struct Ov002Self *self) {
    int i;
    for (i = 0; i <= 4; i++) {
        char *row = data_ov002_022cf16c + (self->b0 & 1) * 0x868;
        struct Ov002Slot *slot = (struct Ov002Slot *)(row + 0x30 + i * 0x14);
        if (slot->id != 0) {
            if (func_ov002_0228dbe4(self->b0, i) != 0) {
                return 1;
            }
        }
    }
    return 0;
}
