/* CAMPAIGN-PREP candidate for func_0227aee0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     2-D (player*0x868 + idx*20) u16 cell guard, set-call-clear
 *   risk:       mla/mul split or reload-vs-bind of the cell address across the call may differ; r4/r5/r6 colouring
 *   confidence: med
 */
/* func_ov002_0227aee0: 2-D table at data_022cf1a4: byte off (arg0&1)*0x868 +
 * arg1*20, a u16 cell. If cell==0: set it to 1, call func_021c4c9c, clear it.
 * Else just call func_021c4c9c. (arg0 in r0, arg1 in r1.)
 *
 *   and r6,r0,#1; mul r4,r1,#0x14; mla r5,r6,#0x868,data ; ldrh [r5,r4]
 *   cmp#0; bne .L; mov#1; strh; bl 021c4c9c; mov#0; strh; pop
 *   .L: bl 021c4c9c; pop
 */
typedef unsigned short u16;
extern char data_ov002_022cf1a4[];
extern void func_ov002_021c4c9c(void);

void func_ov002_0227aee0(int arg0, int arg1) {
    u16 *cell = (u16 *)((char *)data_ov002_022cf1a4 + (arg0 & 1) * 0x868 + arg1 * 20);
    if (*cell == 0) {
        *cell = 1;
        func_ov002_021c4c9c();
        *cell = 0;
        return;
    }
    func_ov002_021c4c9c();
}
