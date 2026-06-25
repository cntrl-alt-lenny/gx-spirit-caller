/* CAMPAIGN-PREP candidate for func_0200fa90 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: unsigned >>12 key, hold key in ip across walk, cmp-order for bcc
 *   risk:       r1(pos) is seeded from arg1 (&head) yet treated as Node* at .L_d08 (cmp r0,r1 / str r1,[r0,4]); the &head-vs-Node aliasing may make mwcc spill differently. permuter-class
 *   confidence: low
 */
/* func_0200fa90 (main, class C) — sorted singly-linked insert by (node->f0c>>12u).
 * arg0=new node, arg1=&head. Walk while cur && key(arg0)>=key(cur); splice;
 * fix predecessor's prev (@+0x4). Returns head or 0. next@0, prev@4, sortkey@0xc>>12. */

typedef struct Node {
    struct Node *next;  /* 0x0 */
    struct Node *prev;  /* 0x4 */
    int          pad8;  /* 0x8 */
    unsigned int fc;    /* 0xc */
} Node;

Node *func_0200fa90(Node *node, Node **phead)
{
    Node *cur = *phead;
    Node *pos = (Node *)phead;  /* r1 starts as &head; updated to last cur */
    if (cur != 0) {
        unsigned int key = node->fc >> 12;
        do {
            if (key < (cur->fc >> 12)) break;
            pos = cur;
            cur = cur->next;
        } while (cur != 0);
    }
    if (pos == 0) return 0;
    if (node != pos) {
        node->prev = pos;
        node->next = pos->next;
        pos->next  = node;
    }
    {
        Node *nx = node->next;
        if (nx != 0) nx->prev = node;
    }
    return node;
}
