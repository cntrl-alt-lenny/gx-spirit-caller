/* CAMPAIGN-PREP candidate for func_021eef88 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: :13 bitfield guard; explicit lsl/lsr packed-compare; reload field word
 *   risk:       orig RELOADS the +0x30 word (ldr [r2,lr]) after the cf1a4 guard rather than caching; if mwcc keeps one local in a reg the compare-tail ldr drops. reshape-able: read field via second deref (as written), don't bind once.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021eef88 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft; iteration expected. Drop into src/, ninja+objdiff, tweak per risk.
 *   Pure bitfield + packed sub-field compare, no calls. Sibling of 021ef9c4/021f1170.
 *   cf16c[+0x30] :13 guard; cf1a4 u16 guard; then a packed compare of two bit-runs of
 *   the +0x30 word vs *(u16*)(obj+4).
 */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022cf1a4[];

/* +0x30 flags word: low 13 bits read as lsl#19;lsr#19 bitfield. */
struct flags30 { u32 f13 : 13; u32 hi : 19; };

int func_ov002_021eef88(void *obj, int side, int state)
{
    int base, off;
    u32 field;
    u16 h;
    u32 op1, op2;

    if (state > 4)
        return 0;

    base = (side & 1) * 0x868;
    off  = state * 0x14;

    if (((struct flags30 *)(data_ov002_022cf16c + base + off + 0x30))->f13 == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + base + off) == 0)
        return 0;

    field = *(u32 *)(data_ov002_022cf16c + base + off + 0x30);
    h     = *(u16 *)((u8 *)obj + 4);

    op1 = ((((u32)field << 2) >> 24) << 1) + (((u32)field << 18) >> 31);
    op2 = ((u32)h << 17) >> 23;
    return op1 != op2 ? 1 : 0;
}
