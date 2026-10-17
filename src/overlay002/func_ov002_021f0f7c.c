typedef struct {
    unsigned int val : 13;
    unsigned int rest : 19;
} Bits;

typedef struct {
    unsigned int pad : 9;
    unsigned int f : 1;
    unsigned int rest : 22;
} Flags;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int func_0202b878(int id);
extern int func_0202b8c0(int id);
extern int func_ov002_021b8fcc(int player, int idx);

int func_ov002_021f0f7c(void *self, int player, int idx) {
    int off = (player & 1) * 0x868;
    int o2 = idx * 0x14;
    unsigned int id = ((Bits *)(data_ov002_022cf16c + off + 0x30 + o2))->val;
    if (idx < 5) {
        if (func_ov002_021b8fcc(player, idx) == 0)
            return 0;
    }
    if (func_0202b878(id) != 0x16)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + o2) == 0)
        return 0;
    if (func_0202b8c0(id) != 4)
        return 0;
    return ((*(unsigned int *)(data_ov002_022cf1ac + off + o2) >> 9) & 1) == 0;
}
