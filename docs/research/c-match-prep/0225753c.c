/* CAMPAIGN-PREP candidate for func_0225753c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order: int-zero [0], strh id, zero f4..f14, bitfield [13:12]=3 via ldrh/bic/orr/strh RMW; bool return.
 *   risk:       the flags RMW is SPLIT in the orig (ldrh[2] hoisted before strh[0], strh[2] last) interleaved with the zero-stores; mwcc won't reproduce that schedule from C. struct-guessed + store-order, permuter-class.
 *   confidence: low
 */
/* func_ov002_0225753c: build a 0x18-byte stack record (id<-arg0, the [13:12]
 * :2 field <-3, rest zeroed), call the resolver func_ov002_02257464, return
 * whether it found a record. The orig zeroes id+flags with one int store then
 * narrows id/flags via halfword writes. */

typedef unsigned short u16;

struct body_0225753c {
    u16 id;
    u16 flags;
    int f4;
    int f8;
    int fc;
    int f10;
    int f14;
};

extern int func_ov002_02257464(struct body_0225753c *self);

int func_ov002_0225753c(int arg0) {
    struct body_0225753c local;
    *(int *)&local = 0;
    local.id = (u16)arg0;
    local.f4 = 0;
    local.f8 = 0;
    local.fc = 0;
    local.f10 = 0;
    local.f14 = 0;
    local.flags = (u16)((local.flags & ~0x3000) | 0x3000);
    return func_ov002_02257464(&local) != 0;
}
