/* CAMPAIGN-PREP candidate for func_020942b0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: clamp via if-assign (cmp 0x1d8 + movcs); ctrl = const | (n>>2); two tails by const
 *   risk:       last-DMA ctrl: orig builds 0xc4400000 as `-0x3bc00000 rsb#0` (=0x84400000)? actually mov#0x3bc00000;rsb#0 yields 0xc4400000. If my const is wrong by sign, ctrl word diverges. struct-guessed + reshape-able (fix literal).
 *   confidence: low
 */
// func_020942b0 — clamp pending len to 0x1d8, advance ring ptr, kick DMA copy; two tails differ by ctrl const
// data_021a6710: { x0, +0x4 dst, +0x8 srcptr(r5), +0xc remaining(r4) }

extern void func_01ff8770(int dst, int src, int ctrl);
extern void func_020905a8(int mask);
extern void func_020906dc(int dst, void *cb, int arg);

typedef struct {
    int  x0;     // 0x0
    int  dst;    // 0x4
    int  srcptr; // 0x8
    int  remain; // 0xc
} Ctx2;
extern Ctx2 data_021a6710;
extern void func_0209423c(void); // _LIT1 callback

void func_020942b0(void) {
    int remain;
    int src;
    int n;

    remain = data_021a6710.remain;
    if (remain == 0)
        return;
    src = data_021a6710.srcptr;
    n = remain;
    if ((unsigned int)n >= 0x1d8)
        n = 0x1d8;
    data_021a6710.remain = data_021a6710.remain - n;
    data_021a6710.srcptr = src + n;
    if (data_021a6710.remain == 0) {
        func_020906dc(data_021a6710.dst, func_0209423c, 0);
        func_01ff8770(data_021a6710.dst, src, 0xc4400000 | ((unsigned int)n >> 2));
        func_020905a8(0x200000);
        return;
    }
    func_01ff8770(data_021a6710.dst, src, 0x84400000 | ((unsigned int)n >> 2));
    func_020905a8(0x200000);
}
