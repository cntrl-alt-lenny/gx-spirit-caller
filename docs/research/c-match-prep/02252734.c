/* CAMPAIGN-PREP candidate for func_02252734 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Simplest form: bitfield :13, unsigned count loop, single !=0 guard
 *   risk:       Cleanest of the family; main risk is the two-symbol reloc (cf16c base vs cf17c count). If folded to one literal the early guard ldr diverges. struct-guessed.
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

extern s32 func_0202f578(s32 id);
extern void func_ov002_02253458(s32 a0, s32 kind, s32 i);

void func_ov002_02252734(s32 a0)
{
    Ov2Field *f;
    u32 i;
    s32 id;

    f = &data_ov002_022cf16c[a0 & 1];
    for (i = 0; i < f->countA; i++) {
        id = f->arrA[i].id;
        if (func_0202f578(id) != 0)
            func_ov002_02253458(a0, 0xd, i);
    }
}
