/* CAMPAIGN-PREP candidate for func_02067c58 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     first flag op via cached n; subsequent two via p->head reload; unsigned <= guard; for-reload head
 *   risk:       orig caches node in r3 for the first orr(|=0x10) but RELOADS p->head for the str(+0x1c) and the and(&0xd3); if mwcc keeps n live for all three the two reload ldr disappear. reshape-able (explicit p->head-> forces reload) / struct-guessed on field offsets 0x15/0x1c/0x44/0x48.
 *   confidence: med
 */
/* func_02067c58 - main - class C
 * list walk + flag RMW, reloaded head p->field_8, indirect callback
 * _LIT0 = 0x9c4; node->field_15 flag byte; field_1c u32; field_44 fnptr, field_48 arg
 */
typedef struct Node {
    unsigned char _a[0x15];
    unsigned char flags;       /* +0x15 */
    unsigned char _b[6];
    unsigned int  field_1c;    /* +0x1c */
} Node;
typedef struct P {
    unsigned char _a[8];
    Node *head;                /* +0x8 */
    unsigned char _b[0x38];
    void (*cb)(struct P *, int, Node *, int); /* +0x44 */
    int field_48;              /* +0x48 */
} P;

extern unsigned int func_02055330(void);
extern void func_020683ec(Node **headp);

void func_02067c58(P *p)
{
    unsigned int thresh;
    Node *n;

    thresh = func_02055330();
    for (n = p->head; n != 0; n = p->head) {
        if (thresh <= n->field_1c + 0x9c4)
            return;
        n->flags |= 0x10;
        p->head->field_1c = 0x9c4;
        p->head->flags &= 0xd3;
        p->cb(p, 1, p->head, p->field_48);
        func_020683ec(&p->head);
    }
}
