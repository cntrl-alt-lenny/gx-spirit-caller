/* CAMPAIGN-PREP candidate for func_02062600 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D store-order: bswap32 built in asm orr-chain order ((>>24)|(>>8) first)
 *   risk:       PROVIDED ASM IS TRUNCATED at .L_1b4 -- the tail dispatch loop (mov r7,#1; bl func_020627a8) is unseen, so the body past h->f_24++ is a placeholder and cannot byte-match -- struct-guessed + incomplete-asm.
 *   confidence: low
 */
/* func_02062600 (cls D, size 0x184): 32-bit byte-swap guard, store-order, then
 * a build + dispatch loop.  NOTE: the provided asm is TRUNCATED at .L_1b4
 * (the tail loop calling func_020627a8 is not visible) -- the loop body below
 * is a best-effort placeholder; the front half (swap + guard + the two calls)
 * is faithful.
 *
 * func_02064dfc(c, &x, &hw) -> bool, fills x=[sp+8], hw=[sp+0].
 * guard: ret && x && hw, then bswap32(x): if ((swap & 0xE0000000)==0xE0000000) ret 4.
 * func_02062468(a, &h); if nonzero return it.
 * h->f_20 = arg6; func_0206238c(h, d, ...); if nonzero { func_02064790(h); return; }
 *
 * Stack args (5..8) = [sp+0x28..0x34].
 */

typedef struct Sub Sub;
struct Sub {
    char _pad0[0x20];
    int  f_20;
    int  f_24;
};

extern int  func_02064dfc(int c, int *xout, int *hwout);
extern int  func_02062468(int a, Sub **hout);
extern int  func_0206238c(Sub *h, int d, int e, int f, int g);
extern int  func_02064790(Sub *h);
extern int  func_020627a8(int a);

int func_02062600(int a, int *b, int c, int d, int arg5, int arg6, int arg7, int arg8)
{
    int x;
    unsigned short hw;
    Sub *h;
    unsigned int swap;
    int r;

    if (!func_02064dfc(c, &x, (int *)&hw))
        return 4;
    if (x == 0)
        return 4;
    if (hw == 0)
        return 4;

    swap  = ((unsigned)x >> 24) & 0xff;
    swap |= ((unsigned)x >> 8) & 0xff00;
    swap  = (((unsigned)x << 8) & 0xff0000) | swap;
    swap  = (((unsigned)x << 24) & 0xff000000) | swap;
    if ((swap & 0xE0000000) == 0xE0000000)
        return 4;

    r = func_02062468(a, &h);
    if (r != 0)
        return r;

    h->f_20 = arg6;
    r = func_0206238c(h, d, arg5, arg7, arg8);
    if (r != 0) {
        func_02064790(h);
        return r;
    }

    if (arg8 == 0) {
        if (b != 0)
            *b = (int)h;
        return 0;
    }

    h->f_24++;
    /* TRUNCATED loop tail (func_020627a8 dispatch) -- not in provided asm */
    func_020627a8(a);
    return 0;
}
