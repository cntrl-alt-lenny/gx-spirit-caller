/* CAMPAIGN-PREP candidate for func_02252998 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: a2-first equality (cmp r7,r0;bne) via a2==call; bitfield :13
 *   risk:       cmp r7,r0 needs a2 as rn (a2 held in r7 across loop). Equality operand order in mwcc may emit cmp r0,r7 instead -> harmless reg swap but byte-diff. permuter-class if order flips.
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

extern s32 func_0202e234(s32 id);
extern s32 func_0202b8a8(s32 id);
extern s32 func_0202f46c(s32 id);
extern s32 func_ov002_021ca440(s32 a0, s32 id);
extern void func_ov002_02253458(s32 a0, s32 kind, s32 i);

void func_ov002_02252998(s32 a0, s32 a1, s32 a2)
{
    Ov2Field *f;
    u32 i;
    s32 id;

    f = &data_ov002_022cf16c[a0 & 1];
    for (i = 0; i < f->countA; i++) {
        id = f->arrA[i].id;
        if (func_0202e234(id) != 0 &&
            a2 == func_0202b8a8(id) &&
            func_0202f46c(id) != 0 &&
            func_ov002_021ca440(a0, id) != 0)
            func_ov002_02253458(a0, 0xd, i);
    }
}
