typedef struct {
    unsigned int val : 13;
    unsigned int rest : 19;
} Bits;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int func_0202b878(int id);
extern int func_ov002_021c1e44(void *self, int player, int idx);
extern int func_ov002_021c2084(void *self, int player, int idx, int z);

int func_ov002_021f2bbc(void *self, int player, int idx) {
    int off = (player & 1) * 0x868;
    int o2 = idx * 0x14;
    unsigned int id = ((Bits *)(data_ov002_022cf16c + off + 0x30 + o2))->val;
    if (id == 0)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + o2) == 0)
        return 0;
    if (idx < 5 || idx > 10)
        return 0;
    if (((*(unsigned int *)(data_ov002_022cf1ac + off + o2) >> 9) & 1) == 0) {
        if (func_0202b878(id) == 0x17)
            return 0;
    }
    if (func_ov002_021c2084(self, player, idx, 0) == 0)
        return 0;
    return func_ov002_021c1e44(self, player, idx) == 0;
}
