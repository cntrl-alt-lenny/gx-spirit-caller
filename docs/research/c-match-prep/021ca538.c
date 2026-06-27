/* CAMPAIGN-PREP candidate for func_021ca538 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Q12 smull square via long long; 5x2 byte-copy loop; (s8) field; ordered stack args
 *   risk:       permuter-class: byte-copy + 64-bit square + two call setups are hand-interleaved (D[0x238/23c]>>12 stack stores between ldrb index loads); mwcc reschedules the long-long lowering
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov011_021ca538 (ov011, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 *   recipe:     5x2 byte-copy loop; Q12 smull square (x*x+0x800)>>12 via long long; signed-byte field; two interleaved calls
 *   risk:       permuter-class: the prologue byte-copy + 64-bit square + two call-arg setups (the second defers D[0x238]/D[0x23c] asr#12 stack stores between ldrb index loads) are hand-interleaved; mwcc's scheduling of the long-long lowering and stack stores will diverge.
 *   confidence: low
 */
/* func_ov011_021ca538 (ov011, class D): copy 10 bytes from data_021d2fbe into a
 * local u8[5][2]; sq=(x*x+0x800)>>12 (Q12); v=((x+sq)*10)+0x1000; idx = (s8)
 * data_4000[0x2bc]-1; call func_0201e818(v,v,0,&mtx); then func_0208e334(
 * 0x4000030,&mtx, buf[idx][0], buf[idx][1], data_4000[0x238]>>12, data_4000[0x23c]>>12). */
extern unsigned char data_ov011_021d2fbe[];
extern char data_ov011_021d4000[];
extern void func_0201e818(int angle0, int angle1, int idxsrc, int *out);
extern void func_0208e334(int r0, int *mtx, int r2, int r3, int s4, int s5);

void func_ov011_021ca538(int x) {
    unsigned char buf[5][2];
    int mtx[4];
    int i;
    int sq;
    int v;
    int idx;
    for (i = 0; i < 5; i++) {
        buf[i][0] = data_ov011_021d2fbe[i * 2];
        buf[i][1] = data_ov011_021d2fbe[i * 2 + 1];
    }
    sq = (int)(((long long)x * x + 0x800) >> 12);
    v = (x + sq) * 10 + 0x1000;
    idx = (signed char)*(int *)(data_ov011_021d4000 + 0x2bc) - 1;
    func_0201e818(v, v, 0, mtx);
    func_0208e334(0x4000030, mtx, buf[idx][0], buf[idx][1],
                  *(int *)(data_ov011_021d4000 + 0x238) >> 12,
                  *(int *)(data_ov011_021d4000 + 0x23c) >> 12);
}
