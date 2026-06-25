/* CAMPAIGN-PREP candidate for func_02252d98 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: signed <=5 (cmp #5;bgt); bitfield :13; 4-guard AND chain; arrB 0x3a0
 *   risk:       Four sequential calls inside the && chain; mwcc scheduling of the cmp #5;bgt first guard and id-reload across calls may differ. Mostly reshape-able; residual call/cmp scheduling is permuter-class.
 *   confidence: med
 */
typedef unsigned int u32;
typedef signed int s32;
typedef unsigned char u8;

typedef struct { u32 id : 13; u32 _rest : 19; } Ov2Entry;

typedef struct {
    u8 _pad00[0x18];
    /* 0x18 */ u32 countB;
    u8 _pad1c[0x384];
    /* 0x3a0 */ Ov2Entry arrB[1];
} Ov2Field;

extern Ov2Field data_ov002_022cf16c[];
extern u32       data_ov002_022cf184[];   /* [k].countB, stride 0x868 */

extern s32 func_0202b8a8(s32 id);
extern s32 func_02031684(s32 id);
extern s32 func_ov002_021ca3f0(s32 a0, s32 id);
extern s32 func_02030b84(s32 id);
extern void func_ov002_02253458(s32 a0, s32 kind, s32 i);

void func_ov002_02252d98(s32 a0)
{
    Ov2Field *f;
    u32 i;
    s32 id;

    f = &data_ov002_022cf16c[a0 & 1];
    for (i = 0; i < f->countB; i++) {
        id = f->arrB[i].id;
        if (func_0202b8a8(id) <= 5 &&
            func_02031684(id) != 0 &&
            func_ov002_021ca3f0(a0, id) != 0 &&
            func_02030b84(id) != 0)
            func_ov002_02253458(a0, 0xc, i);
    }
}
