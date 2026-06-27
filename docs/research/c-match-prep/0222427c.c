/* CAMPAIGN-PREP candidate for func_0222427c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class-D bitfield shift-pairs as :N; bind sel*0x868 base; store-order preserved
 *   risk:       struct-guessed: the +0x30 word sub-field shifts (bits29:22*2 + bit13) and 0x868/0x14 strides are inferred from asm; wrong field widths break the cmp.
 *   confidence: low
 */
/* func_ov002_0222427c : ov002 packed-field decode + mla index + rsbs-select (class D) */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef signed int s32;

/* entity: halfword fields at +0x2 (packed bits) and +0x4 (packed bits) */
struct Entity {
    u16 f0;       /* +0x0 */
    u16 f2;       /* +0x2 : bit0 = table select; bits[5:1] = entry index; ... */
    u16 f4;       /* +0x4 : bit2 = guard; bits[14:6] = expected value */
};

/* per-entry record, stride 0x14 (20). field at +0x30 region is reached via
   (base + sel*0x868 + entry*0x14 + 0x30). The +0x30 word packs sub-fields. */
extern u8  data_ov002_022cf16c[]; /* table base; table[1] = base + 0x868 */
extern u8  data_ov002_022cf178[]; /* parallel ptr array, stride 0x868 */
extern u32 data_ov002_022d016c;   /* global @ +0xcec compared against bit0 */

extern int func_ov002_021b4120(u16);
extern int func_ov002_021d59cc(int, int, int, int);
extern int func_ov002_021e104c(int);
extern int func_ov002_0226af38(int, int, int);

int func_ov002_0222427c(struct Entity *e)
{
    u8 sel;
    u32 entry;
    u32 packed;
    u32 fieldA, fieldB;
    int n;

    if ((e->f4 << 0x1d) >> 0x1f) return 0;          /* bit2 guard */

    sel   = e->f2 & 1;                                /* bit0 select */
    entry = (e->f2 << 0x1a) >> 0x1b;                  /* bits[5:1] */
    packed = *(u32 *)(data_ov002_022cf16c + sel * 0x868 + entry * 0x14 + 0x30);
    fieldA = ((packed << 0x2) >> 0x18) << 1;         /* bits[29:22]*2 */
    fieldB = (packed << 0x12) >> 0x1f;               /* bit13 */
    if (((e->f4 << 0x11) >> 0x17) != fieldA + fieldB) return 0; /* bits[14:6] */

    if (*(u32 *)((u8 *)&data_ov002_022d016c + 0xcec) == sel) {
        n = func_ov002_021b4120(e->f0);
        if (n > 0)
            func_ov002_0226af38((e->f2 << 0x1f) >> 0x1f, 0, n);
    } else {
        int v = *(u32 *)(data_ov002_022cf178 + sel * 0x868);
        int d = 4 - v;
        if (d != 0 && func_ov002_021e104c(d)) {
            func_ov002_021d59cc((e->f2 << 0x1f) >> 0x1f,
                                 (e->f2 << 0x1a) >> 0x1b,
                                 0x11,
                                 (u16)(d << 0x10 >> 0x10));
        }
    }
    return 0;
}
