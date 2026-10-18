struct SelfBits {
    unsigned short f_0;
    unsigned short b0 : 1;
    unsigned short row : 5;
    unsigned short _pad2 : 10;
    unsigned short _pad3 : 6;
    unsigned short field4 : 9;
    unsigned short _pad4 : 1;
};
struct SelfBits2 {
    unsigned short f_0;
    unsigned short f_2;
    unsigned short _a : 2;
    unsigned short bit2 : 1;
    unsigned short _b : 13;
};

extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_0223df38(void *self, int flag, int *outPtr);
extern int func_ov002_021d6808(void *self, int player, int idx, int arg3, int arg4);

int func_ov002_02211ebc(struct SelfBits2 *self) {
    int buf;
    if (self->bit2) {
        return 0;
    }
    if (func_ov002_0223df38(self, 0, &buf) != 0) {
        int player = buf & 0xff;
        int row = (((unsigned short)buf) >> 8) & 0xff;
        int player_off = (player & 1) * 0x868;
        int row_off = row * 0x14;
        if (*(unsigned short *)(data_ov002_022cf1a2 + player_off + row_off) != 0) {
            if (*(unsigned short *)(data_ov002_022cf1a4 + player_off + row_off) != 0) {
                func_ov002_021d6808(self, player, row, 0, 1);
            } else {
                func_ov002_021d6808(self, player, row, 1, 1);
            }
        }
    }
    return 0;
}
