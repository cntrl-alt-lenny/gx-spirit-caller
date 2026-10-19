extern char data_ov012_021cc6a0[];
extern char data_ov012_021cc6dc[];
int func_ov012_021ca36c(int x, int y) {
    char *base = data_ov012_021cc6dc;
    int row = y >> 3;
    int col = x & 7;
    int subrow = y & 7;
    int nib = col & 1;
    switch (*(int *)(data_ov012_021cc6a0 + 0x198)) {
    case 0: {
        int offset = (subrow << 2) + (col >> 1);
        unsigned char *tile = *(unsigned char **)(base + 0x17c) + (((x >> 3) + (row << 5)) << 5);
        int value = tile[offset];
        return (value >> (nib << 2)) & 15;
    }
    case 1: {
        unsigned char *tile = *(unsigned char **)(base + 0x17c) + (((x >> 3) + (row << 6)) << 6) + (subrow << 3);
        return tile[col] & 15;
    }
    default:
        return 0;
    }
}




