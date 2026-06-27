/* CAMPAIGN-PREP candidate for func_02035ff4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     single hdr struct base shares +0x34/+0x8; reload cnt for >0 test; byte>>4 = asr
 *   risk:       VERIFIED byte-exact vs target (incl ldrsh reload after strh, movs asr#4, tail return-of-call). struct-guessed offsets only; no codegen divergence observed
 *   confidence: high
 */
/* func_02035ff4 (class D): obj at r0. id=(u16)obj[+0x34]; look up card-def
 * (stride 0xc) at hdr[+0x34], take byte+1 >> 4 (signed asr) -> if nonzero just
 * tail. else decrement signed counter hdr[+0x8] (RELOADED for the >0 test);
 * when <=0 reset to 0 and call func_02037c54(0,0x7f,8). Always tail
 * func_0203ab9c(obj[0]) and return its result.
 * Uses ONE hdr base so +0x34 and +0x8 share a register (matches orig r3). */

extern unsigned char data_0219b2e0[];
extern void func_02037c54(int a, int b, int c);
extern int  func_0203ab9c(int a);

struct CardDef { unsigned char b0; unsigned char b1; char _p[0xc - 2]; };

struct Hdr {
    char _p[8];
    short cnt;                  /* 0x08 : signed counter */
    char _q[0x34 - 0xa];
    unsigned char *defs;        /* 0x34 : card-def table base */
};

int func_02035ff4(unsigned char *obj) {
    struct Hdr *hd = (struct Hdr *)data_0219b2e0;
    int id;
    int hi;

    id = (unsigned short)*(int *)(obj + 0x34);
    hi = ((struct CardDef *)(hd->defs + id * 0xc))->b1 >> 4;
    if (hi == 0) {
        hd->cnt = hd->cnt - 1;
        if (hd->cnt <= 0) {
            hd->cnt = 0;
            func_02037c54(0, 0x7f, 8);
        }
    }
    return func_0203ab9c(*(int *)obj);
}
