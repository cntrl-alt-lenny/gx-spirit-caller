typedef struct {
    unsigned short bit0 : 1;
    unsigned short unused : 15;
} halfword_bit0_t;

typedef struct {
    unsigned short unused1 : 2;
    unsigned short bit2 : 1;
    unsigned short unused2 : 13;
} halfword_bit2_t;

extern int func_ov002_021bcd80(int inverted, int minus_one);
extern void func_ov002_0226aff0(int inverted, int ffff, int one);

int func_ov002_02217450(void *a) {
    halfword_bit2_t *h4 = (halfword_bit2_t *)((char *)a + 4);
    if (h4->bit2) {
        return 0;
    }
    {
        halfword_bit0_t *h2 = (halfword_bit0_t *)((char *)a + 2);
        int inverted = 1 - h2->bit0;
        if (func_ov002_021bcd80(inverted, -1) == 0) {
            return 0;
        }
    }
    {
        halfword_bit0_t *h2b = (halfword_bit0_t *)((char *)a + 2);
        int inverted2 = 1 - h2b->bit0;
        func_ov002_0226aff0(inverted2, 0xffff, 1);
        return 0;
    }
}
