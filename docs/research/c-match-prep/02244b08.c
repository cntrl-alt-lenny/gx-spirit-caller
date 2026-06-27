/* CAMPAIGN-PREP candidate for func_02244b08 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bit0 narrow, range guard, byte-pack orr key, u16 zero-ext, counted scan
 *   risk:       reshape-able: range test `5<=p2<10` codegens cmp;blt/cmp;blt pair — if mwcc emits `&&` differently swap to nested ifs. Byte-pack/scan identical to 02243d28 (proven shape).
 *   confidence: med
 */
// func_ov002_02244b08 — guard + byte-pack key + counted halfword scan (cls D)
// clone of 02243d28 but: range guard is 5<=p2<10 (else ret0), calls 021bcfe4
// obj+0x2 bit0 must != p1; obj+0x6 -> count(bits8..15); key=(p&0xff)|((p2&0xff)<<8) u16; scan obj[+0x8+i]

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern int func_ov002_021bcfe4(int a, int b);

int func_ov002_02244b08(u16 *obj, int p, int p2) {
    u16 h2 = obj[1];                 /* obj+0x2 */
    if (p == ((u32)(h2 << 0x1f) >> 0x1f))
        return 0;
    if (p2 < 5 || p2 >= 0xa)
        return 0;
    if (func_ov002_021bcfe4(p, p2) == 0)
        return 0;
    {
        u16 h6 = obj[3];            /* obj+0x6 */
        int count = (u32)(h6 << 0x10) >> 0x18;   /* bits8..15 */
        int i = 0;
        if (count > 0) {
            u32 key = ((p & 0xff) | ((p2 & 0xff) << 0x8));
            u16 k = (u16)key;
            do {
                if (k == obj[4 + i])    /* obj+0x8 + i*2 */
                    return 0;
                i++;
            } while (i < count);
        }
    }
    return 1;
}
