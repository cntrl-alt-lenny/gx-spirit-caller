/* CAMPAIGN-PREP candidate for func_0207ef90 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: same range-guard as ec68; asr-4 signed >>4 stores at +6 stride 0x20; he*0x20 base; return pre-inc he
 *   risk:       struct-guessed + reshape-able: he*0x20 base and +6/+e/+16/+1e stride assume 0x20 entries here vs 8 in ec68 (lsl#5). If src is short* not int*, the asr#4 and ldr widths diverge.
 *   confidence: low
 */
/* func_0207ef90: range-guard then write 4 (src[i]>>4) shorts into the +6 field
 * of 4 consecutive 8-byte cell entries; advances A->he. Returns 0xfffe if the
 * run is empty, else the (pre-increment) he index. mla base identical to ec68. */
extern unsigned char data_021a08f4[];

typedef struct {
    int      field0;      /* +0x00 */
    unsigned char  pad4[6];/* +0x04 */
    unsigned short ha;     /* +0x0a */
    unsigned short hc;     /* +0x0c */
    unsigned short he;     /* +0x0e */
} CellB;

int func_0207ef90(CellB *a, int *src) {
    unsigned short hc = a->hc;
    unsigned short he = a->he;
    int flag = 0;
    unsigned int run;
    if (he <= (unsigned short)(hc + 1)) {
        if (a->ha <= hc) flag = 1;
    }
    if (flag) {
        run = (unsigned short)(hc - he + 1);
    } else {
        run = 0;
    }
    if ((run >= 1 ? 1 : 0) == 0) {
        return 0xfffe;
    }
    {
        unsigned short idx = a->he;
        short *base = (short *)(data_021a08f4 + a->field0 * 0x540 + 0x100 + (idx << 5));
        base[3]  = (short)(src[0] >> 4);   /* +0x06 */
        base[7]  = (short)(src[1] >> 4);   /* +0x0e */
        base[11] = (short)(src[2] >> 4);   /* +0x16 */
        base[15] = (short)(src[3] >> 4);   /* +0x1e */
        a->he = (unsigned short)(idx + 1);
        return idx;
    }
}
