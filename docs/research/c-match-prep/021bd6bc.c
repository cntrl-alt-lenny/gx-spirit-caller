/* CAMPAIGN-PREP candidate for func_021bd6bc (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: f20 bit0 as unsigned :1 (lsl#31;lsr#31); ldmib f4,f8 order via (f8+f4); mvnge clamp via if-assign
 *   risk:       reshape-able: the ldmib loads {f4,f8} so the sum operand-order is (f8+f4) to pick the dest reg; if mwcc writes f4+f8 the add source regs swap. struct-guessed offsets/stride 0x24.
 *   confidence: med
 */
/* func_ov006_021bd6bc: index a 0x24-stride slot array at obj+0xa0 by obj-arg
 * sel, sum two slot counters, optionally scale by 10 and add a base, then
 * clamp the result to -1 when it reaches the slot's limit. Leaf; returns the
 * value. (class D: :1 bitfield test selects the *10 path.) */
typedef struct {
    int f0;
    int f4;
    int f8;
    int fc;
    int f10;
    int pad14;
    int pad18;
    int pad1c;
    unsigned flag : 1;
    unsigned : 31;
} Ov006Slot;

int func_ov006_021bd6bc(char *obj, int sel) {
    Ov006Slot *s = (Ov006Slot *)(obj + 0xa0) + sel;
    int v;
    if (s->flag) {
        v = (s->f8 + s->f4) * 10 + s->f0;
    } else {
        v = s->f8 + s->f4;
    }
    if (v >= s->fc)
        v = -1;
    return v;
}
