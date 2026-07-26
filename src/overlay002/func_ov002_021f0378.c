extern char data_ov002_022cf1a4[];
extern int func_ov002_021b9ecc(int b, int c);

int func_ov002_021f0378(unsigned short *a, int b, int c) {
    unsigned short *entry = (unsigned short *)(data_ov002_022cf1a4 + (b & 1) * 0x868 + c * 0x14);
    if (*entry != 0) {
        return *a == func_ov002_021b9ecc(b, c);
    }
    return 0;
}
