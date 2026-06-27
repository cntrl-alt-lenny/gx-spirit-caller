/* CAMPAIGN-PREP candidate for func_020675e0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-default-to-global + single setter
 *   risk:       field offset 0xa4 guessed; trivial otherwise
 *   confidence: high
 */
/* func_020675e0 — null-default + single store at +0xa4. */
typedef struct Mgr Mgr;
struct Mgr {
    char _pad_00[0xa4];
    int  field_a4;
};

extern Mgr *data_02101500;

void func_020675e0(Mgr *m, int v) {
    if (m == 0) m = data_02101500;
    m->field_a4 = v;
}
