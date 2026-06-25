/* CAMPAIGN-PREP candidate for func_021b53d4 (ov006, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     capture two fields (+0x44,+0x48) held across calls, 2 sinks+enter, guard, state-set
 *   risk:       two callee-saved field reads (r4,r5) must precede calls; called sinks need a ptr-arg prototype to force r0 loads; state[4]=handle then state[0]=5
 *   confidence: med
 */
/* func_ov006_021b53d4: per-state "enter" with a mode guard. Capture the mode
 * (+0x44) and a handle (+0x48) from data_0225dc34, run two setup sinks + the
 * enter, then set the state word: mode==1 -> {state[4]=handle; state[0]=5},
 * else state[0]=1. Returns 1. The sinks take a ptr arg (caller loads r0). */
extern void func_ov006_021c6c2c(void *);
extern void func_ov006_021c50c4(void *);
extern int  func_ov006_021b52d0(void);
extern char data_ov006_0225dc34[];
extern char data_ov006_0225deb4[];
extern int  data_ov006_0224f330[];

int func_ov006_021b53d4(void) {
    int mode   = *(int *)(data_ov006_0225dc34 + 0x44);
    int handle = *(int *)(data_ov006_0225dc34 + 0x48);
    func_ov006_021c6c2c(data_ov006_0225deb4);
    func_ov006_021c50c4(data_ov006_0225dc34);
    func_ov006_021b52d0();
    if (mode != 0 && mode == 1) {
        data_ov006_0224f330[4] = handle;
        data_ov006_0224f330[0] = 5;
    } else {
        data_ov006_0224f330[0] = 1;
    }
    return 1;
}
