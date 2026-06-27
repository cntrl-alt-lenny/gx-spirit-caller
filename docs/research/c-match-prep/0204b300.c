/* CAMPAIGN-PREP candidate for func_0204b300 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     outer do-while val<0x20; inner do-while j<=[+0x14] signed; break on match; (val+1)&0xff masked counter
 *   risk:       [+0x14] read as ldrb then compared signed (blt/bgt) - I cast (signed char); the post-inner test 'j>[+0x14]' decides the &0xff increment vs return. If the signed/unsigned char promotion or the break-vs-fallthrough mwcc lowering differs, the branch layout diverges (reshape-able: adjust signedness of the +0x14 field).
 *   confidence: low
 */
/* func_0204b300 - main - class C
 * double loop: outer r6 (0..0x1f), inner r5 scans byte array [+0x2d0] while
 * r5<=[+0x14] (signed). Inner breaks when [+0x2d0][r5]==r6. After inner, if
 * r5>[+0x14] return r6 (not found in full scan); else advance r6.
 * Offsets per src/main/func_0204b300.s.
 */
extern unsigned char *func_020498f0(void);

int func_0204b300(void)
{
    int val;
    int j;
    int i;

    val = 0;
    i = 0;
    do {
        j = i;
        if ((signed char)func_020498f0()[0x14] >= 0) {
            do {
                if (val == func_020498f0()[j + 0x2d0])
                    break;
                j++;
            } while (j <= (signed char)func_020498f0()[0x14]);
        }
        if (j > (signed char)func_020498f0()[0x14])
            break;
        val = (val + 1) & 0xff;
    } while (val < 0x20);
    return val;
}
