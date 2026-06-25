/* CAMPAIGN-PREP candidate for func_02097700 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     head/tail separate externs; ok-flag hoist; dedup walk to tail
 *   risk:       permuter-class: already shipped as .s (proven no-C-match). r4-r8 allocation + the walk-loop reg rotation is the wall; a C reshape is unlikely to flip it. Escape to .s.
 *   confidence: low
 */
/* func_02097700 - IRQ-bracketed list append (dedup-walk to tail).
 * NOTE: this exact function is ALREADY SHIPPED as src/main/func_02097700.s
 * (brief 302 GLOBAL_ASM endgame: 'reg-alloc-walled, no C match'). The
 * C below is a best-effort reconstruction for the front-load attempt,
 * but it has already lost the C-match fight once. Class C recipe applied:
 * head/tail are separate externs; success flag hoisted as r8=ok. */

typedef struct Node {
    struct Node *f0;    /* +0x0 */
    struct Node *f4;    /* +0x4 */
    struct Node *f8;    /* +0x8 */
    char _pad0c[0x1c - 0x0c];
    unsigned int f1c;   /* +0x1c */
} Node;

typedef struct ListCtl {
    Node *tail;         /* +0x0 == data_021a830c */
    short h4;
    short h6;
    int   c8;
} ListCtl;

extern Node *data_021a8308;
extern ListCtl data_021a830c;
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern int  func_020977c0(void *a, void *b);
extern void *func_02097d60(void *a, void *b);

int func_02097700(Node *o, void *a, void *b) {
    int ok = 0;
    int saved = OS_DisableIrq();
    if (func_020977c0(a, b) == 0) {
        Node *p = data_021a8308;
        if (p == 0) {
            data_021a8308 = o;
            data_021a830c.tail = o;
            data_021a830c.c8 = 0;
            data_021a830c.h6 = 0;
            data_021a830c.h4 = 0;
        } else {
            Node *q = p->f4;
            if (q != 0) {
                while (q->f4 != 0) q = q->f4;
            }
            q->f4 = o;
            o->f8 = q;
        }
        o->f0 = func_02097d60(a, b);
        o->f1c |= 0x1;
        ok = 1;
    }
    OS_RestoreIrq(saved);
    return ok;
}
