/* CAMPAIGN-PREP candidate for func_02097528 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     IRQ; a=(f1c&2)!=0; f1c|=0x80; drain loop func_02096728(node,3); zero f28..f40 store-order; f3c=f40; f1c&=~0xa2
 *   risk:       the teardown reads node->f04 into r8 BEFORE the call then re-tests it after (next preserved in callee-saved r8); mwcc may reload node->f04 post-call - reshape-able (bind next before call, loop on next). Also f3c=f40 must reload the just-zeroed f40 (orig ldr [+0x40] then str [+0x3c]) not reuse the zero - keep as p->f3c=p->f40
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02097528 (main, class C) - p_0044.
 * UNVERIFIED build-free draft: drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     IRQ token r4; r5=p; a=(f1c&2)!=0; if(a){ b=func_020972d4(p); f1c|=0x80; drain list via func_02096728(node,3); zero f24; if(b)func_02097258(p); zero f28..f40 store-order, f3c=f40, f1c&=~0xa2;} restore; return 1
 *   risk:       see risk note
 *   confidence: low
 */
/* func_02097528(p): tok=OS_DisableIrq(); a=(p->f1c&2)!=0;
 *   if(a){ b=func_020972d4(p); p->f1c|=0x80; node=p->f24; if(node){ const cls=3; do{ next=node->f04;
 *     func_02096728(node,cls); node=next; }while(node); } p->f24=0; if(b) func_02097258(p);
 *     p->f28=0; p->f2c=0; p->f30=0; p->f34=0; p->f38=0; p->f40=0; p->f3c=p->f40; p->f1c&=~0xa2; }
 *   OS_RestoreIrq(tok); return 1. cls=3 (r6) and b (r7) and node (r0/r8) are callee-saved across the loop. */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int token);
extern void func_02096728(void *node, int v);
extern int  func_02097258(void *p);
extern int  func_020972d4(void *p);

typedef struct Node02097528 {
    unsigned char pad00[0x4];
    struct Node02097528 *f04;  /* 0x04 next */
} Node02097528;

typedef struct {
    unsigned char pad00[0x1c];
    unsigned int  f1c;   /* 0x1c flags */
    unsigned char pad20[0x4];
    Node02097528 *f24;   /* 0x24 list head */
    int           f28;   /* 0x28 */
    int           f2c;   /* 0x2c */
    int           f30;   /* 0x30 */
    int           f34;   /* 0x34 */
    int           f38;   /* 0x38 */
    int           f3c;   /* 0x3c */
    int           f40;   /* 0x40 */
} Obj02097528;

int func_02097528(Obj02097528 *p)
{
    int token;
    int a;
    int b;
    Node02097528 *node;
    Node02097528 *next;

    token = OS_DisableIrq();

    a = (p->f1c & 0x2) != 0;
    if (a) {
        b = func_020972d4(p);
        p->f1c |= 0x80;
        node = p->f24;
        if (node) {
            do {
                next = node->f04;
                func_02096728(node, 3);
                node = next;
            } while (node);
        }
        p->f24 = 0;
        if (b) {
            func_02097258(p);
        }
        p->f28 = 0;
        p->f2c = 0;
        p->f30 = 0;
        p->f34 = 0;
        p->f38 = 0;
        p->f40 = 0;
        p->f3c = p->f40;
        p->f1c &= ~0xa2;
    }

    OS_RestoreIrq(token);
    return 1;
}
