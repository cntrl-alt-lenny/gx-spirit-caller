/* CAMPAIGN-PREP candidate for func_0209e710 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload ctx->msg per use (CSE binds the f_0c-read+f_3c-addr pair, no call between); (x+0x1f)&~0x1f -> add;bic
 *   risk:       struct-guessed: f_0c@+0xc (int, ldr/==1), f_3c@+0x3c (u16, ldrh, align32). Offsets inferred from ldr/ldrh displacements; otherwise codegen is reliable.
 *   confidence: med
 */
/* func_0209e710 — class C: guarded read, align round-up bic.
 * ctx->msg (+4); read +0xc (==1 guard), then return align32(*(u16*)+0x3c). */

extern void func_020928cc(void *addr, int len);
extern int  func_0209db88(int a, int b, int c);
extern void *func_0209dca8(void);

typedef struct {
    char _pad0c[0xc];
    int  f_0c;            /* +0xc */
    char _pad10[0x3c - 0xc - 4];
    unsigned short f_3c;  /* +0x3c */
} Msg;

typedef struct {
    char  _pad04[4];
    Msg  *msg;            /* +0x4 */
} Ctx;

int func_0209e710(void) {
    Ctx *ctx;

    ctx = (Ctx *)func_0209dca8();
    if (func_0209db88(2, 7, 8) != 0) {
        return 0;
    }
    func_020928cc(&ctx->msg->f_0c, 4);
    if (ctx->msg->f_0c == 1) {
        return 0;
    }
    func_020928cc(&ctx->msg->f_3c, 4);
    return (ctx->msg->f_3c + 0x1f) & ~0x1f;
}
