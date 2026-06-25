/* CAMPAIGN-PREP candidate for func_02297c3c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     single scan loop over 8-byte-record table, bool
 *   risk:       Relies on mwcc strength-reducing &table[i] to a +8 walker while keeping i as the 0xB9 bound; SR shape may differ
 *   confidence: med
 */
/* func_ov002_02297c3c: scan 185 (0xB9) 8-byte records; return 1 on first
 * callback hit. mwcc SRs &table[i] to a +8 walker, keeps i for the bound. */
struct Rec02297c3c {
    unsigned int a;
    void *b;
};

extern const struct Rec02297c3c data_ov002_022c9508[];
extern int func_ov002_02297158(void *thing, const struct Rec02297c3c *rec);

int func_ov002_02297c3c(void *thing) {
    int i;
    for (i = 0; i < 0xb9; i++) {
        if (func_ov002_02297158(thing, &data_ov002_022c9508[i]))
            return 1;
    }
    return 0;
}
