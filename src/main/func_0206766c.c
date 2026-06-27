/* CAMPAIGN-PREP candidate for func_0206766c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-default-to-global + single setter
 *   risk:       field offset 0xa0 guessed; trivial otherwise
 *   confidence: high
 */
/* func_0206766c — null-default + single store at +0xa0. */
typedef struct Mgr Mgr;
struct Mgr {
    char _pad_00[0xa0];
    int  field_a0;
};

extern Mgr *data_021015e0;

void func_0206766c(Mgr *m, int v) {
    if (m == 0) m = data_021015e0;
    m->field_a0 = v;
}
