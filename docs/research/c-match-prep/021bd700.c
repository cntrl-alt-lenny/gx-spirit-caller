/* CAMPAIGN-PREP candidate for func_021bd700 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :1 bitfield branch; value%10/value/10 magic via plain %,/ (f0=rem,f4=quot order); store f0,f4,f8 in asm order
 *   risk:       permuter-class: orig issues TWO smull r2,#10 (one feeding %, one feeding /) and the !flag path uses stmeqia to store {0,value} together; mwcc likely fuses the divide and splits the stores, diverging. struct-guessed.
 *   confidence: low
 */
/* func_ov006_021bd700: validate a new value against a 0x24-stride slot's
 * limit, then either store it directly or split it into f0=value%10 / f4=value/10
 * (per the slot's :1 bitfield), zero f8, and run a clamping decrement loop
 * bounded by obj->f50. Returns 1, or 0 on the over-limit reject. (class D.) */
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

int func_ov006_021bd700(char *obj, int sel, int value) {
    Ov006Slot *s = (Ov006Slot *)(obj + 0xa0) + sel;
    int limit;
    if (value >= s->fc) {
        if (s->fc > 0)
            return 0;
    }
    if (s->flag) {
        s->f0 = value % 10;
        s->f4 = value / 10;
        s->f8 = 0;
    } else {
        s->f0 = 0;
        s->f4 = value;
        s->f8 = 0;
    }
    limit = (*(int *)(obj + 0x50) == 4) ? 3 : 4;
    while (s->f4 > 0 && (s->f10 - s->f8) > limit) {
        s->f4 = s->f4 - 1;
        s->f8 = s->f8 + 1;
    }
    return 1;
}
