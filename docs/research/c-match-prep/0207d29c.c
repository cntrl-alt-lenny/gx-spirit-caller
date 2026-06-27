/* CAMPAIGN-PREP candidate for func_0207d29c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl r5(key) before r6(root) before r4(c); unsigned bounds compare; first func_0207cfdc(node,0) then recurse then iterate
 *   risk:       Struct-guessed: [0x18]/[0x1c] bounds offsets inferred. Also bhi/bcs ordering — if(lo<=k && k<hi) must emit cmp lo,k;bhi then cmp k,hi;bcs in that exact order, else branch labels reorder: reshape-able via compare-order.
 *   confidence: med
 */
extern char *func_0207cfdc(char *root, char *node);
extern char *func_0207d29c(char *node, int key);

struct N_207d29c {
    char _pad[0x18];
    unsigned int lo;   /* +0x18 */
    unsigned int hi;   /* +0x1c */
};

char *func_0207d29c(char *node, int key)
{
    int k;
    char *root;
    char *c;
    struct N_207d29c *n;

    k = key;
    root = node;
    c = func_0207cfdc(node, (char *)0);
    while (c != 0) {
        n = (struct N_207d29c *)c;
        if (n->lo <= (unsigned int)k && (unsigned int)k < n->hi) {
            char *r = func_0207d29c(c + 0xc, k);
            if (r == 0)
                r = c;
            return r;
        }
        c = func_0207cfdc(root, c);
    }
    return (char *)0;
}
