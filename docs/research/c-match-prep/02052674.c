/* CAMPAIGN-PREP candidate for func_02052674 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store-global + Fill call + offset halfword store (constant); sp3
 *   risk:       data_0219e3ec is ptr (str r0 then later ldr+deref); func_020945f4(_,0,0x614); +0x600+0x10 strh 0x5b9; sp3
 *   confidence: med
 */
/* func_02052674 -> src/main/func_02052674.legacy_sp3.c (mwcc 1.2/sp3: push{lr}+sub sp,#4+pop pc) */
typedef struct {
    char _pad[0x600 + 0x10];
    unsigned short f610;   /* +0x600+0x10 */
} Ctx;
extern Ctx *data_0219e3ec;
extern void func_020945f4(void *dst, int val, int n);

void func_02052674(Ctx *p) {
    data_0219e3ec = p;
    func_020945f4(p, 0, 0x614);
    *(unsigned short *)((char *)data_0219e3ec + 0x600 + 0x10) = 0x5b9;
}
