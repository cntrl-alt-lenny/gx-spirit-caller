/* CAMPAIGN-PREP candidate for func_02067354 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-default-to-global; guard-chain calls; sentinel-compare tail call
 *   risk:       field_c4 reloaded twice (asm does); && short-circuit block order or the bl/ldmia tail-call merge may flip
 *   confidence: med
 */
/* func_02067354 — teardown / guard-chain of calls.
 * movs r4,r0 + ldreq r4,[&data_021015e0] = null-default-to-singleton.
 * data_021015e0 holds a POINTER to the manager struct (loaded then
 * dereferenced); data_021015e4 IS the static fallback instance (its
 * address is compared against the resolved pointer as a sentinel).
 */
typedef struct Mgr Mgr;
struct Mgr {
    int  field_00;     /* +0x00  state id (compared to -1) */
    char _pad_04[0xa4 - 0x04];
    int  field_a4;
    int  field_a8;
    int  field_ac;     /* +0xac  cleared */
    char _pad_b0[0xb4 - 0xb0];
    int  field_b4;
    char _pad_b8[0xbc - 0xb8];
    int  field_bc;     /* +0xbc  guard */
    char _pad_c0[0xc4 - 0xc0];
    int  field_c4;     /* +0xc4  guard */
};

extern Mgr *data_021015e0;
extern Mgr  data_021015e4;

extern void func_02066010(Mgr *m, int mode);
extern void func_02054e70(void);
extern void func_0205531c(void);
extern void func_020453b4(Mgr *m);

void func_02067354(Mgr *m) {
    if (m == 0) m = data_021015e0;

    if (m->field_bc != 0) {
        func_02066010(m, 2);
    }
    if (m->field_00 != -1 && m->field_c4 != 0) {
        func_02054e70();
    }
    m->field_00 = -1;
    m->field_ac = 0;
    if (m->field_c4 != 0) {
        func_0205531c();
    }
    if (m != &data_021015e4) {
        func_020453b4(m);
    }
}
