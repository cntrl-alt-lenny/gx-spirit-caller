/* CAMPAIGN-PREP candidate for func_0200fd1c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: load fc once, derive bit via <<29>>31, two guarded eq-returns
 *   risk:       orig loads fc into r3, derives bit into ip via movs, reuses BOTH r3(>>12) and ip(flag) downstream; if mwcc reloads fc for the >>12 path instead of keeping r3, an extra ldr diverges. reshape-able via single fc local
 *   confidence: med
 */
/* func_0200fd1c (main, class C/D) — single list walk @data_0218dbc8+0x910.
 * node guard bit2 = (node->fc<<0x1d)>>0x1f. If clear: match node->f8==arg[0];
 * else if bit set: match arg[2]==(node->fc>>12u). next@0, f8@8, fc@0xc. */

typedef struct Node {
    struct Node *next;  /* 0x0 */
    int          pad4;  /* 0x4 */
    int          f8;    /* 0x8 */
    unsigned int fc;    /* 0xc */
} Node;

extern char data_0218dbc8;

Node *func_0200fd1c(int *arg)
{
    Node *n = *(Node **)(&data_0218dbc8 + 0x910);
    if (n != 0) {
        do {
            unsigned int fc = n->fc;
            unsigned int bit = (fc << 0x1d) >> 0x1f;
            if (bit == 0) {
                if (n->f8 == arg[0]) return n;
            } else {
                if ((unsigned int)arg[2] == (fc >> 12)) return n;
            }
            n = n->next;
        } while (n != 0);
    }
    return 0;
}
