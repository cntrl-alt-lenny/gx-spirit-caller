/* CAMPAIGN-PREP candidate for func_02091fd4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     unsigned key (bcc); declare cur first; head=read then cur=head
 *   risk:       VERIFIED 100% as *.legacy.c (1.2/sp2p3). Reshape-able: decl-order is load-bearing - cur MUST be declared before prev/head (cur-last = 57%); plus route .legacy.c.
 *   confidence: high
 */
extern char data_021a62f0[];
typedef struct Node { char _pad00[0x68]; struct Node *next; char _pad6c[0x70-0x6c]; unsigned int key; } Node;
void func_02091fd4(Node *node){
    Node *cur;
    Node *prev = 0;
    Node *head = *(Node **)(data_021a62f0 + 0x8);
    cur = head;
    while (cur != 0 && cur->key < node->key) { prev = cur; cur = cur->next; }
    if (prev == 0) { node->next = head; *(Node **)(data_021a62f0 + 0x8) = node; }
    else { node->next = prev->next; prev->next = node; }
}
