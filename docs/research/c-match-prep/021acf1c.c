/* CAMPAIGN-PREP candidate for func_021acf1c (ov009, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     branch-table on field_38; (3-i)*3 via rsb+add; default falls to set-flag tail
 *   risk:       The constant (3-case)*3 may codegen as a literal add rather than the rsb;add r0,r0,lsl#1 pair the orig uses per-case. permuter-class (constant-folding choice).
 *   confidence: med
 */
typedef struct Obj021acf1c {
    /* 0x00 */ char _pad0[0x34];
    /* 0x34 */ int field_34;
    /* 0x38 */ int field_38;
    /* 0x3c */ int field_3c;
} Obj021acf1c;

int func_ov009_021acf1c(Obj021acf1c *o)
{
    int v;

    if (o->field_3c != 0)
        return 0xff;

    switch (o->field_38) {
    case 0:
        v = o->field_34;
        if (v <= 0)
            return 0xfe;
        return v + (3 - 0) * 3;
    case 1:
        v = o->field_34;
        if (v <= 0)
            return 0xfd;
        return v + (3 - 1) * 3;
    case 2:
        v = o->field_34;
        if (v == 0)
            return 0xfc;
        return v + (3 - 2) * 3;
    case 3:
        switch (o->field_34) {
        case 0: return 0xfc;
        case 1: return 0x0;
        case 2: return 0xfa;
        case 3: return 0xfb;
        default: break;
        }
        break;
    default:
        break;
    }

    o->field_3c = 1;
    return 0xff;
}
