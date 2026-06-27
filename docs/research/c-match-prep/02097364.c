/* CAMPAIGN-PREP candidate for func_02097364 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ret=0; a=(f1c&2)!=0 cmov held live; inner f1c&4 clear+field copies in store order; if(a) tail
 *   risk:       orig keeps a in r0 live across func_020972d4 then re-tests cmp r0 for the trailing if(a) (a is callee-saved-ish via movne/moveq); mwcc may recompute (f1c&2) after the call instead of holding r0, adding an ldr/ands - reshape-able (bind a to a local int reused, not re-read p->f1c)
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02097364 (main, class C) - p_0044.
 * UNVERIFIED build-free draft: drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     ret r4=0; a=(f1c&2)!=0 cmov held in r0 across; if(a){ func_020972d4(p); if(f1c&4){clear, ret=f44, zero f44, copy 3c->2c/40->34/48->50} if(a) func_02097258(p);} return ret
 *   risk:       see risk note
 *   confidence: med
 */
/* func_02097364(p): ret=0; a=(p->f1c&2)!=0; if(a){ func_020972d4(p);
 *   if((p->f1c&4)!=0){ p->f1c&=~4; ret=p->f44; p->f44=0; p->f2c=p->f3c; p->f34=p->f40; p->f50=p->f48; }
 *   if(a) func_02097258(p); } return ret. a (r0) is held live across the inner block (cmp r0 reused). */

extern int func_020972d4(void *p);
extern int func_02097258(void *p);

typedef struct {
    unsigned char pad00[0x1c];
    unsigned int  f1c;   /* 0x1c flags */
    unsigned char pad20[0xc];
    int           f2c;   /* 0x2c */
    unsigned char pad30[0x4];
    int           f34;   /* 0x34 */
    unsigned char pad38[0x4];
    int           f3c;   /* 0x3c */
    int           f40;   /* 0x40 */
    int           f44;   /* 0x44 */
    int           f48;   /* 0x48 */
    unsigned char pad4c[0x4];
    int           f50;   /* 0x50 */
} Obj02097364;

int func_02097364(Obj02097364 *p)
{
    int ret;
    int a;

    ret = 0;
    a = (p->f1c & 0x2) != 0;
    if (a) {
        func_020972d4(p);
        if ((p->f1c & 0x4) != 0) {
            p->f1c &= ~0x4;
            ret = p->f44;
            p->f44 = 0;
            p->f2c = p->f3c;
            p->f34 = p->f40;
            p->f50 = p->f48;
        }
        if (a) {
            func_02097258(p);
        }
    }
    return ret;
}
