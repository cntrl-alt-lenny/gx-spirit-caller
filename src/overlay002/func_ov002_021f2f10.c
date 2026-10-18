typedef struct {
    unsigned int val : 13;
    unsigned int rest : 19;
} Bits;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c1e44(void *self, int player, int idx);
extern int func_ov002_021b9e00(int player, int idx);
extern int func_ov002_021b9e48(int player, int idx);
extern int func_ov002_021b9e90();
extern int func_ov002_021b9ea4();
extern int func_ov002_021b9eb8();

int func_ov002_021f2f10(void *self, int player, int idx) {
    int off;
    int o2;
    off = (player & 1) * 0x868;
    o2 = idx * 0x14;
    if (((Bits *)(data_ov002_022cf16c + off + 0x30 + o2))->val == 0)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + o2) == 0)
        return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0)
        return 0;
    if (func_ov002_021b9e00(player, idx) != 0)
        return 1;
    if (func_ov002_021b9e48(player, idx) != 0)
        return 1;
    if (func_ov002_021b9e90(player, idx) != 0)
        return 1;
    if (func_ov002_021b9ea4(player, idx) != 0)
        return 1;
    if (func_ov002_021b9eb8(player, idx) != 0)
        return 1;
    return 0;
}
