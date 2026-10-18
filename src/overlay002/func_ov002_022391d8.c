struct Self {
    unsigned short id;
    unsigned short player:1;
    unsigned short row:5;
    unsigned short pad:6;
    unsigned short kind:2;
    unsigned short pad2:2;
    unsigned short pad3:6;
    unsigned short field:9;
    unsigned short pad4:1;
};
struct Entry {
    unsigned int pad:13;
    unsigned int flag:1;
    unsigned int pad2:8;
    unsigned int value:8;
    unsigned int pad3:2;
};
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021de678(void *self, int player, int row, int mask);
extern int func_ov002_021c10e8(int player, int row, int mode);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
int func_ov002_022391d8(struct Self *self) {
    if (self->kind == 1) {
        int player = self->player;
        int row = self->row;
        int player_off = (player & 1) * 0x868;
        int row_off = row * 0x14;
        struct Entry *entry = (struct Entry *)(data_ov002_022cf16c + player_off + 0x30 + row_off);
        unsigned short *slot;
        if (self->field != entry->value * 2 + entry->flag) return 0;
        slot = (unsigned short *)(data_ov002_022cf1a4 + player_off + row_off);
        if (*slot == 0) return 0;
        if (func_ov002_021de678(self, player, row, 0x2000) != 0) {
            int result = func_ov002_021c10e8(self->player, self->row, 1);
            unsigned short index = (self->field << 3) + (result << 2) + 1;
            func_ov002_021e276c((void *)self->player, self->id, 0x21, index);
        }
    }
    return 0;
}




