/* CAMPAIGN-PREP candidate for func_020a6444 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     once-guard init sequence + do-while wait + many calls
 *   risk:       long body: call/store ordering, global reload-vs-bind, and func_02096434 arg shaping may diverge
 *   confidence: low
 */
/* func_020a6444: one-shot init. Guard on data_021a9944; run a linear init
 * sequence with one wait loop. sp2p3 (.legacy.c).
 *
 *   if (data_021a9944 != 0) return;
 *   data_021a9944 = 1;
 *   func_020a60fc();
 *   data_021a9948 = 0;
 *   func_02096228();
 *   do { ; } while (func_0209640c(0xd, 1) == 0);
 *   func_02096434(0xd, (int)func_020a61f0);
 *   func_020a622c();
 *   func_02096434(0xd, 0);
 *   func_02096434(0xd, (int)func_020a6170);
 *   data_021a994c = 0;
 *   func_020a6614(&data_021a9a20);
 *   func_02096434(0x11, (int)func_020a613c);
 *   func_020a5db0(0);
 */

extern void func_020a60fc(void);
extern void func_02096228(void);
extern int  func_0209640c(int a, int b);
extern void func_02096434(int slot, int value);
extern void func_020a622c(void);
extern void func_020a6614(void *p);
extern void func_020a5db0(int arg);
extern void func_020a61f0(int a, int b);
extern void func_020a6170(void);
extern void func_020a613c(void);

extern int  data_021a9944;
extern int  data_021a9948;
extern int  data_021a994c;
extern char data_021a9a20;

void func_020a6444(void) {
    if (data_021a9944 != 0) return;
    data_021a9944 = 1;
    func_020a60fc();
    data_021a9948 = 0;
    func_02096228();
    while (func_0209640c(0xd, 1) == 0)
        ;
    func_02096434(0xd, (int)func_020a61f0);
    func_020a622c();
    func_02096434(0xd, 0);
    func_02096434(0xd, (int)func_020a6170);
    data_021a994c = 0;
    func_020a6614(&data_021a9a20);
    func_02096434(0x11, (int)func_020a613c);
    func_020a5db0(0);
}
