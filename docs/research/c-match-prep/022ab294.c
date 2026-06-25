/* CAMPAIGN-PREP candidate for func_022ab294 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :N bitfields for lsl;lsr; signed /2; u16 pack; cross-call live r5; 2x32 fill
 *   risk:       permuter-class: r5 (computed at top) must survive ~6 intervening calls in a callee-saved reg, and the bitfield/u16-pack op scheduling is reg-rotation-sensitive; func_02005188 stack-arg packing (sp[0]=3,sp[4]=0xc) + the 0202b7cc-result wiring are guessed. struct-guessed + permuter-class
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_022ab294 (ov002, class C, MED tier).
 * UNVERIFIED + PERMUTER-LEANING (per triage). Bitfield extraction chain feeds r5
 * (0 or 0x16) which must stay callee-saved across ~6 calls to the final loop.
 * Bitfields decoded from lsl/lsr pairs; struct/global layouts inferred.
 *   recipe: :N bitfield members for the lsl;lsr extracts; signed /2 for asr; u16 pack; cross-call live r5; 2x32 fill loop.
 */
extern int  func_ov002_021b00e8(int sel);
extern int  func_0208df40(void);
extern int  func_0208e200(void);
extern void func_02001d0c(void *a, int b, int c);
extern void func_02005188(void *a, int b, int c, int d, int e, int f);
extern void func_0202b7cc(int v);
extern void func_02094504(int a, int b, int c);
extern char data_02102c90[];
extern char data_02104f4c[];
extern char data_ov002_022cd73c[];

int func_ov002_022ab294(int *self, unsigned short *src)
{
    int g0  = *(int *)(data_02102c90 + 0x4);
    int g1  = *(int *)(data_02104f4c + 0x4);
    unsigned int s = *src;
    int r5, lo, packed, neg, ret, base, i, row, val;
    short *p;

    /* r5 = ((signed 2-bit field of g0) / 2) != 0 ? 0x16 : 0 */
    {
        int f = (g0 << 27) >> 30;        /* signed 2-bit -> but lsr in asm: see risk */
        r5 = ((f / 2) != 0) ? 0x16 : 0;
    }

    {
        int bit0 = (int)(s & 1);
        int five = (int)((s >> 1) & 0x1f);
        int eq   = ((g1 ^ 1) == bit0) ? 1 : 0;
        lo = eq + ((five - 0xc) << 1);
        ret = func_ov002_021b00e8(bit0);
    }

    packed = ((lo + 0xa) & 0xff) | ((ret & 0xff) << 8);
    neg = -(int)(unsigned short)packed;
    if (*self == neg) return r5; /* asm returns r0=neg-path-or-falls; see risk */
    *self = neg;

    ret = func_0208df40();
    func_02001d0c(data_ov002_022cd73c, 0x3e, 2);
    func_02094504(0, ret + 0x40, 0x1f00);
    func_0202b7cc(lo + 0x46 + 0x200);
    func_02005188(data_ov002_022cd73c, 0 /*r1=0202b7cc ret*/, ret + 0x40, 1, 3, 0xc);

    base = func_0208e200();
    p = (short *)(base + (r5 << 6));
    val = 1;
    for (row = 0; row < 2; row++) {
        for (i = 0; i < 0x20; i++) {
            *p++ = (short)val;
            val++;
        }
        val += 0x1e;
    }
    return 0;
}
