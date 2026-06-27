/* CAMPAIGN-PREP candidate for func_02044610 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: read N units then mask(~0/0x7ff/0x3ff) + >>3 reseat + asr#6, store-order
 *   risk:       struct-guessed + permuter-class: r4 layout and func_02094688 dst/src order inferred; the and-~0 idioms, the lsr#3 cross-word reseat and the signed asr#6 on f10 each pick dest regs by operand-order — likely diverge without per-store reshape.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02044610 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Mirror/deserialize of 02043a78: reads the
 * data_0219da7c bss byte-stream into struct r4 via func_02094688(dst,src,nbits)
 * then clears/normalizes packed fields with mask + lsr/orr in store order.
 * da81/da86/da88 are fixed byte offsets (separate symbols).
 *   recipe: D store-order; read N units; mask high bits (and ~0 / 0x7ff / 0x3ff); >>3 reseat; asr#6
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_0219da7c;
extern u8 data_0219da81;
extern u8 data_0219da86;
extern u8 data_0219da88;
extern void func_02094688(void *dst, void *src, int nbits);

typedef struct {
    u32 f0;     /* +0x00 */
    u32 f4;     /* +0x04 */
    u32 f8;     /* +0x08 */
    u32 fc;     /* +0x0c */
    u16 f10;    /* +0x10 */
    u8  f12[2]; /* +0x12 */
} Obj02044610;

void func_02044610(Obj02044610 *r4)
{
    func_02094688(&data_0219da7c, r4, 6);
    r4->f0 = r4->f0 & ~0;          /* mvn r0,#0; and -> clears nothing structurally, matches asm */
    r4->f4 = r4->f4 & 0x7ff;

    func_02094688(&data_0219da81, &r4->f8, 6);
    /* reseat the f8/fc pair down by 3, then re-mask */
    {
        u32 a = r4->f8;
        u32 b = r4->fc;
        r4->f8 = (a >> 3) | (b << 0x1d);
        r4->fc = b >> 3;
    }
    r4->f8 = r4->f8 & ~0;
    r4->fc = r4->fc & 0x7ff;

    func_02094688(&data_0219da86, &r4->f10, 2);
    r4->f10 = (u16)((s16_dummy)0);  /* replaced below */
    {
        u16 h = r4->f10;
        r4->f10 = (u16)((short)h >> 6);   /* asr #6 */
        r4->f10 = (u16)(r4->f10 & 0x3ff);
    }

    func_02094688(&data_0219da88, &r4->f12[0], 2);
}
