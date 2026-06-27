/* CAMPAIGN-PREP candidate for func_021c31d4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     max as if-assign (movgt/movle); decl ca/cb r6/r7; subs n; downward loop
 *   risk:       orig forms a/b pointers as (row+0x18+0x400) and (row+0x260) before adding n<<2; if mwcc folds 0x18+0x400 differently or recomputes base inside loop the add chain diverges. reshape-able (operand order / single base).
 *   confidence: med
 */
/* func_ov002_021c31d4: swap player (arg0&1)'s two parallel arrays B(row+0x260)
 * and A(row+0x418), element-wise over max(cf17c[idx],cf180[idx]) entries,
 * iterating i=max-1..0 (downward), via func_021b91d0(&B[i],&A[i]); then SWAP
 * the two counts (cf17c<-old cf180, cf180<-old cf17c). max via if-assign. */
extern char data_ov002_022cf16c[];
extern int  data_ov002_022cf17c[];
extern int  data_ov002_022cf180[];
extern void func_ov002_021b91d0(int *b, int *a);

void func_ov002_021c31d4(int player) {
    int idx = (player & 1) * 0x868;
    int ca = *(int *)((char *)data_ov002_022cf17c + idx);
    int cb = *(int *)((char *)data_ov002_022cf180 + idx);
    int n;
    if (ca > cb) n = ca; else n = cb;
    n = n - 1;
    if (n >= 0) {
        char *row = (char *)data_ov002_022cf16c + idx;
        int *a = (int *)(row + 0x418);
        int *b = (int *)(row + 0x260);
        for (; n >= 0; n--)
            func_ov002_021b91d0(&b[n], &a[n]);
    }
    *(int *)((char *)data_ov002_022cf17c + idx) = cb;
    *(int *)((char *)data_ov002_022cf180 + idx) = ca;
}
