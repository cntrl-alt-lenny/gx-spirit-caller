extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c2084(void *self, int player, int idx, int flag);
extern int func_ov002_021c8470(int player, int idx);

typedef struct {
    unsigned short pad0;
    unsigned short side : 1;
    unsigned short rest : 15;
    unsigned short pad2[4];
    unsigned short limit;
} Obj;

typedef struct {
    unsigned int val : 13;
    unsigned int rest : 19;
} Bits;

int func_ov002_021f06cc(Obj *self, int player, int idx) {
    if (idx >= 5)
        return 0;
    if (player == self->side)
        return 0;
    if (((Bits *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30 + idx * 0x14))->val == 0)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + idx * 0x14) == 0)
        return 0;
    if (func_ov002_021c2084(self, player, idx, 1) == 0)
        return 0;
    return func_ov002_021c8470(player, idx) <= self->limit;
}
