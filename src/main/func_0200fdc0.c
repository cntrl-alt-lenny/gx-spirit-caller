/* CAMPAIGN-PREP candidate for func_0200fdc0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     single list search; compare arg[8]==(node->fc>>12u); leaf
 *   risk:       unsigned lsr#0xc -> must stay unsigned shift; node field @0xc, next@0; head@+0x910
 *   confidence: high
 */
/* func_0200fdc0: walk the list @data_0218dbc8+0x910, matching the
 * arg's word @8 against node->field(@0xc) >> 12 (unsigned). */

typedef struct Node { struct Node *next; int pad; unsigned int packed; } Node;
extern char data_0218dbc8;

Node *func_0200fdc0(int *arg) {
    Node *n = *(Node **)(&data_0218dbc8 + 0x910);
    if (n != 0) {
        unsigned int k = (unsigned int)arg[2];
        do {
            if (k == (n->packed >> 12)) return n;
            n = n->next;
        } while (n != 0);
    }
    return 0;
}
