extern char data_ov002_022ce288[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int func_ov002_021b9ecc(int, int);
extern int func_ov002_021b3240(int, int, int, int);
extern int func_ov002_021b9000(int, int);
extern int func_ov002_021bae7c(int, int, int);
extern int func_ov002_021bb068(int);
extern int func_ov002_021bd6c8(int);

int func_ov002_021c1ad0(int self, int idx) {
    int id = func_ov002_021b9ecc(self, idx);
    int result = 0;
    int off;
    int slot;
    char *p;
    if (id == 0) return 0;
    if (idx >= 5) return 0;
    if (*(int *)(data_ov002_022ce288 + 0x5c4) != 0) return 0;
    off = (self & 1) * 0x868;
    slot = idx * 20;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + slot) == 0) return 0;
    p = data_ov002_022cf1ac + off;
    if (((*(unsigned int *)(p + slot) >> 6) & 1) == 0) {
        unsigned int flags = *(volatile unsigned int *)(slot + (unsigned int)p);
        if ((((flags >> 1) | (flags >> 2)) & 1) == 0) {
        switch (id) {
        case 0x12a8:
        case 0x13cd:
        case 0x1706:
        case 0x1709:
            if (func_ov002_021bd6c8(0x10f4) != 0) {
                if (((*(unsigned int *)(p + slot) >> 6) & 1) == 0) return 3;
            }
            break;
        case 0x164e:
        case 0x1742:
        case 0x17d1:
        case 0x17d3:
            return 3;
        case 0x1814:
        case 0x181a:
            result |= 2;
            break;
        }
    }
    }
    if (func_ov002_021b3240(self, idx, 0x1693, self) != 0) result |= 2;
    if (func_ov002_021b3240(self, idx, 0x1693, 1-self) != 0) result |= 1;
    if (func_ov002_021b9000(self, idx) == 0) {
        if (func_ov002_021bb068(0x1667) != 0) return 3;
        if (func_ov002_021bae7c(self, 0x17a1, -1) != 0) result |= 2;
        if (func_ov002_021bae7c(1-self, 0x17a1, -1) != 0) result |= 1;
    }
    return result;
}






