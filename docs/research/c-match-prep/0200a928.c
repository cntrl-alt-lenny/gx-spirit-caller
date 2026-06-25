/* CAMPAIGN-PREP candidate for func_0200a928 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload base each use (don't bind g=base+0x18a8); teq-break loop; ret in low callee-saved
 *   risk:       orig keeps r5=base and re-adds the offset at each site (`+0x1000`/`[.,#0x8a8]` vs `+0xa8`/`+0x1800`); binding a `g` pointer would collapse those. Kept base-relative so mwcc splits the immediate itself. reshape-able.
 *   confidence: med
 */
/* func_0200a928: fill an 8-byte buffer, compare its 2 words against a global pair at
   data_02104f4c+0x18a8, then Copy32 that pair back into the buffer; return mismatch flag. */
extern void func_0200a7a4(void *p);
extern void Copy32(void *dst, void *src, int n);
extern unsigned char data_02104f4c[];

int func_0200a928(void)
{
    int buf[2];
    int ret = 0;
    int i;
    func_0200a7a4(buf);
    for (i = 0; i < 2; i++) {
        if (buf[i] != *(int *)(data_02104f4c + 0x18a8 + i * 4)) {
            ret = 1;
            break;
        }
    }
    Copy32(buf, data_02104f4c + 0x18a8, 8);
    return ret;
}
