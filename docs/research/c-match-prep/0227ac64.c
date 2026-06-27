/* CAMPAIGN-PREP candidate for func_0227ac64 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: 5-field header; reload *(u32*)arg1 twice (orig reloads); :15 f8; mode=3; class hi-byte test
 *   risk:       TRUNCATED tail reconstructed from 0227adcc — the final 021b9aa8 branch/return is guessed; also the f8 :15 vs the f23 unpack share v and orig RELOADS [arg1] (two ldr). Confidence low: tail + several field semantics struct-guessed; reg-alloc permuter-class.
 *   confidence: low
 */
/* func_ov002_0227ac64 (ov002, class D, MED) — sequential packed-field inserts.
 * NOTE: source asm is TRUNCATED at the cmp after func_021b9aa8; tail (the
 * branch/return on that result) reconstructed from sibling 0227adcc shape.
 * Guards on 021bc6e8 (signed<0 early-return) and 021bb068 (sets b6), then
 * packs a 5-field header into data_022cd300 from args + *(u32*)arg1, sets
 * +0x16 mode=3, +0x4 etc., classifies via 021b947c, final 021b9aa8 call. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

struct Hdr300 { u32 b0:1; u32 f1:4; u32 b5:1; u32 b6:1; u32 b7:1; u32 f8:15; u32 f23:9; };
struct F30016 { u16 lo8:8; u16 mode:3; u16 hi:5; };

extern char data_ov002_022cd300[];
extern int  func_ov002_021b947c(int v);
extern int  func_ov002_021b9aa8(int a, int b);
extern int  func_ov002_021bb068(int id);
extern int  func_ov002_021bc6e8(void);

int func_ov002_0227ac64(int a, int b, int c, int d, int e)
{
    struct Hdr300 *h = (struct Hdr300 *)data_ov002_022cd300;
    int r4;
    u32 v;
    int klass;
    r4 = func_ov002_021bc6e8();
    if (r4 < 0)
        return r4;
    if (func_ov002_021bb068(0) != 0)   /* _LIT0 pool id; arg value struct-guessed */
        c = 1;
    h->b0 = a;
    h->f1 = r4;
    h->b5 = 0;
    h->b6 = c;
    h->b7 = d;
    data_ov002_022cd300[9] = 0;
    data_ov002_022cd300[8] = 0;
    v = *(u32 *)b;
    h->f8 = (u32)((v << 0x13) >> 0x13);   /* :15 slot field at bit8 */
    v = *(u32 *)b;
    h->f23 = (u32)((((unsigned)(v << 2) >> 0x18) << 1) + ((unsigned)(v << 0x12) >> 0x1f));
    ((struct F30016 *)(data_ov002_022cd300 + 0x16))->mode = 3;
    *(u16 *)(data_ov002_022cd300 + 4) = (u16)((e << 0x10 >> 0x10) | 4);
    *(u16 *)(data_ov002_022cd300 + 6) = (u16)((unsigned)e >> 0x10);
    klass = (func_ov002_021b947c((int)(h->f8)) >> 8) & 0xff;
    if (klass == 0xe)
        *(u16 *)(data_ov002_022cd300 + 4) |= 0x20;
    return func_ov002_021b9aa8(a, (int)(*(u32 *)data_ov002_022cd300 >> 0x17));
}
