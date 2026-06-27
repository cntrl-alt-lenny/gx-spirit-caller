/* CAMPAIGN-PREP candidate for func_021ca6c4 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     unsigned bitfield guards; s16 low-half RMW +0x2a clamp; smull-magic divide to short table; 3 call setups
 *   risk:       struct-guessed+permuter-class: smull divisor (_LIT2 magic) UNKNOWN (0x100 is placeholder); s16 low-half RMW reg-alloc and clamp branch scheduling also diverge
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov011_021ca6c4 (ov011, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches; large render body.
 *   recipe:     unsigned bitfield guards (lsl;lsr;movs); s16 pack into low half (+0x2a, clamp 0..0xff); smull-magic divide into short table; 3 ov000 call setups
 *   risk:       struct-guessed+permuter-class: the smull divide constant (_LIT2 magic) is UNKNOWN -- the '/0x100' below is a placeholder for the real divisor; also the s16 low-half RMW (and 0xffff0000; orr (low+0x2a)) reg-alloc + the clamp branches are scheduling-sensitive.
 *   confidence: low
 */
/* func_ov011_021ca6c4 (ov011, class D): render/anim updater on data_403c (base B).
 * if bit8 of data_4000[0x2bc]==0 return. if B[0x264]==0 and 4-bit field (bits 8:5)
 * of B[0x268]!=0: take s16 low of B[0x26c], +0x2a, write back; if <=0 nothing,
 * if >=0xff clamp low=0xff and clear bit8 of B[0x280]; then idx = magic-divide of
 * (s16 low)<<14, ldrsh tbl[idx], a=(s16 tbl*16)>>12, call ov000 helpers.
 * else clear bit8 of B[0x280]. finally call func_ov000_021ab4bc(0, B[0x264]==1?1:8). */
extern short data_020bef80[];
extern char data_ov011_021d4000[];
extern char data_ov011_021d403c[];
extern void func_ov000_021ab4bc(int r0, int r1);
extern void func_ov000_021ab5d8(int r0, int r1, int r2);
extern void func_ov000_021ab62c(int r0, int r1, int r2, int r3);
extern void func_ov000_021ab688(int r0, int r1, int r2);

void func_ov011_021ca6c4(void) {
    char *B = data_ov011_021d403c;
    if (((unsigned int)(*(int *)(data_ov011_021d4000 + 0x2bc) << 23) >> 31) == 0)
        return;
    if (*(int *)(B + 0x264) == 0 &&
        ((unsigned int)(*(int *)(B + 0x268) << 23) >> 28) != 0) {
        int low = (short)*(int *)(B + 0x26c);
        int nv = (*(int *)(B + 0x26c) & 0xffff0000) | (((low + 0x2a) << 16) >> 16 & 0xffff);
        *(int *)(B + 0x26c) = nv;
        if ((short)nv > 0) {
            int s;
            int idx;
            short t;
            int a;
            if ((short)nv >= 0xff) {
                *(int *)(B + 0x26c) = (nv & 0xffff0000) | 0xff;
                *(int *)(B + 0x280) = *(int *)(B + 0x280) & ~0x100;
            }
            s = (short)*(int *)(B + 0x26c);
            /* MAGIC DIVIDE: real divisor is _LIT2 (unknown); 0x100 is a placeholder */
            idx = (s << 14) / 0x100;
            t = ((short *)data_020bef80)[idx];
            a = (t << 4) >> 12;
            func_ov000_021ab62c(0, 0x3f, 0x3f, t << 4);
            func_ov000_021ab5d8(0, 8, 2);
            func_ov000_021ab688(0, a, 0x10 - a);
        }
    } else {
        *(int *)(B + 0x280) = *(int *)(B + 0x280) & ~0x100;
    }
    func_ov000_021ab4bc(0, *(int *)(B + 0x264) == 1 ? 1 : 8);
}
