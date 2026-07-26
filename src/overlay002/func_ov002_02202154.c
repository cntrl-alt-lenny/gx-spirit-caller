typedef struct {
    char pad_cec[0xcec];
    int field_cec;
    char pad2[0xcf8 - 0xcec - 4];
    int field_cf8;
} data_022d016c_t;
extern data_022d016c_t data_ov002_022d016c;

extern char data_ov002_022cf178[];

typedef struct {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
} halfword_bit0_t;

int func_ov002_02202154(void *a) {
    if (data_ov002_022d016c.field_cf8 != 1) {
        return 0;
    }
    {
        halfword_bit0_t *hw = (halfword_bit0_t *)((char *)a + 2);
        int bit0 = hw->bit0;
        int row;
        int *entry;
        if (data_ov002_022d016c.field_cec == bit0) {
            return 0;
        }
        row = (1 - bit0) & 1;
        entry = (int *)(data_ov002_022cf178 + row * 0x868);
        return *entry != 0;
    }
}
