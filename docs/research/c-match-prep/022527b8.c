/* CAMPAIGN-PREP candidate for func_022527b8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: unsigned <= a2 (val first -> cmp r0,r7;bhi); bitfield :13
 *   risk:       a2 held in r7 across loop; the cmp r0,r7;bhi requires val-first unsigned compare with a2 reload-free. If mwcc spills a2 or signs the compare, one cmp/branch flips. reshape-able (cast both u32).
 *   confidence: med
 */
typedef unsigned int u32;
typedef signed int s32;
typedef unsigned char u8;

typedef struct { u32 id : 13; u32 _rest : 19; } Ov2Entry;

typedef struct {
    u8 _pad00[0x10];
    /* 0x10 */ u32 countA;
    u8 _pad14[0x24c];
    /* 0x260 */ Ov2Entry arrA[1];
} Ov2Field;

extern Ov2Field data_ov002_022cf16c[];
extern u32       data_ov002_022cf17c[];   /* [k].countA, stride 0x868 */

extern s32 func_0202b878(s32 id);
extern u32 func_0202b8a8(s32 id);
extern s32 func_ov002_021ca440(s32 a0, s32 id);
extern void func_ov002_02253458(s32 a0, s32 kind, s32 i);

void func_ov002_022527b8(s32 a0, s32 a1, u32 a2)
{
    Ov2Field *f;
    u32 i;
    s32 id;

    f = &data_ov002_022cf16c[a0 & 1];
    for (i = 0; i < f->countA; i++) {
        id = f->arrA[i].id;
        if (func_0202b878(id) == 9 &&
            func_0202b8a8(id) <= a2 &&
            func_ov002_021ca440(a0, id) != 0)
            func_ov002_02253458(a0, 0xd, i);
    }
}
