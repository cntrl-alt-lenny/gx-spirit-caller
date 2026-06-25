/* CAMPAIGN-PREP candidate for func_0200fbd4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two linked-list searches (single bucket vs bucket-array) by key@8
 *   risk:       data_0218cbc8+0x1000 base; offsets 0x90c/0x914/0x900 from that base; node next@0,key@8; loop-counter/ldrsb shape may differ
 *   confidence: med
 */
/* func_0200fbd4: keyed lookup. If the arg's type byte (signed) == 5,
 * walk the single list @+0x190c; otherwise walk each of [+0x1914]
 * buckets @+0x1900+i*4, matching node->key (@8) against arg->key (@8
 * for type 5, arg[8] for the bucket path). Returns the node or 0. */

typedef struct Node { struct Node *next; int pad; int key; } Node;
extern char data_0218cbc8;

Node *func_0200fbd4(char *arg) {
    char *base = &data_0218cbc8 + 0x1000;
    if (*(signed char *)arg == 5) {
        Node *n = *(Node **)(base + 0x90c);
        if (n != 0) {
            int k = *(int *)(arg + 8);
            do {
                if (n->key == k) return n;
                n = n->next;
            } while (n != 0);
        }
        return 0;
    } else {
        unsigned int count = *(unsigned int *)(base + 0x914);
        unsigned int i = 0;
        if (count == 0) return 0;
        do {
            Node *n = *(Node **)(base + i * 4 + 0x900);
            if (n != 0) {
                int k = *(int *)(arg + 8);
                do {
                    if (n->key == k) return n;
                    n = n->next;
                } while (n != 0);
            }
            i++;
        } while (i < count);
        return 0;
    }
}
