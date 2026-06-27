/* CAMPAIGN-PREP candidate for func_02049684 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     preserve a/b in r5/r4 across guard; buf=sp+0; strb terminator at [buf,r]; ret 1/0 via moveq
 *   risk:       the call to func_02049038(-1,...) in asm passes only r0=-1 (mov r0,r3 where r3=#-1) leaving r1/r2 stale, not zeroed; my (-1,0,0) adds mov r1/r2=0 -> extra instrs. reshape-able: drop the 0 args (1-arg decl) so only r0 is set.
 *   confidence: med
 */
/* func_02049684 (main, class C). g = *data_0219dc80.
 * If g==0 -> 0. If func_02047804()==0 -> 0. Else fill stack buf[0x100]:
 * r = func_020438b8(a, b, buf, 0xff); if r==-1 return 0;
 * buf[r]=0; ret = func_02049038(-1, ...) -> return (ret==0)?1:0. */

typedef struct State02049684 { int f0; } State02049684;

extern State02049684 *data_0219dc80;
extern int  func_02047804(void);
extern int  func_020438b8(int a, int b, char *buf, int c);
extern int  func_02049038(int a, void *b, void *c);

int func_02049684(int a, int b) {
    char buf[0x100];
    if (data_0219dc80 == 0) return 0;
    if (func_02047804() == 0) return 0;
    {
        int r = func_020438b8(a, b, buf, 0xff);
        if (r == -1) return 0;
        buf[r] = 0;
        if (func_02049038(-1, 0, 0) == 0) return 1;
        return 0;
    }
}
