/* CAMPAIGN-PREP candidate for func_0220136c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     1-bit bitfield arg + guard-chain && + global flag reload
 *   risk:       first branch's inline 'return 1' (ldmneia) may predicate vs branch; b0 reload may CSE
 *   confidence: med
 */
/* func_ov002_0220136c: two guarded queries via 021ca698, each gated on a
 * different field of the cf16c global; bit0 of self->+2 is the call arg. */
typedef unsigned short u16;

struct Self { u16 f0; u16 b0 : 1; };

/* cf16c global, read as a struct: +0x14 and +0x87c word flags. */
struct G16c { char _p0[0x14]; int f14; char _p1[0x87c - 0x14 - 4]; int f87c; };
extern struct G16c data_ov002_022cf16c;

extern int func_ov002_021ca698(int arg0, int arg1);

int func_ov002_0220136c(struct Self *self) {
    if (func_ov002_021ca698(self->b0, 0) != 0 && data_ov002_022cf16c.f14 != 0)
        return 1;
    if (func_ov002_021ca698(self->b0, 1) != 0 && data_ov002_022cf16c.f87c != 0)
        return 1;
    return 0;
}
