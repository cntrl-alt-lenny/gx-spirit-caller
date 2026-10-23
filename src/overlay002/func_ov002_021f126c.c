struct Self {
    unsigned short f0;
    unsigned short owner : 1;
    unsigned short : 15;
    unsigned short f4, f6;
    unsigned short key, mask;
};
extern int func_ov002_021bc8c8(int self, int player, int slot);
extern int func_ov002_0223b430(int arg0, int arg1, int arg2);
extern int func_ov002_0223b468(int key);
extern int func_ov002_0223b4c4(int key, int idx);
extern char data_ov002_022cf1a4[];
int func_ov002_021f126c(struct Self *self, int player, int slot) {
    int i, key, mask, count;
    if (func_ov002_021bc8c8(self->owner, player, slot) != 0) {
        if (self->owner == player || *(unsigned short *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + slot * 20) != 0) {
            key = self->key;
            mask = self->mask;
            count = func_ov002_0223b468(key);
            for (i = 0; i < count; i++) {
                if (!(mask & (1 << i))) {
                    if (func_ov002_0223b430(func_ov002_0223b4c4(key, i), player, slot) != 0)
                        return 1;
                }
            }
        }
    }
    return 0;
}
