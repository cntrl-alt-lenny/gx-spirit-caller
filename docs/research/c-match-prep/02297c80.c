/* CAMPAIGN-PREP candidate for func_02297c80 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two scan loops (4,5) + mid arg1 guard, bool
 *   risk:       Two SR walkers + the if(arg1)return 0 between loops; mwcc SR/counter shape per loop may differ
 *   confidence: med
 */
/* func_ov002_02297c80: scan 4 records; if arg1!=0 stop with 0; else scan
 * 5 more; return 1 on any callback hit, else 0. */
struct Rec02297c80 {
    unsigned int a;
    void *b;
};

extern const struct Rec02297c80 data_ov002_022c8ff0[];
extern const struct Rec02297c80 data_ov002_022c9010[];
extern int func_ov002_02297158(void *thing, const struct Rec02297c80 *rec);

int func_ov002_02297c80(void *thing, int arg1) {
    int i;
    for (i = 0; i < 4; i++) {
        if (func_ov002_02297158(thing, &data_ov002_022c8ff0[i]))
            return 1;
    }
    if (arg1)
        return 0;
    for (i = 0; i < 5; i++) {
        if (func_ov002_02297158(thing, &data_ov002_022c9010[i]))
            return 1;
    }
    return 0;
}
