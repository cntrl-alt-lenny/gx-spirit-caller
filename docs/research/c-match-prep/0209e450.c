/* CAMPAIGN-PREP candidate for func_0209e450 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload ctx->msg each use (CSE across calls naturally); case-9 falls through to 10/11; cmp-chain switch
 *   risk:       struct-guessed: f_bc@+0xbc, f_182@+0x182. Note orig splits +0x182 two ways — `add r2,#0x182` (pool) for the call arg vs `add #0x100;ldrh #0x82` for the read; only this offset reproduces that split.
 *   confidence: med
 */
/* func_0209e450 — class C: switch-on-state, struct offsets; reg-alloc.
 * ctx->msg (+4) reloaded each use; switch on *(u16*)msg; cases 9/10/11. */

extern void func_020928cc(void *addr, int len);
extern int  func_0209dc8c(void);
extern void *func_0209dca8(void);

typedef struct {
    char _pad[0xbc];
    unsigned short f_bc;   /* +0xbc */
    char _pad2[0x182 - 0xbc - 2];
    unsigned short f_182;  /* +0x182 */
} Msg;

typedef struct {
    char  _pad04[4];
    Msg  *msg;             /* +0x4 */
} Ctx;

int func_0209e450(void) {
    Ctx *ctx;

    ctx = (Ctx *)func_0209dca8();
    if (func_0209dc8c() != 0) {
        return 0;
    }
    func_020928cc(ctx->msg, 2);
    switch (*(unsigned short *)ctx->msg) {
    case 9:
        func_020928cc((char *)ctx->msg + 0x182, 2);
        if (ctx->msg->f_182 == 0) {
            return 0;
        }
        /* fallthrough */
    case 10:
    case 11:
        func_020928cc((char *)ctx->msg + 0xbc, 2);
        return ctx->msg->f_bc;
    default:
        return 0;
    }
}
