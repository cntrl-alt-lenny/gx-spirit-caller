typedef struct { unsigned int id:13; unsigned int rest:19; unsigned int pad[4]; } Slot;
extern char data_ov002_022cf16c[];
extern int func_ov002_021ca2b8();
extern int func_ov002_021ca698(int a, int b);
extern int func_ov002_021b3ecc(int a, int b, int c);
extern int func_ov002_021c92ec();
extern int func_ov002_021bc618(int a);
extern int func_ov002_022536e8(void *self, int a, int b);
int func_ov002_0226e6e0(int player, int card) {
    int i;
    int one;
    int two;
    Slot *slot;
    if (func_ov002_021ca2b8(player) == 0) return 0;
    if (func_ov002_021ca698(player, player) == 0) return 0;
    if (func_ov002_021b3ecc(player, 11, 0x14a0) != 0) {
        slot = (Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30);
        one = 0; two = 0;
        for (i = 0; i < 5; i++, slot++) {
            if (slot->id != 0) {
                switch (func_ov002_021c92ec(player, i)) {
                case 1: one = 1; break;
                case 2: two = 1; break;
                }
            }
        }
        return one != 0 && two != 0;
    } else {
        if (func_ov002_021bc618(player) != 0) {
            if (func_ov002_022536e8((void *)player, card, 0) > 0 && func_ov002_022536e8((void *)player, card, 1) > 0) return 1;
            return 0;
        }
        return 0;
    }
}

