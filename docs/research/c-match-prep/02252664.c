/* CAMPAIGN-PREP candidate for func_02252664 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Early a2!=0 tail-call; bitfield :13; unsigned count loop; AND predicate chain
 *   risk:       a2!=0 path is a non-tail bl+return; mwcc may tail-merge or reorder the bne block placement after the loop. reshape-able (structure as trailing if). Also cf16c/cf184 two-symbol reloc. struct-guessed.
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
extern u32       data_ov002_022cf184[];   /* alias of [k].countB, stride 0x868 */

extern s32 func_0202b878(s32 id);
extern s32 func_0202b890(s32 id);
extern s32 func_ov002_021ca3f0(s32 a0, s32 id);
extern s32 func_ov002_0223c918(s32 a0, s32 id);
extern s32 func_ov002_0224fb58(s32 a0, s32 a1, s32 a2);
extern void func_ov002_02253458(s32 a0, s32 kind, s32 i);

void func_ov002_02252664(s32 a0, s32 a1, s32 a2)
{
    Ov2Field *f;
    u32 i;
    s32 id;

    if (a2 != 0) {
        func_ov002_0224fb58(a0, a1, a2);
        return;
    }

    f = &data_ov002_022cf16c[a0 & 1];
    for (i = 0; i < f->countB; i++) {
        id = f->arrB[i].id;
        if (func_0202b890(id) == 2 &&
            func_0202b878(id) == 7 &&
            func_ov002_021ca3f0(a0, id) != 0 &&
            func_ov002_0223c918(a0, id) != 0)
            func_ov002_02253458(a0, 0xc, i);
    }
}
