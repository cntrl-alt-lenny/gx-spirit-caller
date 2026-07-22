typedef struct {
    char pad[0xd48];
    int flag;
} T2_ov002_022ae718;

extern T2_ov002_022ae718 data_ov002_022d008c;

int func_ov002_022ae5dc(unsigned short *p) {
    if (*p != 0) {
        if (data_ov002_022d008c.flag == 1) {
            return 1;
        }
    }
    return 0;
}
