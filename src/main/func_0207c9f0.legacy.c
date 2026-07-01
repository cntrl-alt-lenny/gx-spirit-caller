/* CAMPAIGN-PREP candidate for func_0207c9f0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     type guard + global store + reload + conditional/tail calls; sp2p3 tier
 *   risk:       mwcc may cache e->val instead of reloading after the global store; data_021a0894 passed as array-decay address
 *   confidence: med
 */
/* func_0207c9f0: event handler. If e->type==0x12: store e->val (u16) to
 * data_021a0890+0x24, and if e->val==0 call func_0207afbc; then always
 * call func_02091a0c(data_021a0894). Style A epilogue with sub-sp, push
 * {lr} -> `.legacy.c` (mwcc 1.2/sp2p3). e->val is RELOADED after the
 * store (asm ldrh twice) -> referenced as two distinct member reads. */

typedef struct {
    unsigned short type;          /* +0x0 */
    unsigned short val;          /* +0x2 */
} evt_c9f0_t;

typedef struct {
    char _pad[0x24];
    int  f24;                    /* +0x24 */
} data_021a0890_t;

extern data_021a0890_t data_021a0890;
extern char data_021a0894[];
extern void func_0207afbc(void);
extern void func_02091a0c(void *p);

void func_0207c9f0(evt_c9f0_t *e) {
    if (e->type != 0x12) return;
    data_021a0890.f24 = e->val;
    if (e->val == 0) {
        func_0207afbc();
    }
    func_02091a0c(data_021a0894);
}
