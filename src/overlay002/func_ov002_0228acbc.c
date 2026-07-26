typedef struct {
    unsigned short bit0 : 1;
    unsigned short unused : 15;
} halfword_bit0_t;

extern int func_ov002_0223de94(void *b, int zero);
extern int func_ov002_022575c8(void *a, int lo, int hi);

int func_ov002_0228acbc(void *a, void *b) {
    if (b == 0) {
        return 0;
    }
    {
        halfword_bit0_t *hb = (halfword_bit0_t *)((char *)b + 2);
        halfword_bit0_t *ha = (halfword_bit0_t *)((char *)a + 2);
        if (hb->bit0 == ha->bit0) {
            return 0;
        }
    }
    {
        int result = func_ov002_0223de94(b, 0);
        unsigned short val16 = (unsigned short)result;
        int lo = result & 0xff;
        int hi = (val16 >> 8) & 0xff;
        return func_ov002_022575c8(a, lo, hi);
    }
}
