typedef struct { char pad[0x30]; unsigned int id:13; } Slot;
extern char data_ov002_022cf16c[];
extern int func_ov002_021c2624(int player, int idx, int id);
extern int func_ov002_021b3618(int player, int idx);
extern int func_ov002_021c1ef0(void *self, int player, int idx);
extern int func_ov002_021b3ac0(int player, int idx, int otherPlayer, int otherIdx);
int func_ov002_021eb7b8(void *self, int player, int idx) {
    int i, j, link;
    Slot *slot;
    if (idx < 5 || idx > 10) return 0;
    slot = (Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 0x14);
    if (slot->id == 0) return 0;
    if (func_ov002_021c2624(player, idx, slot->id) == 0) return 0;
    link = func_ov002_021b3618(player, idx);
    if (link != 0xffff) {
        for (i = 0; i < 2; i++) {
            for (j = 0; j < 5; j++) {
                if (link != (unsigned short)((unsigned char)i | ((unsigned char)j << 8))) {
                    if (func_ov002_021c1ef0(self, i, j) != 0) {
                        if (func_ov002_021b3ac0(player, idx, i, j) != 0) return 1;
                    }
                }
            }
        }
    }
    return 0;
}

