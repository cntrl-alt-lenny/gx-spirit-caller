/* CAMPAIGN-PREP candidate for func_02252b80 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Bitfield :13; base+0x418 cursor (add #0x18 then #0x400); single ==9 guard
 *   risk:       arrD at 0x418 -> orig builds it as add r6,#0x18; add #0x400 (two adds, not one #0x418 imm). mwcc may emit a single add or different split. reshape-able only if struct offset forces the two-step; struct-guessed on 0x418.
 *   confidence: med
 */
typedef unsigned int u32;
typedef signed int s32;
typedef unsigned char u8;

typedef struct { u32 id : 13; u32 _rest : 19; } Ov2Entry;

typedef struct {
    u8 _pad00[0x14];
    /* 0x14 */ u32 countD;
    u8 _pad18[0x400];
    /* 0x418 */ Ov2Entry arrD[1];
} Ov2Field;

extern Ov2Field data_ov002_022cf16c[];
extern u32       data_ov002_022cf180[];   /* [k].countD, stride 0x868 */

extern s32 func_0202b878(s32 id);
extern void func_ov002_02253458(s32 a0, s32 kind, s32 i);

void func_ov002_02252b80(s32 a0)
{
    Ov2Field *f;
    u32 i;
    s32 id;

    f = &data_ov002_022cf16c[a0 & 1];
    for (i = 0; i < f->countD; i++) {
        id = f->arrD[i].id;
        if (func_0202b878(id) == 9)
            func_ov002_02253458(a0, 0xe, i);
    }
}
