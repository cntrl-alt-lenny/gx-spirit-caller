/* CAMPAIGN-PREP candidate for func_0200fb18 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: base+0x1000 hoisted; signed (fc<<29)>>31 guard; bucket i*4 inline
 *   risk:       guard mov;lsl#0x1d;lsrs#0x1f sets flags via movs and predicates the key cmp (ldreq/cmpeq/moveq); if mwcc materialises the bit to a reg + branch instead of the eq-predicate chain, the whole compare block diverges. reshape-able via bitfield
 *   confidence: med
 */
/* func_0200fb18 (main, class C/D) — keyed lookup, type-5 single list vs bucket array.
 * base = data_0218cbc8 + 0x1000. arg0: type byte (signed) @0.
 *  type==5: walk list @+0x90c; else iterate [+0x914] buckets @+0x900+i*4.
 * node guard: (node->fc<<0x1d)>>0x1f == 0 (bit2 clear), then key(node->f8)==arg->f8. */

typedef struct Node {
    struct Node *next;  /* 0x0 */
    int          pad4;  /* 0x4 */
    int          key;   /* 0x8 */
    unsigned int fc;    /* 0xc : bitfield, bit2 tested */
} Node;

extern char data_0218cbc8;

Node *func_0200fb18(char *arg)
{
    char *base = &data_0218cbc8 + 0x1000;
    if (*(signed char *)arg == 5) {
        Node *n = *(Node **)(base + 0x90c);
        if (n != 0) {
            do {
                if (((n->fc << 0x1d) >> 0x1f) == 0) {
                    if (n->key == *(int *)(arg + 8)) return n;
                }
                n = n->next;
            } while (n != 0);
        }
        return 0;
    } else {
        unsigned int cnt = *(unsigned int *)(base + 0x914);
        unsigned int i = 0;
        if (cnt == 0) return 0;
        do {
            Node *n = *(Node **)(base + i * 4 + 0x900);
            if (n != 0) {
                do {
                    if (((n->fc << 0x1d) >> 0x1f) == 0) {
                        if (n->key == *(int *)(arg + 8)) return n;
                    }
                    n = n->next;
                } while (n != 0);
            }
            i++;
        } while (i < cnt);
        return 0;
    }
}
