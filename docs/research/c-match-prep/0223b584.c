/* CAMPAIGN-PREP candidate for func_0223b584 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bound the struct base; reload fields; min(n,5) clamp via ternary (movgt r4)
 *   risk:       clamp constant 5 hoist into r4 and movgt vs movlt order; pre-test loop rotation; field offsets guessed
 *   confidence: med
 */
#include <nitro/types.h>

typedef struct {
    u8  _pad0[0x69c];
    s32 field_69c;        /* offset 0x69c */
    u8  _pad1[0x6a4 - 0x69c - 4];
    s32 field_6a4;        /* offset 0x6a4 */
    u8  _pad2[0x6b4 - 0x6a4 - 4];
    s32 array_6b4[6];     /* offset 0x6b4 */
} GlobalA;

extern GlobalA data_ov002_022ce288;
extern s32 func_ov002_0223b4c4(s32 a, int i);

void func_ov002_0223b584(void)
{
    GlobalA *s = &data_ov002_022ce288;
    int i;
    for (i = 0; i < (s->field_6a4 > 5 ? 5 : s->field_6a4); i++) {
        s->array_6b4[i] = func_ov002_0223b4c4(s->field_69c, i);
    }
}
