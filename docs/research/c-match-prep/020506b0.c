/* CAMPAIGN-PREP candidate for func_020506b0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     byte-swap (B<<8)|((B>>8)&0xff); Fill32 stack hdr; store-order; tag-dispatch
 *   risk:       Byte-swap shifted operand must be FIRST in orr to pick dest reg; the >>8 is asr (signed). 5th stack arg and ctx+0x10 offsets guessed. reshape-able + struct-guessed.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_020506b0 (main, class D, MED tier) — brief 497.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     byte-swap r6 -> halfword (B<<8)|((B>>8)&0xff); Fill32 stack hdr; store-order; tag-dispatch
 *   risk:       byte-swap is lsl#8/asr#8 then and/and/orr into r0; coding it as ((v<<8)&0xff00)|((v>>8)&0xff) must keep the shifted operand FIRST in the orr to pick the dest reg. Also the 5th stack arg [sp+0x18] and ctx+0x10 offsets are struct-guessed. reshape-able (orr operand-order; signed shift for asr) + struct-guessed.
 *   confidence: low
 */
/* func_020506b0 — main, cls D. 5 args: (a0 unused-as-r0?, r1=a1->r5, r2=tag16->r6,
   r3=buf->r4) plus a 5th on stack [sp+0x18]=flag. Early-out if flag==0 || buf==0.
   Builds an 8-byte stack header hdr[]: Fill32 0, hdr[1]=2, hdr[2..3]=byteswap(tag),
   hdr[4..7]=a1. Then inspects buf[0]/buf[1] to dispatch: 0xfe+0xfd or 0x5c ->
   func_0206627c via ctx+0x10 (if nonzero); else a data_02101598 compare (len 6)
   chooses func_0206504c. func_020498f0() reloaded per use. */
extern void Fill32(int val, void *dst, int n);
extern unsigned char data_02101598[];
extern unsigned char *func_020498f0(void);
extern void func_0206504c(unsigned char *buf, int flag, void *hdr);
extern void func_0206627c(unsigned char *buf, int ctx10, int flag, void *hdr);
extern int  func_020a7440(unsigned char *buf, void *pat, int n);

int func_020506b0(int a0, int a1, int tag, unsigned char *buf, int flag)
{
    unsigned char hdr[8];
    unsigned char first;

    (void)a0;
    if (flag == 0 || buf == 0)
        return 0;

    /* .L_5a4 */
    Fill32(0, hdr, 8);
    *(unsigned short *)(hdr + 2) =
        (unsigned short)(((tag << 8) & 0xff00) | ((tag >> 8) & 0xff));
    hdr[1] = 2;
    *(int *)(hdr + 4) = a1;

    first = buf[0];
    if ((first == 0xfe && buf[1] == 0xfd) || first == 0x5c) {  /* .L_5f8 */
        if (*(int *)(func_020498f0() + 0x10) == 0)
            return 1;                                          /* .L_664 */
        func_0206627c(buf, *(int *)(func_020498f0() + 0x10), flag, hdr);
        return 1;
    }

    /* .L_624 */
    if (func_020a7440(buf, data_02101598, 6) == 0) {
        func_0206504c(buf, flag, hdr);
        return 1;                                              /* .L_664 */
    }
    /* .L_650 */
    if (first == 0xfe)
        return 0;
    return 0;
}
