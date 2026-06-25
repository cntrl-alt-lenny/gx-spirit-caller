/* CAMPAIGN-PREP candidate for func_0201d47c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     memset call then bic/orr byte-field RMW as two byte stores
 *   risk:       orig does explicit bic#0xff/orr#0x20 then bic#0xff00/orr#0x2000 on the SAME loaded word (read-modify-write of one int at +0x1c). Modeling as a packed-byte struct (b1c=0x20;b1d=0x20) may emit two strb instead of the single ldr/bic/orr/str. Keep it an int RMW. reshape-able (int-RMW vs byte-store) + struct-guessed
 *   confidence: med
 */
/* func_0201d47c: zero a 0x28-byte object then set two low bytes of word +0x1c.
 * func_0209448c(0, p, 0x28) = memset(p,0,0x28) (arg order val,dst,len).
 * word@+0x1c: byte0 := 0x20, byte1 := 0x20 (via bic/orr RMW).
 */
extern void func_0209448c(int val, void *dst, int len);

void func_0201d47c(unsigned char *p)
{
    int v;
    func_0209448c(0, p, 0x28);
    v = *(int *)(p + 0x1c);
    v = (v & ~0xff)   | 0x20;
    v = (v & ~0xff00) | 0x2000;
    *(int *)(p + 0x1c) = v;
}
