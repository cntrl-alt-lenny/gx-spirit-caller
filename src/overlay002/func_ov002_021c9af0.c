typedef struct {
    char _pad[0xd0];
    unsigned int field;
} S021c9af0;

extern S021c9af0 data_ov002_022d016c;

void func_ov002_021c9af0(int bit, int set) {
    if (set != 0) {
        data_ov002_022d016c.field |= (1 << bit);
    } else {
        data_ov002_022d016c.field &= ~(1 << bit);
    }
}
