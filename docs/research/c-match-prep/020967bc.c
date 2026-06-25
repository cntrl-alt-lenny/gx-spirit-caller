/* CAMPAIGN-PREP candidate for func_020967bc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind inner,idx first; need=idx<<3 CSE; early-return; stack arg struct; tail(p,7)
 *   risk:       stack frame slot order for in[]/out[] (orig: out at sp+8, in at sp+0) is decl-order-sensitive; if mwcc swaps the two 2-word locals the str [sp,#0x8]/[sp,#0xc] vs [sp]/[sp,#4] offsets flip - reshape-able (reorder out/in decls)
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020967bc (main, class C) - p_0044.
 * UNVERIFIED build-free draft: drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     bind inner=p->f08 and idx=p->f34 first; r2=idx<<3 CSE; bounds early-return; stack 2-word arg struct; tail func_020965ac(p,7)
 *   risk:       see risk note
 *   confidence: med
 */
/* func_020967bc: inner=p->f08; idx=p->f34; need=idx<<3; if(need>=inner->f30) return 1;
 * build {inner->f08copy=p->f08, ptr=inner->f2c+need} on stack, out 2-word; r=func_020970a8(in,out,8);
 * if(r) return r; p->f30=out[0]; p->f34=out[1]; p->f38=idx; tail func_020965ac(p,7). */

extern int func_020970a8(void *in, void *out, int size);
extern int func_020965ac(void *p, int mode);

typedef struct {
    unsigned char pad00[0x8];
    void         *f08;   /* 0x08 -> inner */
    unsigned char pad0c[0x28];
    int           f34;   /* 0x34 */
} Obj020967bc;

typedef struct {
    unsigned char pad00[0x2c];
    int           f2c;   /* 0x2c */
    int           f30;   /* 0x30 */
} Inner020967bc;

int func_020967bc(Obj020967bc *p)
{
    Inner020967bc *inner;
    int idx;
    int need;
    int in[2];
    int out[2];
    int r;

    inner = (Inner020967bc *)p->f08;
    idx   = p->f34;
    need  = idx << 3;
    if (need >= inner->f30) {
        return 1;
    }

    in[0] = (int)p->f08;
    in[1] = inner->f2c + need;
    r = func_020970a8(out, in, 8);
    if (r) {
        return r;
    }

    *(int *)((char *)p + 0x30) = out[0];
    p->f34 = out[1];
    *(int *)((char *)p + 0x38) = idx;
    return func_020965ac(p, 7);
}
