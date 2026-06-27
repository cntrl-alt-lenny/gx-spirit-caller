/* CAMPAIGN-PREP candidate for func_0229d184 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: per-field lsl/lsr bitfield extracts; eor-parity if-assign select; store-order; reload h per field
 *   risk:       stack frame guessed: loc[0]=(h>>6)&0xff store at [sp] is never re-read (dead) and the OUT-arg is &loc[1]; if mwcc DCEs it or reorders the loc[2..4] copies, layout diverges. struct-guessed
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229d184 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. recipe: read +0xa halfword as packed
 * bitfield; per-field lsl/lsr extracts to struct bytes; eor-parity select;
 * OUT-struct call; store-order. struct/stack layout guessed. */
extern unsigned char data_ov002_022cd73c[];
extern char data_ov002_022d1410[];
extern void func_ov002_0229d2ec(void *p);
extern void func_ov002_022a6e04(int *out, char *tbl, int b0, int b51);

void func_ov002_0229d184(char *self, int arg1, unsigned short *src) {
    int loc[5];
    unsigned int h;

    *(char *)self = 1;
    *(int *)(self + 0xc) = arg1;
    *(unsigned short *)(self + 0xa) = *src;
    func_ov002_0229d2ec(self);

    h = *(unsigned short *)(self + 0xa);
    *(char *)(self + 0x3) = (char)(((h << 0x11) >> 0x1f) << 3);

    h = *(unsigned short *)(self + 0xa);
    {
        int parity = (*(int *)(data_ov002_022cd73c + 0x4)) ^ 1;
        unsigned int h2 = *(unsigned short *)(self + 0xa);
        int eq = (parity == (int)((h << 0x1f) >> 0x1f)) ? 1 : 0;
        int t = (eq << 1) - (int)((h2 << 0x10) >> 0x1f);
        *(char *)(self + 0x2) = (char)(((unsigned int)t << 0x1e) >> 0x1b);
    }

    h = *(unsigned short *)(self + 0xa);
    loc[0] = (int)((h << 0x12) >> 0x18);
    {
        unsigned int h3 = *(unsigned short *)(self + 0xa);
        int b51 = (int)((h3 << 0x1a) >> 0x1b);
        int b0 = (int)((h3 << 0x1f) >> 0x1f);
        func_ov002_022a6e04(&loc[1], data_ov002_022d1410, b0, b51);
    }
    *(unsigned short *)(self + 0x6) = (unsigned short)loc[1];
    *(unsigned short *)(self + 0x8) = (unsigned short)loc[2];
    loc[3] = loc[1];
    loc[4] = loc[2];
    *(int *)(self + 0x10) = 0;
}
