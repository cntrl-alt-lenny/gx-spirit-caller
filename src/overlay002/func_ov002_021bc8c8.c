extern int func_ov002_021b9ecc(int player, int idx);
extern int func_ov002_021bb068(int id);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern char data_ov002_022cf1ac[];
extern char data_ov002_022cf1a4[];

int func_ov002_021bc8c8(int self, int player, int slot) {
    int id = func_ov002_021b9ecc(player, slot);
    if (id == 0) return 0;
    if (slot >= 5) return 0;
    if (func_ov002_021bb068(0x13f2) > 0) return 0;
    if (self != player) {
        if (func_ov002_021b3fd8(player, slot, 0x13eb, self) == 0) return 0;
    }
    if (func_ov002_021b3ecc(player, slot, 0x16a4) != 0) return 0;
    if (func_ov002_021b3ecc(player, slot, 0x12d1) != 0) return 0;
    if (id == 0x1900 || id == 0x1aad) {
        int off = (player & 1) * 0x868;
        unsigned int f = *(unsigned int *)(data_ov002_022cf1ac + off + slot * 20);
        unsigned short h = *(unsigned short *)(data_ov002_022cf1a4 + off + slot * 20);
        if ((h & ~((f >> 6) & 1)) & ~(((f >> 1) | (f >> 2)) & 1)) return 0;
    }
    return 1;
}
