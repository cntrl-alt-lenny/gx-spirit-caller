/* CAMPAIGN-PREP candidate for func_022524a4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D bitfield :13 for lsl/lsr; unsigned count -> bls+bcc for loop
 *   risk:       Two distinct data symbols (cf16c base + cf17c count) at +0x10 must each get a reloc; if mwcc folds to one literal the guard ldr diverges. struct-guessed.
 *   confidence: med
 */
typedef unsigned int u32;
typedef signed int s32;

typedef struct { u32 id : 13; u32 _rest : 19; } Ov2Entry;

typedef struct {
    u8 _pad00[0x10];
    /* 0x10 */ u32 countA;
    u8 _pad14[0x24c];
    /* 0x260 */ Ov2Entry arrA[1];
} Ov2Field;
typedef unsigned char u8;

extern Ov2Field data_ov002_022cf16c[];
extern u32       data_ov002_022cf17c[];   /* alias of [k].countA, stride 0x868 */

extern s32 func_ov002_021bd030(void);
extern s32 func_0202b878(s32 id);
extern s32 func_0202b8c0(s32 id);
extern s32 func_ov002_021b8f80(s32 id);
extern void func_ov002_02253458(s32 a0, s32 kind, s32 i);

void func_ov002_022524a4(s32 a0)
{
    Ov2Field *f;
    u32 i;
    s32 id;

    if (func_ov002_021bd030() < 0)
        return;

    f = &data_ov002_022cf16c[a0 & 1];
    for (i = 0; i < f->countA; i++) {
        id = f->arrA[i].id;
        if (func_0202b878(id) == 0x16 &&
            func_0202b8c0(id) == 5 &&
            func_ov002_021b8f80(id) == 0)
            func_ov002_02253458(a0, 0xd, i);
    }
}
