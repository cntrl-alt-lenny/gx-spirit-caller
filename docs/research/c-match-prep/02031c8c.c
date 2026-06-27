/* CAMPAIGN-PREP candidate for func_02031c8c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order kept; bind prev/next per-branch; reload [r0+0x20]/[r0+0x1c] to match ldr-each-use
 *   risk:       reshape-able: in the else branch orig RELOADS [r0+0x1c] then [r0+0x20] (ldr,ldr) before strne; if mwcc CSEs prev/next the two reloads collapse. Tweak: re-read node->prev/node->next inside the if.
 *   confidence: low
 */
typedef struct Node {
    /* 0x00 */ char _pad00[0x18];
    /* 0x18 */ struct Node *field18;
    /* 0x1c */ struct Node *prev;
    /* 0x20 */ struct Node *next;
    /* 0x24 */ char _pad24[8];
    /* 0x2c */ unsigned int flags;
} Node;

void func_02031c8c(Node *node)
{
    unsigned int flags;
    Node *next;
    Node *prev;

    flags = node->flags;
    if (!(flags & 0x4))
        return;
    flags &= ~0x4u;
    node->flags = flags;
    if (flags & 0x2) {
        next = node->next;
        prev = node->prev;
        prev->field18 = next;
        if (next != 0) {
            node->next->prev = prev;
            node->next->flags |= 0x2;
        } else {
            prev->flags &= ~0x1u;
        }
    } else {
        next = node->next;
        prev = node->prev;
        prev->next = next;
        prev = node->prev;
        next = prev->next;
        if (next != 0)
            node->next->prev = prev;
    }
}
