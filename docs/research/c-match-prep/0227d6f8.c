/* CAMPAIGN-PREP candidate for func_0227d6f8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: flag if-assign, mask bound, idx hi+(lo<<4), 16-bit sext for arg split
 *   risk:       tail equality chain against base/+0x2cc/+0x300 plus the two early-return branches; mwcc branch layout and the buf-field reload order are fragile. struct-guessed (buf offsets 0x10/0x14/0x1c, list u16, data base).
 *   confidence: low
 */
extern int func_0202b8f0(int a);
extern int func_ov002_021c4c9c(int a, int b, void *c);
extern int func_ov002_0227d5f8(int a, int b);
extern int func_ov002_0227d684(int a, int b, int c);
extern int func_ov002_0227d850(int a, int b, int c);

extern int data_ov002_table;

struct St6f8 {
    char pad0[0x10];
    int f10;
    int f14;
    char pad18[0x1c - 0x18];
    int f1c;
};

int func_ov002_0227d6f8(int a, int b, int c, int n, unsigned short *list)
{
    int flag;
    int mask;
    int i;
    int idx;
    int r;
    int sel;
    struct St6f8 buf;

    flag = (c == 0) ? 1 : 0;
    mask = func_ov002_0227d5f8(a, flag);
    if (n > 0) {
        for (i = 0; i < n; i++) {
            unsigned short h = list[i];
            idx = ((h >> 8) & 0xff) + ((h & 0xff) << 4);
            mask &= ~(1 << idx);
        }
    }
    if (func_ov002_0227d684(a, flag, mask) != -1)
        return -1;
    sel = func_ov002_0227d850(a, flag, mask);
    if (sel == -1)
        return -1;
    {
        int s = (sel << 0x10) >> 0x10;
        func_ov002_021c4c9c(sel & 0xff, (s >> 8) & 0xff, &buf);
    }
    if (b == (int)&data_ov002_table ||
        b == (int)&data_ov002_table + 0x2cc ||
        b == (int)&data_ov002_table + 0x300) {
        if (buf.f1c > 0)
            return sel;
    } else {
        if (buf.f10 < 6 && func_0202b8f0(b) > buf.f14)
            return sel;
    }
    return -1;
}
