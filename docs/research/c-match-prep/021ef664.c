/* CAMPAIGN-PREP candidate for func_021ef664 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: :13 bitfield guard then pass same f13 value into tail call
 *   risk:       orig leaves the :13 field value in r0 from the movs and calls 0202e328 with no re-move; if mwcc re-materialises the arg (mov r0,..) one instr diverges. reshape-able: bind f13 to one local used as both the ==0 test and the arg (as written).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021ef664 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft; iteration expected. Drop into src/, ninja+objdiff, tweak per risk.
 *   Bitfield guard accessor; the :13 field value is passed straight into the single tail call
 *   (orig keeps it in r0 after movs, no re-move).
 */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern u8  data_ov002_022cf16c[];
extern u8  data_ov002_022cf1a4[];
extern int func_0202e328(int a);

struct flags30 { u32 f13 : 13; u32 hi : 19; };

int func_ov002_021ef664(void *obj, int side, int state)
{
    int base, off;
    u32 f13;

    if (side == (int)(((u32)*(u16 *)((u8 *)obj + 2) << 31) >> 31))
        return 0;
    if (state > 4)
        return 0;

    base = (side & 1) * 0x868;
    off  = state * 0x14;

    f13 = ((struct flags30 *)(data_ov002_022cf16c + base + off + 0x30))->f13;
    if (f13 == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + base + off) == 0)
        return 0;

    return func_0202e328((int)f13) != 0 ? 1 : 0;
}
