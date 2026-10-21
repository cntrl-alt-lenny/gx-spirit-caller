extern unsigned int func_0202b890(int id);
extern int func_ov002_021b9ecc(int player, int kind);
extern char data_ov002_022cf1ac[];
extern char data_ov002_022cf1a4[];

int func_ov002_021bca00(int self, int id, int player, int slot)
{
    unsigned int flags = *(unsigned int *)(data_ov002_022cf1ac + (player & 1) * 0x868 + slot * 0x14);
    if (!((flags >> 6) & 1)) {
    if (player == self || *(unsigned short *)(data_ov002_022cf1a4 + (player & 1) * 0x868 + slot * 0x14) != 0) {
    switch (func_ov002_021b9ecc(player, slot)) {
    case 0x1521:
    case 0x1798:
    case 0x17e8:
    case 0x17e9:
    case 0x1873:
    case 0x1874:
        return func_0202b890(id) == func_0202b890(func_ov002_021b9ecc(player, slot));
    }
    }
    }
    return 0;
}


