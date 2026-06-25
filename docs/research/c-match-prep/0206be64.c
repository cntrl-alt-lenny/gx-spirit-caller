/* CAMPAIGN-PREP candidate for func_0206be64 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ldrsb b->fd==1 branch; buf(sp8) declared so it sits above sp4/sp0
 *   risk:       Frame 0x2c is mostly the &sp8 buffer whose size is struct-guessed; stack-slot order (sp8 buffer, sp4 aux, sp0 out) must place buf above the scalars. mwcc slot assignment may invert => offsets shift. struct-guessed (confirm buf size + slot layout).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0206be64 (main, class C) - brief 494.
 * UNVERIFIED build-free draft. recipe: branch on signed byte field 0xd;
 * stack-buffer decl-order (sp8 buffer used first, then sp4, then sp0);
 * f8 pointer set in both arms; result reloaded from slot0.
 * NOTE: EUR-specific; differs from the USA/JPN func_0206be64.legacy.c. */
/* if(b->fd==1){ func_02092614(&buf,&local4,1); b->f8=&buf;
 *   func_0206bef4(a,b); func_020924c0(&buf,&out,1); }
 * else { b->f8=0; out=func_0206bef4(a,b); } return out;  frame 0x2c. */

typedef struct { char _pad08[8]; void *f8; char _pad0c[1]; signed char fd; } Node;

extern void func_02092614(void *dst, int *aux, int n);
extern void func_020924c0(void *src, int *out, int n);
extern int  func_0206bef4(void *a, Node *b);

int func_0206be64(void *a, Node *b)
{
    int out;
    int local4;
    int buf[9];
    if (b->fd == 1) {
        func_02092614(buf, &local4, 1);
        b->f8 = buf;
        func_0206bef4(a, b);
        func_020924c0(buf, &out, 1);
    } else {
        b->f8 = 0;
        out = func_0206bef4(a, b);
    }
    return out;
}
