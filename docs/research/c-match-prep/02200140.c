/* CAMPAIGN-PREP candidate for func_02200140 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     kind==0x16 guard; ce288.cnt loop scanning status byte + ce884 record bitfields; acc count
 *   risk:       permuter-class AND truncated: asm body is cut off (size 464, no closing pool/return) so the post-loop tail and 021bc6c4 6-arg packing are reconstructed guesses; the parallel ce288.status / ce884 array shapes are struct-guessed. Will not first-build match.
 *   confidence: low
 */
/* func_ov002_02200140 (ov002, class C) — scan accumulate loop, bitfield-heavy.
 * NOTE: asm body is TRUNCATED in the batch (size 464, no final pool/return shown);
 * this models the visible prefix. kind(bits6-11)==0x16 guard, 021ca2b8(bit0) guard,
 * then count = ce288.cnt; for i<count: if (status[i]==0x16 && rec.bits) acc++.
 * Post-loop: acc==1 path inspects self->f14 record bits then 021b947c/021bc6c4. */
typedef unsigned short u16;
typedef unsigned int   u32;

struct F02200140_F2 {
    u16 bit0 : 1;
    u16 b1_5 : 5;
    u16 kind : 6;
    u16 rest : 4;
};
struct F02200140_Self {
    u16 f0;
    struct F02200140_F2 f2;
    char _p[0x14 - 4];
    u32 f14;
};

/* ce288: count word at +0x5d4, parallel status byte array at +0x5dc (i-strided). */
struct G288 { char _p[0x5d4]; u32 cnt; char _q[0x5dc - 0x5d4 - 4]; unsigned char status[1]; };
extern struct G288 data_ov002_022ce288;
extern u32 data_ov002_022ce884[]; /* parallel 32-bit record array, i-strided */

extern int func_ov002_021b947c(int a);
extern int func_ov002_021bc6c4(int a, int b, int c, int d, int e, int f);
extern int func_ov002_021ca2b8(int bit);

int func_ov002_02200140(struct F02200140_Self *self) {
    int acc = 0;
    u32 cnt;
    u32 i;
    if (self->f2.kind != 0x16) return 0;
    if (func_ov002_021ca2b8(self->f2.bit0) == 0) return 0;
    cnt = data_ov002_022ce288.cnt;
    for (i = 0; i < cnt; i++) {
        if (data_ov002_022ce288.status[i] == 0x16) {
            u32 rec = data_ov002_022ce884[i];
            if (((rec << 0xf) >> 0x1f) && ((rec << 0x10) >> 0x1f) &&
                (((rec << 0x9) >> 0x1c) == 0xe))
                acc++;
        }
    }
    if (acc == 1) {
        u32 rw = self->f14;
        if (((rw << 0xf) >> 0x1f) && ((rw << 0x10) >> 0x1f) &&
            (((rw << 0x9) >> 0x1c) == 0xe)) {
            int h = func_ov002_021b947c((self->f14 << 0x17) >> 0x17);
            int rw2 = self->f14;
            return func_ov002_021bc6c4(h, (rw2 << 0x16) >> 0x1f,
                                       (h >> 0x10) & 0xff,
                                       ((h << 0x10) >> 0x10) >> 8 & 0xff,
                                       h & 0xff,
                                       ((h << 0x10) >> 0x10));
        }
    }
    return 0;
}
