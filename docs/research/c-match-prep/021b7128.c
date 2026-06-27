/* CAMPAIGN-PREP candidate for func_021b7128 (ov010, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     tst/orr flag chain; (x<<0x1c)>>0x1f extracts bit3 — write as <<28>>31 not & to force lsl;lsr
 *   risk:       The orig LOADS [r1,#0xc] into r0 early then never uses it (dead load) — mwcc will likely drop my (void) read so an ldr diverges. reshape-able: but dead-load resurrection is fragile; may stay permuter-class.
 *   confidence: med
 */
typedef struct Input021b7128 {
    /* 0x00 */ char _pad0[0x54];
    /* 0x54 */ unsigned short field_54;
} Input021b7128;

typedef struct GlobB021b7128 {
    /* 0x00 */ char _pad0[0xc];
    /* 0x0c */ int field_c;
} GlobB021b7128;

typedef struct Flags021b7128 {
    /* 0x000 */ char _pad0[0x358];
    /* 0x358 */ unsigned int field_358;
} Flags021b7128;

extern Input021b7128 data_02104bac;
extern GlobB021b7128 data_ov010_021b9884;
extern Flags021b7128 data_ov010_021b9890;

void func_ov010_021b7128(void)
{
    Flags021b7128 *f = &data_ov010_021b9890;
    unsigned short ctrl;

    ctrl = data_02104bac.field_54;
    (void)data_ov010_021b9884.field_c;

    if (ctrl & 0x2) {
        f->field_358 |= 0x4;
    } else if (ctrl & 0x1) {
        f->field_358 |= 0x10;
    }

    if (((f->field_358 << 0x1c) >> 0x1f) == 1) {
        f->field_358 |= 0x10;
    }
}
