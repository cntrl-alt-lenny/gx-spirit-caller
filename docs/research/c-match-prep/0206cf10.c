/* CAMPAIGN-PREP candidate for func_0206cf10 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind a/b; diff reused as store+branch; exact store order h0,h1,w,lr
 *   risk:       Already .s for being reg-alloc-walled: orig holds a in r5 / b in r4 across every use and hoists the 5th-arg out_w load + `cmp lr,#0` ahead of the stores. mwcc will likely reschedule the stores / reload a or b. permuter-class (scheduling + 5-arg coin-flip; expect escape to .s).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0206cf10 (main, class C) - brief 494.
 * UNVERIFIED build-free draft. recipe: bind a(r5)/b(r4) across the body;
 * subs diff reused as both the stored value and the !=0 test; STRICT store
 * order (h0,h1,w,lr); 5th arg out_w from the stack; shared a->f40+b tail.
 * NOTE: currently ships as whole-function .s (reg-alloc-walled, brief 302). */
/* p=ctx->f64; a=p->fc4; b=p->ff8; diff=a->f44-b;
 * if(diff<0){ *out_lr=-1; return 0; }
 * *out_h0=a->f0a; *out_h1=a->f18; *out_w=a->f1c; *out_lr=diff;
 * if(diff!=0) return a->f40+b; if(a->f8==4) return a->f40+b; return 0. */

typedef struct {
    char _pad08[8]; unsigned char f8; char _pad09[1]; unsigned short f0a;
    char _pad0c[0xc]; unsigned short f18; char _pad1a[2]; int f1c;
    char _pad20[0x20]; int f40; int f44;
} A;
typedef struct { char _padc4[0xc4]; A *fc4; char _padc8[0x30]; int ff8; } P;
typedef struct { char _pad64[0x64]; P *f64; } Ctx;

int func_0206cf10(Ctx *ctx, int *out_lr, unsigned short *out_h0,
                  unsigned short *out_h1, int *out_w)
{
    P *p = ctx->f64;
    A *a = p->fc4;
    int b = p->ff8;
    int diff = a->f44 - b;
    if (diff < 0) {
        *out_lr = -1;
        return 0;
    }
    *out_h0 = a->f0a;
    *out_h1 = a->f18;
    *out_w  = a->f1c;
    *out_lr = diff;
    if (diff != 0)
        return a->f40 + b;
    if (a->f8 == 4)
        return a->f40 + b;
    return 0;
}
