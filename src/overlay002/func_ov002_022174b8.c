struct Ov002Self {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short pad2 : 15;
    unsigned short pad4 : 2;
    unsigned short flag : 1;
    unsigned short rest : 13;
};
struct Slot {
    unsigned int id : 13;
    unsigned int rest : 19;
    unsigned short pad4;
    unsigned short f6;
    unsigned short f8;
    unsigned char padA[10];
};
extern char data_ov002_022cf16c[];
extern int func_ov002_021d6808(struct Ov002Self *self, int player, int idx, int arg3, int arg4);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern void func_ov002_021e2d94(int arg0, int arg1, int arg2, int arg3);
int func_ov002_022174b8(struct Ov002Self *self) {
    int side, player, i;
    struct Slot *slot;
    char *base;
    if (self->flag) return 0;
    for (side = 0; side < 2; side++) {
        if (!side) player = self->b0;
        else player = 1 - self->b0;
        base = data_ov002_022cf16c + (player & 1) * 0x868;
        slot = (struct Slot *)(base + 0x30);
        for (i = 0; i < 5; i++, slot++, base += 0x14) {
            if (slot->id != 0) {
                int flag = 0;
                if (*(unsigned short *)(base + 0x36) != 0 && *(unsigned short *)(base + 0x38) == 0) flag = 1;
                if (func_ov002_021d6808(self, player, i, flag, 1) != 0) {
                    func_ov002_021e2d94(player, i, 0x15, 1);
                }
            }
        }
    }
    func_ov002_021e276c((void *)self->b0, self->f0, 1, 0);
    return 0;
}



