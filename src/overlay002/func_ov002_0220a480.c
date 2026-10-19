typedef unsigned short u16;
struct Card {
    u16 id;
    u16 player:1;
    u16 row:5;
    u16 rest:10;
    u16 f4;
    u16 low:8;
    u16 high:8;
};
extern int func_ov002_021c23ac(unsigned int bit, unsigned int row);
extern int func_ov002_022577dc(void *self);
extern int func_ov002_021ca2b8();
extern int func_ov002_0223f6c4(void *self);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern char data_ov002_022cf17c[];
int func_ov002_0220a480(struct Card *self) {
    int old;
    if (func_ov002_021c23ac(self->player, self->row) == 0) return 0;
    old = self->high;
    self->high = 0;
    if (func_ov002_022577dc(self) == 0) return 0;
    self->high = 1;
    if (func_ov002_022577dc(self) == 0) return 0;
    self->high = 2;
    if (func_ov002_022577dc(self) == 0) return 0;
    self->high = old;
    if (func_ov002_021ca2b8(self->player) == 0) return 0;
    if (*(int *)(data_ov002_022cf17c + (self->player & 1) * 0x868) == 0) {
        if (func_ov002_022536e8((void *)self->player, self->id, func_ov002_0223f6c4(self)) == 0) return 0;
    }
    return 2;
}

