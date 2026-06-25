/* CAMPAIGN-PREP candidate for func_0223b16c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-branch-tail + :1 bitfield + min-clamp(if<0 ret 0) + tail call
 *   risk:       arg eval order of nested call may flip; field_2 :1 bitfield vs &1; field_5a8 offset/type guessed
 *   confidence: med
 */
#include <nitro/types.h>

typedef struct {
    u16 _u0;
    u16 bit0 : 1;   /* offset 0x2, low bit via lsl#31;lsr#31 */
    u16 : 15;
} Card;

typedef struct {
    u8  _pad[0x5a8];
    u32 field_5a8;
} GlobalA;

extern GlobalA data_ov002_022ce288;
extern int func_ov002_021b99b4(int a, int b);
extern int func_ov002_0221d288(Card *p, int a1);
extern int func_ov002_0223def4(Card *p, int a1);

int func_ov002_0223b16c(Card *p, int a1)
{
    if (data_ov002_022ce288.field_5a8 == 0x80) {
        if (func_ov002_021b99b4(p->bit0, func_ov002_0223def4(p, 0)) < 0)
            return 0;
    }
    return func_ov002_0221d288(p, a1);
}
