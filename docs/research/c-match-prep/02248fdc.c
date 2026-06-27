/* CAMPAIGN-PREP candidate for func_02248fdc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: :13 + packed b8*2+bit13 via literal shifts; bind base; walking u32* rec
 *   risk:       reshape-able: packed-arg temp scheduling (b8/bit13/ip ordering) may rotate regs; if so, lift packed into an explicit temp computed before the && to match mov ip,w<<0x12.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02248fdc (ov002, class D) — MED tier.
 * ANALYSIS-ONLY (build-free). ov002 per-parity loop over cf16c records.
 * po=(arg0&1)*0x868; guard via cf17c symbol (=cf16c+0x10) nonzero; base=cf16c+po;
 * record array at base+0x260, stride 4, count re-read at [base+0x10] each iter.
 * Per record w: low13=((u32)w<<19)>>19 compared == 0x12a1 (forces lsl#0x13;lsr#0x13);
 * then the packed arg r3 = b8*2 + bit13 where b8=(w<<2)>>24 (bits6..13) and
 * bit13=(w<<18)>>31 — reproduced with the literal shifts to match lsl#2;lsr#0x18
 * and lsl#0x12;lsr#0x1f. func_021b3fd8(arg0,0xb,0x12a1,packed)==0 then 02253458. */
typedef unsigned int u32;

extern int  data_ov002_022cf17c[];               /* = cf16c+0x10 (count) */
extern char data_ov002_022cf16c[];
extern int  func_ov002_021b3fd8(int arg0, int a, int b, int packed);
extern void func_ov002_02253458(int arg0, int kind, int idx);

void func_ov002_02248fdc(int arg0) {
    char *base;
    u32 *rec;
    int i, n;
    u32 w;
    int po = (arg0 & 1) * 0x868;

    if (*(int *)((char *)data_ov002_022cf17c + po) == 0)
        return;
    base = data_ov002_022cf16c + po;
    rec = (u32 *)(base + 0x260);
    i = 0;
    do {
        w = *rec;
        if ((int)((w << 19) >> 19) == 0x12a1 &&
            func_ov002_021b3fd8(arg0, 0xb, 0x12a1,
                                (int)(((w << 2) >> 24) * 2 + ((w << 18) >> 31))) == 0)
            func_ov002_02253458(arg0, 0xd, i);
        n = *(int *)(base + 0x10);
        i++;
        rec++;
    } while ((u32)i < (u32)n);
}
