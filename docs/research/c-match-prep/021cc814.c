/* CAMPAIGN-PREP candidate for func_021cc814 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: constant /4096 idiom + two-nibble bitfield eq gate, switch dispatch
 *   risk:       permuter-class (documented 1-reg wall): the case-0 `[g+0x268]` load lands r2 vs orig r0 (load-dest reg-numbering); /4096 idiom itself matches. C reshape won't move the load dest. Banked wall in ov011_core.h.
 *   confidence: med
 */
/* func_ov011_021cc814: compute a clamped interpolated value and forward to
 * func_ov011_021cc664(base, target).  base = 021cc7dc()+021cc124()? sum clamped
 * to 0xff; if 021cf0a4()==0 ease via field218 * delta /4096; else dispatch on
 * field264 {0: nibble-equality gate, 1: 021cdb7c gate} forcing target=base.
 * Class D: constant /4096 (mul;asr;add lsr;asr idiom). */
extern char data_ov011_021d403c[];
extern int  func_02019124(void);
extern int  func_ov011_021cc7dc(void);
extern void func_ov011_021cc664(int a, int b);
extern int  func_ov011_021cdb7c(void);
extern int  func_ov011_021cf0a4(void);

void func_ov011_021cc814(void) {
    char *g = data_ov011_021d403c;
    int base = func_ov011_021cc7dc();
    int lo   = func_02019124();
    int hi   = lo + base;
    if (hi > 0xff) hi = 0xff;
    if (func_ov011_021cf0a4() == 0) {
        int delta = hi - lo;
        int v = lo + (*(int *)(g + 0x218) * delta) / 4096;
        func_ov011_021cc664(v, hi);
        return;
    }
    switch (*(int *)(g + 0x264)) {
    case 0: {
        unsigned int w = *(unsigned int *)(g + 0x268);
        /* bits[12:9] == bits[16:13] -> force target = base */
        if (((w << 0x17) >> 0x1c) == ((w << 0x13) >> 0x1c)) hi = lo;
        break;
    }
    case 1:
        if (func_ov011_021cdb7c() == 0) hi = lo;
        break;
    default:
        break;
    }
    func_ov011_021cc664(lo, hi);
}
