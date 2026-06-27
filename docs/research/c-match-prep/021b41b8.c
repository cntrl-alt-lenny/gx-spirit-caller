/* CAMPAIGN-PREP candidate for func_021b41b8 (ov014, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     volatile :5 bitfield RMW @bit8; reload f58 each tst; if-flow
 *   risk:       struct-guessed: DISPCNT modeled as :5 bitfield. Orig double-loads reg (ldr r2;ldr r1) for read/preserve — if mwcc collapses to one ldr or picks &0x1f00 mask (->and not lsl;lsr), diverges. permuter-class fallback.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov014_021b41b8 (ov014, class D) — brief 494.
 * UNVERIFIED build-free draft. recipe: volatile :5 bitfield at bit8 of DISPCNT
 * (0x4000000); flag!=0 -> field &= ~0x10, flag==0 -> field |= 0x10. The arg
 * field [r0+0x58] is RELOADED (not bound) for the cmp and each tst.
 */
typedef struct {
    unsigned int lo  : 8;
    unsigned int bf  : 5;   /* bits[12:8] */
    unsigned int hi  : 19;
} DispReg;

struct Obj41b8 { char _pad58[0x58]; unsigned int f58; };

extern void func_ov014_021b4294(void);
extern void func_ov014_021b43b8(struct Obj41b8 *o);

int func_ov014_021b41b8(struct Obj41b8 *o) {
    volatile DispReg *reg = (volatile DispReg *)0x4000000;
    if (o->f58 != 0) {
        reg->bf &= ~0x10;
        if (o->f58 & 0x1)
            func_ov014_021b4294();
        if (o->f58 & 0x2)
            func_ov014_021b43b8(o);
        return 1;
    }
    reg->bf |= 0x10;
    return 1;
}
