/* CAMPAIGN-PREP candidate for func_0201e4cc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     align4 len; ordered ldrh/bic/orr/strh bitfield inserts; :4 field dispatch to two calls
 *   risk:       permuter-class/struct-guessed: 3 consecutive f14/f18 insert RMWs must keep exact ldrh;bic;mov-lsl;orr-lsr;strh shape and store-order; mwcc may CSE the f14 reload between inserts or reorder — the (x<<28)>>16 style insert constants are inferred from masks.
 *   confidence: low
 */
/* func_0201e4cc (main, class D) — copy/align a length, conditionally insert
 * several bitfields into dst (r7) from src (r6) in exact store-order, then
 * dispatch on a 4-bit field of dst[0x14] to one of two overlay calls. r4 =
 * align4(src->fc + 3). Bitfield inserts (RMW halfword/word) must keep asm
 * order: f12 <- func_020b3a7c; f14 bits12.. <- src f9; f14 bits5..6 <- src f8;
 * f18 bits17..23 <- src u16[0x18]. */
extern int  func_0208fd30(char *p, int a, int b);
extern int  func_0208fd90(char *p, int a, int b);
extern void func_02092904(char *p);
extern unsigned short func_020b3a7c(int a, int b);

int func_0201e4cc(char *dst, char *src) {
    int len = *(int *)(src + 0xc);
    int a4  = (len + 3) & ~3;
    char *body = src + 0x20;
    if (len != 0) {
        unsigned short h;
        *(char **)(dst + 0x4) = body;
        *(unsigned short *)(dst + 0x12) =
            func_020b3a7c(*(unsigned char *)(src + 0xa), *(int *)(src + 0xc));
        h = *(unsigned short *)(dst + 0x14);
        h = (h & ~0xf000) | (((unsigned int)*(unsigned char *)(src + 0x9) << 0x1c) >> 0x10);
        *(unsigned short *)(dst + 0x14) = h;
        h = *(unsigned short *)(dst + 0x14);
        h = (h & ~0x60) | (((unsigned int)*(unsigned char *)(src + 0x8) << 0x1e) >> 0x19);
        *(unsigned short *)(dst + 0x14) = h;
        {
            int w = *(int *)(dst + 0x18);
            w = (w & ~0xfe0000) | (((unsigned int)*(unsigned short *)(src + 0x18) << 0x19) >> 0x8);
            *(int *)(dst + 0x18) = w;
        }
    }
    if (*(int *)(dst + 0xc) != -1 && *(int *)(src + 0x1c) != 0) {
        int sel;
        func_02092904(body + a4);
        sel = ((unsigned int)(*(unsigned short *)(dst + 0x14)) << 0x1c) >> 0x1c;
        if (sel == 0x4)
            func_0208fd90(body + a4, *(int *)(dst + 0xc), *(int *)(src + 0x1c));
        else if (sel == 0x9)
            func_0208fd30(body + a4, *(int *)(dst + 0xc), *(int *)(src + 0x1c));
    }
    return 0;
}
