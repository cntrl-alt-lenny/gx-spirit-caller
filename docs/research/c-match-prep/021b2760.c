/* CAMPAIGN-PREP candidate for func_021b2760 (ov006, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     capture field, 7-sink step + enter, guarded state-set (store-order), return 1
 *   risk:       guard codegen (sel!=0 && sel==1 -> cmp#0;beq;cmp#1;bne) and per-branch reload of the state global must match; field held in r4 across calls
 *   confidence: med
 */
/* func_ov006_021b2760: per-state "step" with a mode guard. Capture the mode
 * word (data_0225c4dc+0x44), run the seven fixed per-subobject updates + the
 * per-state enter, then set the state word: mode==1 -> {state[3]=0; state[0]=5},
 * else state[0]=1. Returns 1. (Step family + 021b3ea0/021b4e38 shape.) */
extern void func_ov006_021cb0a0(void *);
extern void func_ov006_021cac30(void *);
extern void func_ov006_021c9ef4(void *);
extern void func_ov006_021c757c(void *);
extern void func_ov006_021c6990(void *);
extern void func_ov006_021c159c(void *);
extern void func_ov006_021ba090(void *);
extern int  func_ov006_021b2620(void);
extern char data_ov006_0225e138[], data_ov006_0225e100[], data_ov006_0225e068[],
            data_ov006_0225df3c[], data_ov006_0225de70[], data_ov006_0225cb5c[],
            data_ov006_0225c4dc[];
extern int  data_ov006_021cf140[];

int func_ov006_021b2760(void) {
    int mode = *(int *)(data_ov006_0225c4dc + 0x44);
    func_ov006_021cb0a0(data_ov006_0225e138);
    func_ov006_021cac30(data_ov006_0225e100);
    func_ov006_021c9ef4(data_ov006_0225e068);
    func_ov006_021c757c(data_ov006_0225df3c);
    func_ov006_021c6990(data_ov006_0225de70);
    func_ov006_021c159c(data_ov006_0225cb5c);
    func_ov006_021ba090(data_ov006_0225c4dc);
    func_ov006_021b2620();
    if (mode != 0 && mode == 1) {
        data_ov006_021cf140[3] = 0;
        data_ov006_021cf140[0] = 5;
    } else {
        data_ov006_021cf140[0] = 1;
    }
    return 1;
}
