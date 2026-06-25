/* CAMPAIGN-PREP candidate for func_020933bc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C store-order: next-fixup then prev-fixup; final clears active,+1c,+20 in that exact order
 *   risk:       the merged cond (beq .L_188 after str r0,[r1]) — mwcc must fold the `next==0` re-test into the head-store path; restructuring may emit a redundant cmp. reshape-able (nest the if as written).
 *   confidence: med
 */
// func_020933bc — IRQ-guarded doubly-linked-list unlink + tail-list fixup
// r5=node(param,held); r4=saved IRQ. fields: +0=active, +0x14=prev, +0x18=next, +0x1c/+0x20 cleared

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02093684(void *next);

typedef struct Node Node;
struct Node {
    int   active;   // 0x0
    char  pad4[0x10];
    Node *prev;     // 0x14
    Node *next;     // 0x18
    int   x1c;      // 0x1c
    int   x20;      // 0x20
};

// data_021a66d4: list head struct { Node *head; Node *tail; } (head@0, tail@4)
typedef struct { Node *head; Node *tail; } ListHead;
extern ListHead data_021a66d4;

void func_020933bc(Node *node) {
    int save;

    save = OS_DisableIrq();
    if (node->active == 0) {
        OS_RestoreIrq(save);
        return;
    }
    {
        Node *next = node->next;
        if (next == 0)
            data_021a66d4.tail = node->prev;
        else
            next->prev = node->prev;
        if (node->prev != 0)
            node->prev->next = next;
        else {
            data_021a66d4.head = next;
            if (next != 0)
                func_02093684(next);
        }
    }
    node->active = 0;
    node->x1c = 0;
    node->x20 = 0;
    OS_RestoreIrq(save);
}
