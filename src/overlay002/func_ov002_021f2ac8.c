typedef struct {
    unsigned int val : 13;
    unsigned int rest : 19;
} Bits;

typedef struct {
    unsigned short pad0;
    unsigned short side : 1;
    unsigned short rest : 15;
} Hdr;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];
extern int func_ov002_021c1ef0(Hdr *self, int player, int idx);
extern int func_ov002_021c1e44(void *self, int player, int idx);
extern int func_ov002_021c2084(void *self, int player, int idx, int z);

int func_ov002_021f2ac8(Hdr *self, int player, int idx) {
    int off;
    int o2;
    if (idx >= 5)
        return 0;
    if (player == self->side)
        return 0;
    off = (player & 1) * 0x868;
    o2 = idx * 0x14;
    if (((Bits *)(data_ov002_022cf16c + off + 0x30 + o2))->val == 0)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + o2) == 0)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a2 + off + o2) != 0)
        return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0)
        return 0;
    return func_ov002_021c2084(self, player, idx, 1) != 0;
}
