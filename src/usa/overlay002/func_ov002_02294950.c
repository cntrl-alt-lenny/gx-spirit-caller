typedef struct {
    unsigned short bit0 : 1;
    unsigned short unused : 15;
} halfword_bit0_t;

extern int func_ov002_021bad9c(int bit0, int magic, int minus_one);
extern int func_ov002_02280870(int bit0);
extern int func_ov002_02291050(void *a, int b);

int func_ov002_02294950(void *a, int b) {
    halfword_bit0_t *h = (halfword_bit0_t *)((char *)a + 2);
    if (func_ov002_021bad9c(h->bit0, 0x140e, -1) != 0) {
        return 0;
    }
    if (func_ov002_02280870(h->bit0) > 0) {
        return 0;
    }
    return func_ov002_02291050(a, b);
}
