/* CAMPAIGN-PREP candidate for func_02243d28 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bit0 narrow, byte-pack orr key, u16 zero-ext, counted scan, branch tail
 *   risk:       reshape-able: count loop is do/while gated by count>0; if mwcc hoists key compute or reorders the `cmp r4,#4 / movgt` guard, swap guard order. Low residual.
 *   confidence: med
 */
// func_ov002_02243d28 — guard + byte-pack key + counted halfword scan (cls D)
// obj+0x2 bit0 must equal r1(p); p2<=4; call 021bc55c(p,p2); obj+0x6 -> count (bits8..15)
// key = (p&0xff) | ((p2&0xff)<<8), zero-extended u16; scan obj[+0x8 + i] for match

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern int func_ov002_021bc55c(int a, int b);

int func_ov002_02243d28(u16 *obj, int p, int p2) {
    u16 h2 = obj[1];                 /* obj+0x2 */
    if (p == ((u32)(h2 << 0x1f) >> 0x1f))
        return 0;
    if (p2 > 4)
        return 0;
    if (func_ov002_021bc55c(p, p2) == 0)
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
