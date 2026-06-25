/* CAMPAIGN-PREP candidate for func_02203930 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     leaf bx; :1/:5/:6 bitfields; mla base + separate index; shared ret-0 branches
 *   risk:       Field read ORDER: orig reads self->f2 ONCE into r3 and derives f6 (for the ==0x14 guard) then bit0+f1 later from the same r3. If mwcc reloads f2 (separate ldrh) for the bit0/f1 derivations after the guard, an extra ldrh diverges. reshape-able (cache `struct F2 f2 = self->f2;` once, derive all three from it).
 *   confidence: med
 */
/* func_ov002_02203930 (cls C): leaf guard chain (bx lr, no frame).
 * self->f2: bit0, a 5-bit field at bit1, a 6-bit field at bit6.
 * if (f6 != 0x14) return 0; if (cd3f4[0] == cd3f4[1]) return 0;
 * return *(u16*)(cf1a2 + bit0*0x868 + f1*0x14) != 0.
 * Shared return-0 reached by 3 paths (orig branches to .L_60); base cf1a2 +
 * bit0*0x868 is mla-fused, f1*0x14 a separate index. */

typedef unsigned short u16;

struct F02203930_F2 { u16 bit0 : 1; u16 f1 : 5; u16 f6 : 6; u16 rest : 4; };
struct F02203930_Self { u16 f0; struct F02203930_F2 f2; };

extern int  data_ov002_022cd3f4[];
extern char data_ov002_022cf1a2[];

int func_ov002_02203930(struct F02203930_Self *self) {
    int *c;
    if (self->f2.f6 != 0x14)
        return 0;
    c = data_ov002_022cd3f4;
    if (c[0] == c[1])
        return 0;
    return *(u16 *)(data_ov002_022cf1a2 + self->f2.bit0 * 0x868 +
                    self->f2.f1 * 0x14) != 0;
}
