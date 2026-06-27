/* CAMPAIGN-PREP candidate for func_0206504c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     post-increment ptr byte-copy loop; htonl term-order; type branch; store buf back
 *   risk:       SOURCE ASM TRUNCATED past .L_384 so the second branch's dispatch/byteswap tail is inferred — likely wrong. Also htonl orr-grouping is permuter-class. Re-extract full asm before trusting.
 *   confidence: low
 */
/* func_0206504c: WARNING the supplied asm is TRUNCATED mid-second-branch
 * (ends inside .L_384). Reconstructed from the visible structure: validate
 * via func_02065e14, branch on pkt type byte (5/7 vs other), copy a 20-byte
 * (type 5/7) or 21-byte body into a stack buffer, byteswap one dword, and
 * dispatch to func_020653a0 / func_020652b8. The tail past .L_384 is
 * inferred to mirror the .L_2e8 path. */

extern int func_02065e14(int a, int b, int c);
extern int func_02065fa8(unsigned int v);
extern int func_020653a0(int self, void *buf, int c);
extern int func_020652b8(int self, void *buf, int c);

int func_0206504c(unsigned char *pkt, int len, int c)
{
    unsigned char buf[0x2c];
    unsigned char *d;
    int i;
    unsigned char type;
    unsigned int w;

    if (func_02065e14((int)pkt, len, c) == 0) return 0;

    type = pkt[7];
    if (type == 5 || type == 7) {
        if (len < 0x14) return 0;
        d = buf;
        for (i = 0xa; i != 0; i--) {
            *d++ = *pkt++;
            *d++ = *pkt++;
        }
        w = *(unsigned int *)(buf + 0x8);
        w = ((w >> 24) & 0xff) | ((w >> 8) & 0xff00) |
            ((w << 8) & 0xff0000) | ((w << 24) & 0xff000000);
        *(unsigned int *)(buf + 0x8) = w;
        if (func_02065fa8(w) == 0) return 0;
        if (type == 5) return func_020653a0((int)pkt, buf, c);
        return func_020652b8((int)pkt, buf, c);
    } else {
        if (len < 0x15) return 0;
        d = buf + 0x14;
        for (i = 0xa; i != 0; i--) {
            *d++ = *pkt++;
            *d++ = *pkt++;
        }
        *d = *pkt;
        w = *(unsigned int *)(buf + 0x1c);
        w = ((w >> 24) & 0xff) | ((w >> 8) & 0xff00) |
            ((w << 8) & 0xff0000) | ((w << 24) & 0xff000000);
        *(unsigned int *)(buf + 0x1c) = w;
        /* tail past .L_384 truncated in source asm; inferred symmetric */
        return func_020652b8((int)pkt, buf, c);
    }
}
