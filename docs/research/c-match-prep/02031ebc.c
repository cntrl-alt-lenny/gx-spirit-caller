/* CAMPAIGN-PREP candidate for func_02031ebc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order; t=node->next/prev bound once each; adds r5,#0xc => &head->headc null-test
 *   risk:       reshape-able: the `adds r0,r5,#0xc; beq` is a guard on (&head->headc != NULL); mwcc may fold the always-true test away. If diverges, drop the inner null-check or keep address-compare explicit.
 *   confidence: low
 */
typedef struct LNode {
    /* 0x00 */ struct LNode *next;
    /* 0x04 */ struct LNode *prev;
    /* 0x08 */ char _pad08[0x8];
    /* 0x10 */ unsigned int flags;
    /* 0x14 */ char _pad14[8];
    /* 0x1c */ int arg1c;
} LNode;

typedef struct LHead {
    /* 0x00 */ char _pad00[0x8];
    /* 0x08 */ struct LNode *head8;
    /* 0x0c */ struct LNode *headc;
} LHead;

extern void func_02032014(LHead *head, void *p);

void func_02031ebc(LHead *head, LNode *node)
{
    LNode *t;

    t = node->next;
    if (t != 0) {
        t->prev = node->prev;
    } else {
        if (head->head8 == node)
            head->head8 = node->prev;
    }
    t = node->prev;
    if (t != 0) {
        t->next = node->next;
    } else {
        if ((LNode **)&head->headc != 0) {
            if (head->headc == node)
                head->headc = node->next;
        }
    }
    if (!(node->flags & 0x1)) {
        func_02032014(head, (void *)node->arg1c);
    }
    func_02032014(head, node);
}
