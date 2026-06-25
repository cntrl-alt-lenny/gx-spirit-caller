/* CAMPAIGN-PREP candidate for func_021bbd54 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop + nested guard + addeq accumulator (021bc68c family)
 *   risk:       reg-alloc of arg0/arg2 into r7/r6 vs i/count r4/r5 may permute
 *   confidence: high
 */
/* func_ov002_021bbd54: count i in [0,10] where pred1(arg0,i,arg2)!=0 AND
 * pred2(arg0,i)==0. Two nested calls, single accumulator. */
extern int func_ov002_021ba104(int a, int b, int c);
extern int func_ov002_021bd710(int a, int b);

int func_ov002_021bbd54(int arg0, int arg2) {
    int i;
    int count = 0;
    for (i = 0; i <= 10; i++) {
        if (func_ov002_021ba104(arg0, i, arg2) != 0) {
            if (func_ov002_021bd710(arg0, i) == 0)
                count++;
        }
    }
    return count;
}
