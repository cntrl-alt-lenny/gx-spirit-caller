/* CAMPAIGN-PREP candidate for func_021b38fc (ov006, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     capture field, 7-sink step + enter, guard (mode==3), dual state-set
 *   risk:       guard (mode!=0 && mode==3) must yield cmp#0;beq;cmp#3;bne; both branches store state[3] then state[0]; else reuses const 1 for both stores
 *   confidence: med
 */
/* func_ov006_021b38fc: per-state "step" with a mode guard. Capture the mode
 * word (data_0225c4dc+0x44), run the seven per-subobject updates + the enter,
 * then set the state word: mode==3 -> {state[3]=0; state[0]=1}, else
 * {state[3]=1; state[0]=1}. Returns 1. Sibling of 021b2760/021b3318. */
extern void func_ov006_021cb0a0(void *);
extern void func_ov006_021cac30(void *);
extern void func_ov006_021c9ef4(void *);
extern void func_ov006_021c757c(void *);
extern void func_ov006_021c6990(void *);
extern void func_ov006_021c159c(void *);
extern void func_ov006_021ba090(void *);
extern int  func_ov006_021b37bc(void);
extern char data_ov006_0225e138[], data_ov006_0225e100[], data_ov006_0225e068[],
            data_ov006_0225df3c[], data_ov006_0225de70[], data_ov006_0225cb5c[],
            data_ov006_0225c4dc[];
extern int  data_ov006_0224f1fc[];

int func_ov006_021b38fc(void) {
    int mode = *(int *)(data_ov006_0225c4dc + 0x44);
    func_ov006_021cb0a0(data_ov006_0225e138);
    func_ov006_021cac30(data_ov006_0225e100);
    func_ov006_021c9ef4(data_ov006_0225e068);
    func_ov006_021c757c(data_ov006_0225df3c);
    func_ov006_021c6990(data_ov006_0225de70);
    func_ov006_021c159c(data_ov006_0225cb5c);
    func_ov006_021ba090(data_ov006_0225c4dc);
    func_ov006_021b37bc();
    if (mode != 0 && mode == 3) {
        data_ov006_0224f1fc[3] = 0;
        data_ov006_0224f1fc[0] = 1;
    } else {
        data_ov006_0224f1fc[3] = 1;
        data_ov006_0224f1fc[0] = 1;
    }
    return 1;
}
