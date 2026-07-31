typedef unsigned short u16;

struct F2Cat {
    u16 _lo : 12;
    u16 cat : 2;
};

struct F2Bit0 {
    u16 bit0 : 1;
};

struct F2Bit14 {
    u16 _lo : 14;
    u16 bit14 : 1;
};

extern int func_ov002_021b8ecc(void *b);
extern int func_0202b878(int id);
extern int func_ov002_021c1ef0(void *self, int player, int idx);
extern int func_ov002_022018cc(void *b, int player, int idx);

int func_ov002_0220196c(void *a, void *b) {
    struct F2Cat *b_cat;
    int i, j;

    if (b == 0) {
        return 0;
    }

    b_cat = (struct F2Cat *)((char *)b + 2);
    if (b_cat->cat != 0) {
        return 0;
    }

    if (func_ov002_021b8ecc(b) == 0) {
        goto fail;
    }

    {
        struct F2Bit14 *b_f2_14 = (struct F2Bit14 *)((char *)b + 2);
        struct F2Bit0 *b_f2_0 = (struct F2Bit0 *)((char *)b + 2);
        struct F2Bit0 *a_f2_0 = (struct F2Bit0 *)((char *)a + 2);
        int lhs = 1 - a_f2_0->bit0;
        int rhs = b_f2_0->bit0 ^ b_f2_14->bit14;
        if (lhs != rhs) {
            goto fail;
        }
    }

    if (func_0202b878(*(u16 *)b) != 0x16) {
        goto fail;
    }

    for (i = 0; i < 2; i++) {
        for (j = 0; j < 5; j++) {
            if (func_ov002_021c1ef0(a, i, j) != 0) {
                if (func_ov002_022018cc(b, i, j) != 0) {
                    return 1;
                }
            }
        }
    }

fail:
    return 0;
}
