typedef struct {
    unsigned short bit0 : 1;
    unsigned short unused : 15;
} halfword_bit0_t;

extern char data_ov002_022cf0a0[];
extern char data_ov002_022cf09c[];

int func_ov002_02287e1c(void *a) {
    halfword_bit0_t *h = (halfword_bit0_t *)((char *)a + 2);
    int bit0 = h->bit0;
    int row1 = (1 - bit0) & 1;
    int row2 = bit0 & 1;
    int val1 = *(int *)(data_ov002_022cf0a0 + row1 * 0x868);
    int val2 = *(int *)(data_ov002_022cf09c + row2 * 0x868);
    if ((unsigned)val1 >= (unsigned)val2) {
        return 0;
    }
    return val1 >= 3 ? 1 : 0;
}
