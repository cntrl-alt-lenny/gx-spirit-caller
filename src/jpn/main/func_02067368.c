/* CAMPAIGN-PREP candidate for func_02067368 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-default; guard; unsigned-compare(cmp/movcc) conditional store; tail call
 *   risk:       unsigned compare must stay cc not lt; reg holding (r0-field_ac) result may flip; field_b4 store-vs-return order
 *   confidence: med
 */
/* func_02067368 — guarded subtract + conditional store.
 * null-default singleton; guard on +0xbc; bl returns a tick value in
 * r0; sub r0,r0,[+0xac]; cmp against 0x2710; movcc/strcc sets +0xb4=1
 * and early-returns, else calls func_02065f9c(m,1) and clears +0xb4.
 */
typedef struct Mgr Mgr;
struct Mgr {
    char _pad_00[0xac];
    int  field_ac;     /* +0xac  baseline */
    char _pad_b0[0xb4 - 0xb0];
    int  field_b4;     /* +0xb4  flag */
    char _pad_b8[0xbc - 0xb8];
    int  field_bc;     /* +0xbc  guard */
};

extern Mgr *data_02101500;
extern int  func_020552bc(void);
extern void func_02065f9c(Mgr *m, int mode);

void func_02067368(Mgr *m) {
    unsigned int elapsed;

    if (m == 0) m = data_02101500;
    if (m->field_bc == 0) return;

    elapsed = (unsigned int)(func_020552bc() - m->field_ac);
    if (elapsed < 0x2710) {
        m->field_b4 = 1;
        return;
    }
    func_02065f9c(m, 1);
    m->field_b4 = 0;
}
