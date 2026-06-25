/* CAMPAIGN-PREP candidate for func_02253748 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: :N bitfields for the lsl;lsr pairs (bit0:1, :5, :9 at +2/+4); arg-first compare order; signed loop1 / unsigned loop2
 *   risk:       struct-guessed: the +2/+4 bitfield packing (forcing two separate u16 units) is inferred; if mwcc packs both groups into one u16 the offsets shift. Confirm record layout.
 *   confidence: med
 */
/* func_ov002_02253748: two sequential "find matching record" scan loops.
 * Loop 1 (signed count) iterates data_ov002_022ce588[], n = *(int*)(ce288+0x480).
 * Loop 2 (unsigned count) iterates data_ov002_022ce288[], n = *(int*)(ce288+0x490).
 * Each 0x18-byte record: u16@+2 {bit0, bits1..5}, u16@+4 {bits6..14}.
 * Match when bit0==a && mid5==b && f9==c -> return 1, else fall through to 0. */
extern char data_ov002_022ce288[];
extern char data_ov002_022ce588[];

struct Ov002Rec3 {
    char _pad0[2];
    unsigned short b0 : 1;    /* +2 halfword, bit 0  */
    unsigned short m5 : 5;    /* +2 halfword, bits 1..5 */
    unsigned short    : 10;   /* fill the +2 u16 so the next u16 lands at +4 */
    unsigned short    : 6;    /* +4 halfword, bits 0..5 */
    unsigned short f9 : 9;    /* +4 halfword, bits 6..14 */
    unsigned short    : 1;
    char _pad6[0x18 - 6];
};

int func_ov002_02253748(int a, int b, int c) {
    int n;
    struct Ov002Rec3 *p;
    int i;

    n = *(int *)(data_ov002_022ce288 + 0x480);
    if (n > 0) {
        p = (struct Ov002Rec3 *)data_ov002_022ce588;
        for (i = 0; i < n; i++) {
            if (a == p->b0 && b == p->m5 && c == p->f9)
                return 1;
            p++;
        }
    }
    n = *(int *)(data_ov002_022ce288 + 0x490);
    if ((unsigned int)n != 0) {
        p = (struct Ov002Rec3 *)data_ov002_022ce288;
        for (i = 0; (unsigned int)i < (unsigned int)n; i++) {
            if (a == p->b0 && b == p->m5 && c == p->f9)
                return 1;
            p++;
        }
    }
    return 0;
}
