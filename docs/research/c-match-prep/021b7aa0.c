/* CAMPAIGN-PREP candidate for func_021b7aa0 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early-return guard; switch Copy32 w/ mla idx*0x124 base; tail call
 *   risk:       case1 0xb50+0x3000 may fold to 0x3b50 then re-split differently vs orig two adds (reshape-able: keep two summands, already split).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov006_021b7aa0 (ov006, class C) — MED tier.
 * UNVERIFIED build-free draft. Drop into src/, ninja + objdiff, tweak per risk.
 *   recipe: guard-call early-return; switch(sel) of Copy32 with mla idx*0x124 base; tail call.
 * Sig from asm: r0=p, r1=sel, r2=idx. func_021b6ad8 called with p (r0 live at bl).
 * Copy32(dst,src,n): dst r0, src r1, n r2 (confirmed in tree). */

extern void Copy32(void *dst, void *src, int n);
extern char data_02105a4c[];
extern void func_020124a4(int idx, void *p);
extern int  func_ov006_021b6ad8(void *p);
extern void func_ov006_021b7b78(void *p);

int func_ov006_021b7aa0(char *p, int sel, int idx) {
    if (func_ov006_021b6ad8(p) == 0)
        return 0;
    switch (sel) {
    case 0:
        Copy32(p + 0x248 + idx * 0x124, p, 0x124);
        break;
    case 1:
        Copy32(p + 0xb50 + 0x3000 + idx * 0x124, p, 0x124);
        break;
    case 2:
        Copy32(data_02105a4c, p, 0x124);
        break;
    case 3:
        func_020124a4(idx, p);
        break;
    }
    func_ov006_021b7b78(p);
    return 1;
}
