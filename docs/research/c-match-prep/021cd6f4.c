/* CAMPAIGN-PREP candidate for func_021cd6f4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     shifted-or operand-first (h4|(h6<<16)); decl-order=load-order; parity*0x868 base; RMW=load,add,store sequence
 *   risk:       reshape-able: the `and ip,#1`/`mla` parity-base may CSE differently (orig recomputes base+off in each arm). If mwcc reloads `0x14`/`0x868` mid-arm, bind base once vs recompute per arm. Borderline reg-alloc -> permuter.
 *   confidence: med
 */
/* func_ov002_021cd6f4: parity per-player table RMW. base = cf1a8 + parity*0x868,
 * row = (h2&0xff)*20; packed = h4 | (h6<<16). If hi byte of h2 != 0 the slot is
 * accumulated (load,add,store); else plain store. Posts 0x24, clears +0x80c. */

extern char data_ov002_022ce950[];
extern char data_ov002_022cf1a8[];
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);

void func_ov002_021cd6f4(void) {
    int flag = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    unsigned short h2 = *(unsigned short *)(data_ov002_022ce950 + 2);
    unsigned short h4 = *(unsigned short *)(data_ov002_022ce950 + 4);
    unsigned short h6 = *(unsigned short *)(data_ov002_022ce950 + 6);
    int packed = (int)h4 | ((int)h6 << 16);
    int lo2 = h2 & 0xff;
    int hi2 = (h2 >> 8) & 0xff;
    char *base = data_ov002_022cf1a8 + (flag & 1) * 0x868;
    int off = lo2 * 20;

    if (hi2 != 0)
        *(int *)(base + off) = *(int *)(base + off) + packed;
    else
        *(int *)(base + off) = packed;

    func_ov002_0229ade0(0x24, 0, 0, 0);
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
