/* CAMPAIGN-PREP candidate for func_0206d7c0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     hoist hi=min(hi,lo) before irq; bind eng to r7; precompute sub=eng+0x104; loop with two breaks
 *   risk:       permuter-class: 9 callee-saved regs + spilled irq([sp]) and got(r6) carried across loop — register rotation / the movge r6,r9 vs str ordering at .L_38 is a scheduling coin-flip; struct-guessed offsets.
 *   confidence: med
 */
/* func_0206d7c0 @ main : class C (irq-wrapped retry loop, spilled args) */
typedef int OSIntrMode;
typedef struct Ctx Ctx;
struct Ctx {
    char pad00[0x68];
    void *e68;   /* 0x68 engine; +0x100 u16, +0x104 sub */
};

extern OSIntrMode OS_DisableIrq(void);
extern void OS_RestoreIrq(OSIntrMode mode);
extern int func_0206d79c(Ctx *ctx);
extern void func_02091a8c(void *sub);

int func_0206d7c0(Ctx *ctx, int lo, int hi, unsigned short *out, int flags)
{
    void *eng;
    OSIntrMode irq;
    int wait;
    void *sub;
    int got;
    int avail;

    if (hi > lo) {
        hi = lo;
    }
    eng = ctx->e68;
    irq = OS_DisableIrq();
    wait = flags & 1;
    sub = (char *)eng + 0x104;
    for (;;) {
        avail = func_0206d79c(ctx);
        if (avail >= hi) {
            *out = *(unsigned short *)((char *)eng + 0x100);
            got = avail;
            if (got > lo) {
                got = lo;
            }
            break;
        }
        if (!wait) {
            got = 0;
            break;
        }
        func_02091a8c(sub);
    }
    OS_RestoreIrq(irq);
    return got;
}
