/* CAMPAIGN-PREP candidate for func_02297d08 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     filter-then-callback scan loop; fixed base + walker + const-0 arg
 *   risk:       asm keeps TWO bases (fixed r5 for table[i].a load, walking r7 for &table[i]); mwcc may unify them into one pointer
 *   confidence: low
 */
/* func_ov002_02297d08: for each of 276 (0x114) records whose .a passes the
 * func_0202e234 filter, call func_0228bcd0(thing, &table[i], 0); return 1
 * on first hit. Orig keeps a fixed base for the indexed .a load AND a
 * separate +8 walker for &table[i]; the 3rd arg is a constant 0. */
struct Rec02297d08 {
    unsigned int a;
    void *b;
};

extern const struct Rec02297d08 data_ov002_022c9ad0[];
extern int func_0202e234(unsigned int x);
extern int func_ov002_0228bcd0(void *thing, const struct Rec02297d08 *rec, int z);

int func_ov002_02297d08(void *thing) {
    int i;
    for (i = 0; i < 0x114; i++) {
        if (func_0202e234(data_ov002_022c9ad0[i].a)) {
            if (func_ov002_0228bcd0(thing, &data_ov002_022c9ad0[i], 0))
                return 1;
        }
    }
    return 0;
}
