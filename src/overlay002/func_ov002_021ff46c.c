typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 13;
    unsigned short bit14 : 1;
    unsigned short pad15 : 1;
} S021ff3bc;
extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
typedef struct { unsigned char pad[12]; unsigned int count; unsigned char rest[0x858]; } Table;
extern Table data_ov002_022cf16c[];
extern unsigned int data_ov002_022cf178[];
int func_ov002_021ff46c(S021ff3bc *p, int unused1) {
    int xorbit = p->bit0 ^ p->bit14;
    unsigned int i;
    if (func_ov002_021ff3bc(p, unused1) == 0) return 0;
    i = 0;
    if (i < *(unsigned int *)((unsigned char *)data_ov002_022cf178 + (xorbit & 1) * 0x868)) {
        do {
            if (func_ov002_022536e8(xorbit, p->w0, i) != 0) return 1;
            i++;
        } while (i < data_ov002_022cf16c[xorbit & 1].count);
    }
    return 0;
}

