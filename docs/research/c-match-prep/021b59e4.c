/* CAMPAIGN-PREP candidate for func_021b59e4 (ov006, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two init calls then constant field stores in store-order, base held in r4
 *   risk:       data_0224f398 base loaded early and held in r4 across both calls (scheduling); stores must be [0]=2,[1]=0x18 then other[0]=4 in order
 *   confidence: med
 */
/* func_ov006_021b59e4: short init. Kick the per-state init (arg 1) and one
 * per-subobject update, then write two fields of data_0224f398 (=2, =0x18) and
 * one field of data_0224f38c (=4). Returns 1. */
extern void func_ov006_021b5704(int);
extern void func_ov006_021c9ed4(void *);
extern char data_ov006_0225e068[];
extern int  data_ov006_0224f398[];
extern int  data_ov006_0224f38c[];

int func_ov006_021b59e4(void) {
    func_ov006_021b5704(1);
    func_ov006_021c9ed4(data_ov006_0225e068);
    data_ov006_0224f398[0] = 2;
    data_ov006_0224f398[1] = 0x18;
    data_ov006_0224f38c[0] = 4;
    return 1;
}
