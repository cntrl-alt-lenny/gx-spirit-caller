/* CAMPAIGN-PREP candidate for func_02032ac4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C/D: bit-set 0x1000 then cond bic/orr 0x2000; same word reloaded via +0x2b4 base.
 *   risk:       The asm forms a SECOND base `add r1,r4,#0x2b4` and uses `[r1,#0xc00]` for the 0x2000 RMW while feb4 uses `[r4,#0xeb4]` for 0x1000 — same address, two different base regs. Clean C uses one base => one fewer add. struct-guessed/permuter-class (base-reg split won't reshape from C).
 *   confidence: low
 */
/* func_02032ac4: if func_020334cc(ctx)!=0 return early. Else set bit 0x1000 in
 * ctx->feb4; if (arg1) clear bit 0x2000 at ctx+0x2b4+0xc00, else set it and
 * call func_020327e4(ctx). Finally if ctx->fee8 call it via blx(arg1).
 *   r4=ctx(arg2), r5=arg1
 *   if (func_020334cc(ctx)) return;
 *   ctx->feb4 |= 0x1000;
 *   if (arg1) ctx->[0xeb4-region]&=~0x2000;
 *   else { ctx->[..]|=0x2000; func_020327e4(ctx); }
 *   if (ctx->fee8) ctx->fee8(arg1);
 */

extern int  func_020334cc(void *ctx);
extern void func_020327e4(void *ctx);

typedef void (*cbf_t)(void *a);

struct Ctx_02032ac4 {
    char  _pad0[0xeb4];
    int   feb4;   /* +0xeb4 (== +0x2b4 + 0xc00) */
    char  _pad1[0x30];
    cbf_t fee8;   /* +0xee8 */
};

void func_02032ac4(void *unused_r0, void *arg1, struct Ctx_02032ac4 *ctx) {
    if (func_020334cc(ctx) != 0) return;
    ctx->feb4 |= 0x1000;
    if (arg1) {
        ctx->feb4 &= ~0x2000;
    } else {
        ctx->feb4 |= 0x2000;
        func_020327e4(ctx);
    }
    if (ctx->fee8) {
        ctx->fee8(arg1);
    }
}
