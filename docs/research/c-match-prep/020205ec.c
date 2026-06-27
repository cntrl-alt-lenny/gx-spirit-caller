/* CAMPAIGN-PREP candidate for func_020205ec (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early guard, 3-arg callback, >/== branch with 1<<(n-1), store-order
 *   risk:       the >/== split: orig does cmp f8,fa; bls then bne so the (f8>fa) path stores f8&f6 while (f8==fa) path ORs into f6 -- three-way via two compares. mwcc if/else-if on > then == should reproduce, but the shared ip=(u16)p->f8 and shift 1<<(ip-1) reg reuse may rotate. reshape-able (explicit > then == ladder) + struct-guessed
 *   confidence: low
 */
/* func_020205ec: register a depth p into the ctl bitmask state.
 * if (u16)p->f2 set -> abort path. else optional f38 callback. Then by
 * comparing ctl.f8 to p->fa: deeper(>) resets f8=fa,f6=bit; equal ORs bit
 * into f6 (bit = 1<<(p->f8-1)). Then drive func_02020550((u16)(p->f8+1)).
 */
struct P  { char pad0[2]; unsigned short f2; char pad4[0x8-0x4]; unsigned short f8; unsigned short fa; };
struct Ctl{ char pad0[6]; unsigned short f6; unsigned short f8; void (*f38)(void *, int, int); };
extern struct Ctl data_02191f40;
extern unsigned char data_020c67dc[];
extern void func_0201f138(int);
extern void func_0201f19c(void);
extern int  func_02020550(int);

void func_020205ec(struct P *p)
{
    int n;
    if (p->f2 != 0) {
        func_0201f19c();
        func_0201f138(9);
        return;
    }
    if (data_02191f40.f38 != 0)
        data_02191f40.f38(data_020c67dc, p->f8, p->fa);

    n = p->f8;
    if (data_02191f40.f8 > p->fa) {
        data_02191f40.f8 = p->fa;
        data_02191f40.f6 = (unsigned short)(1 << (n - 1));
    } else if (data_02191f40.f8 == p->fa) {
        data_02191f40.f6 = (unsigned short)(data_02191f40.f6 | (1 << (n - 1)));
    }
    {
        int r = func_02020550((unsigned short)(n + 1));
        if (r == 0x18) { func_0201f138(7); return; }
        if (r == 2) return;
        func_0201f138(9);
    }
}
