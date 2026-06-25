/* CAMPAIGN-PREP candidate for func_0225a51c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two-store init + global guard + 021d479c u16 pack
 *   risk:       021d479c pack proven elsewhere; mild risk on the ip-temp reuse for the (arg0?0x8000:0) select and the (u16)arg1 truncation scheduling
 *   confidence: med
 */
/* func_ov002_0225a51c: set +0xD2C=1, +0xD30=0, then (only if the
 * data_ov002_022cd3f4.f18 gate is live) emit a 021d479c command kind 0x1B with
 * the 0x8000 set-bit from arg0 and arg1 as the low-half payload. */

extern char data_ov002_022d016c[];
extern char data_ov002_022cd3f4[];
extern int func_ov002_021d479c(int a, int b, int c, int d);

void func_ov002_0225a51c(int arg0, int arg1) {
    *(int *)(data_ov002_022d016c + 0xD2C) = 1;
    *(int *)(data_ov002_022d016c + 0xD30) = 0;
    if (*(int *)(data_ov002_022cd3f4 + 0x18) == 0)
        return;
    func_ov002_021d479c((unsigned short)((arg0 ? 0x8000 : 0) | 0x1B),
                        (unsigned short)arg1, 1, 1);
}
