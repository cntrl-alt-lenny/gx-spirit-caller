/* CAMPAIGN-PREP candidate for func_02092074 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     list unlink walk with prev; head-vs-mid conditional store
 *   risk:       offsets 0x8/0x68 guessed; head-case must compile to streq/strne not a branch
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02092074 (main, class A) - p_0035.
 * UNVERIFIED build-free draft: drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     linked-list unlink walk (prev tracking) + head-vs-mid conditional store
 *   risk:       field offsets 0x8/0x68 guessed; prev==0 head-case must lower to streq/strne, not a branch
 *   confidence: med
 */
/* func_02092074: unlink node r0 from list rooted at data_021a63d0->+0x8,
 * linked via +0x68. Walk keeping prev; if found-node is head (prev==0) set
 * head = node->next, else prev->next = node->next. Note the search loop
 * stops at NULL or at the target; the unlink uses node (r0)'s own next.
 */
extern char data_021a63d0[];

typedef struct Node {
    char         _pad00[0x68];
    struct Node *next;   /* +0x68 */
} Node;

void func_02092074(Node *target)
{
    Node *prev = 0;
    Node *n = *(Node **)(data_021a63d0 + 0x8);
    while (n != 0 && n != target) {
        prev = n;
        n = n->next;
    }
    if (prev == 0)
        *(Node **)(data_021a63d0 + 0x8) = target->next;
    else
        prev->next = target->next;
}
