typedef struct {
    unsigned int id : 13;
    unsigned int lo : 1;
    unsigned int mid : 8;
    unsigned int hi : 8;
} Row021ebb34;

typedef struct {
    char _pad[0x30];
    Row021ebb34 r;
    char _pad2[0x10];
} Slot021ebb34;

typedef struct {
    char _pad[0x30];
    Slot021ebb34 slots[5];
    char _pad2[0x868 - 0x30 - 5 * 0x40];
} Player021ebb34;

typedef struct {
    unsigned short f0;
    unsigned short f2;
    unsigned short a : 6;
    unsigned short key : 9;
} Self021ebb34;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021b8fcc(int player, int idx);
extern int func_ov002_021c1ef0(Self021ebb34 *self, int player, int idx);
extern int func_ov002_021c2084(Self021ebb34 *self, int player, int idx, int flag);

int func_ov002_021ebb34(Self021ebb34 *self, int player, int idx) {
    if (idx < 5) {
        if (func_ov002_021b8fcc(player, idx) == 0)
            return 0;
    }
    int off = idx * 0x14;
    int poff = (player & 1) * 0x868;
    char *row = data_ov002_022cf16c + poff;
    Row021ebb34 *slot = (Row021ebb34 *)(row + off + 0x30);
    if (slot->id == 0)
        return 0;
    Row021ebb34 *s2 = (Row021ebb34 *)(row + 0x30 + off);
    if (s2->lo + (s2->hi << 1) == self->key)
        return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    if (func_ov002_021c2084(self, player, idx, 1) == 0)
        return 0;
    return *(unsigned short *)(off + (int)(data_ov002_022cf1a4 + poff)) == 0;
}
