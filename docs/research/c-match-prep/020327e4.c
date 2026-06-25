/* CAMPAIGN-PREP candidate for func_020327e4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: mla (i-matched)*stride+base; reload buf=[sp] each use; b in r8 across call.
 *   risk:       b is held in r8 across func_02046ac4 (callee-saved live); and buf is RELOADED from [sp] twice. mla fuses only if (i-matched), stride, base stay in regs. Heavy liveness/reload pattern; partly permuter-class (reg rotation across the 3 calls).
 *   confidence: low
 */
/* func_020327e4: scan a buffer of n bytes (n=func_02046a5c(&buf)). For each
 * byte b=buf[i]: if b==compare() then matched++ ; else write into a 2-D table
 * at ctx+0xea8 (stride ctx+0xea4) at row (i-matched) with value b
 * (func_02052818), then func_020526b8(buf[i], ctx->feb0).
 *   for(i=0;i<n;i++){ b=buf[i]; if(b==func_02046ac4()){matched++;continue;}
 *     slot = ctx->fea8 + (i-matched)*ctx->fea4;
 *     func_02052818(b, slot);
 *     func_020526b8(buf[i], ctx->feb0); }
 */

extern int  func_02046a5c(void *pbuf);
extern int  func_02046ac4(void);
extern void func_02052818(int b, void *slot);
extern void func_020526b8(int b, int arg);

struct Ctx_020327e4 {
    char _pad[0xea4];
    int  stride;  /* +0xea4 */
    char *base;   /* +0xea8 */
    char _pad2[0x4];
    int  feb0;    /* +0xeb0 */
};

void func_020327e4(struct Ctx_020327e4 *ctx) {
    unsigned char *buf;
    int n, i, matched;
    n = func_02046a5c(&buf);
    matched = 0;
    if (n <= 0) return;
    for (i = 0; i < n; i++) {
        unsigned char b = buf[i];
        if (b == (unsigned char)func_02046ac4()) {
            matched++;
        } else {
            char *slot = ctx->base + (i - matched) * ctx->stride;
            func_02052818(b, slot);
            func_020526b8(buf[i], ctx->feb0);
        }
    }
}
