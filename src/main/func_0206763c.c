/* CAMPAIGN-PREP candidate for func_0206763c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-default-to-global + single setter
 *   risk:       field offset 0xa8 from struct; trivial otherwise
 *   confidence: high
 */
/* func_0206763c — null-default + single store at +0xa8.
 * cmp r0,#0; ldreq r0,[&data_021015e0]; str r1,[r0,#0xa8]; bx lr.
 * data_021015e0 holds the manager pointer.
 */
typedef struct Mgr Mgr;
struct Mgr {
    char _pad_00[0xa8];
    int  field_a8;
};

extern Mgr *data_021015e0;

void func_0206763c(Mgr *m, int v) {
    if (m == 0) m = data_021015e0;
    m->field_a8 = v;
}
