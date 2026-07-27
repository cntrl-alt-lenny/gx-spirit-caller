/* func_ov002_02206078: compare func_ov002_021bbe70(!b0) to func_ov002_021bbe70(b0);
 * if not strictly greater, false. Else require kind==6 and that bit9 of
 * self+0x14 matches b0. self->f2 is re-read after each call (not cached)
 * since the intervening calls could touch it. */
struct S02206168 {
    unsigned short b0 : 1;
    unsigned short _pad1 : 5;
    unsigned short kind : 6;
};

struct F14Bit {
    unsigned int _pad : 9;
    unsigned int bit9 : 1;
};

extern int func_ov002_021bbe70(int player);

int func_ov002_02206078(void *self) {
    struct S02206168 *s = (struct S02206168 *)((char *)self + 2);
    int call1 = func_ov002_021bbe70(1 - s->b0);
    int call2 = func_ov002_021bbe70(s->b0);

    if (call1 <= call2)
        return 0;

    if (s->kind == 6) {
        struct F14Bit *f14 = (struct F14Bit *)((char *)self + 0x14);
        return f14->bit9 == s->b0;
    }
    return 0;
}
