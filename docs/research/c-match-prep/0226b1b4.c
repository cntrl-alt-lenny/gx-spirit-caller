/* CAMPAIGN-PREP candidate for func_0226b1b4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack staging buffer + counted strh copy loop + dispatcher call
 *   risk:       Loop induction (i<<1 double-index vs ptr-increment) and the +2 store displacement may differ; currently ships as .s
 *   confidence: med
 */
/* func_ov002_0226b1b4: build a small u16 staging buffer on the stack -- buf[0]=arg1,
 * then copy arg3 halfwords from arg2 into buf[1..arg3] -- and submit it via the
 * dispatcher func_ov002_0226ad24 with kind 0xf and count arg3+1.
 *   buf is 0x10 bytes (8 u16) -> sub sp,#0x10.
 *   buf[0]=arg1 stored BEFORE the loop (strh r1,[sp]).
 *   loop holds base ip=sp, indexes both arrays by i<<1, stores at [sp+i*2+2]. */
typedef unsigned short u16;
extern int func_ov002_0226ad24(int a, int b, void *p, int n);
void func_ov002_0226b1b4(int arg0, int arg1, const u16 *arg2, int arg3) {
    u16 buf[8];
    int i;
    buf[0] = (u16)arg1;
    for (i = 0; i < arg3; i++)
        buf[i + 1] = arg2[i];
    func_ov002_0226ad24(arg0, 0xf, buf, arg3 + 1);
}
