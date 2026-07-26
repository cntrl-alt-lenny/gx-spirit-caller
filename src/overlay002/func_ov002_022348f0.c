typedef struct {
    unsigned short bit0 : 1;
    unsigned short unused : 15;
} halfword_bit0_t;

typedef struct {
    char pad_cec[0xcec];
    int field_cec;
} data_022d016c_t;
extern data_022d016c_t data_ov002_022d016c;

extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e13f4(int x, int one, int match);
extern void func_ov002_021e2c5c(void);

int func_ov002_022348f0(void *a) {
    halfword_bit0_t *h = (halfword_bit0_t *)((char *)a + 2);
    int i;
    func_ov002_021e2b3c();
    for (i = 0; i < 2; i++) {
        int x = data_ov002_022d016c.field_cec ^ i;
        int match = (x == h->bit0) ? 0 : 1;
        func_ov002_021e13f4(x, 1, match);
    }
    func_ov002_021e2c5c();
    return 0;
}
