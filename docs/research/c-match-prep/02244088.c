/* CAMPAIGN-PREP candidate for func_02244088 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     :1 bitfield narrow + two guards returning -1 (mvn) + tail call
 *   risk:       field_2 :1 bitfield vs &1; -1 materialised via mvn r1,#0 + moveq/mvneq should match; high otherwise
 *   confidence: med
 */
#include <nitro/types.h>

typedef struct {
    u16 _u0;
    u16 bit0 : 1;   /* offset 0x2, low bit via lsl#31;lsr#31 */
    u16 : 15;
} Card;

extern int func_ov002_021bd030(int a);
extern int func_ov002_022577dc(Card *p);
extern int func_ov002_0223f684(Card *p, int a1);

int func_ov002_02244088(Card *p, int a1)
{
    if (func_ov002_021bd030(p->bit0) == -1)
        return -1;
    if (func_ov002_022577dc(p) == 0)
        return -1;
    return func_ov002_0223f684(p, a1);
}
