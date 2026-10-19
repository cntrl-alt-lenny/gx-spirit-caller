struct Self { unsigned short id; unsigned short side:1; unsigned short rest:15; };
struct Card { unsigned int id:13; unsigned int rest:19; };
extern char data_ov002_022ce288[];
extern char data_ov002_022cf178[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022d0e6c[];
extern int func_0202e234(int x);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021ca2b8();
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_021d7970(void *arg0, int arg1, int arg2);
extern void func_ov002_0226af94(int arg0, int arg1, int arg2);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_0222bda8(struct Self *self) {
    int slot;
    int card;
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (!func_ov002_021bc618(self->side)) return 0;
        if (!func_ov002_021ca2b8(self->side)) return 0;
        if (!*(int *)(data_ov002_022cf178 + (self->side & 1) * 0x868)) return 0;
        func_ov002_0226af94(1 - self->side, self->id, 0);
        return 0x7f;
    case 0x7f:
        slot = *(unsigned short *)(data_ov002_022d0e6c + 0xb0);
        card = ((struct Card *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + slot * 4 + 0x120))->id;
        if (func_0202e234(card) && func_ov002_021ca440(self->side, card)) {
            func_ov002_0227adb8(self->side, (int)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x120 + slot * 4), 1, 0);
        } else {
            func_ov002_021d7970((void *)self->side, slot, 0);
        }
        return 0;
    }
    return 0;
}

