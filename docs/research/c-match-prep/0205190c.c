/* CAMPAIGN-PREP candidate for func_0205190c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early guards (return 1/3); lazy alloc into LIT0; reload LIT0 per store; 64-bit pair stores
 *   risk:       asm is TRUNCATED (mode==1 / default missing) so the TU is incomplete; also every field store RELOADS data_0219dc84 (ldr r0,[r1] each time) — must NOT cache rp in a reg or the ldr-per-store pattern diverges. reshape-able + struct-guessed.
 *   confidence: low
 */
// func_0205190c — guard chain + struct byte/word copy (class C)
// NOTE: source asm is TRUNCATED at .L_18fc (the r5==1 case body and the
// .L_1930 default are not present). Only the r5==0 path + guards are modeled.
// arg r0=mode held in r5, arg1=src held in r4. func_020498f0 returns a flag/
// ptr; data_0219dc84 (_LIT0) holds a lazily-allocated record pointer.

typedef struct Rec Rec;

extern int *data_0219dc84;       // _LIT0 slot holds Rec*
extern unsigned char data_0219dc8c[];
extern void *func_020454cc(int, int);    // allocator
extern int  func_020498f0(void);
extern long long func_020930b0(void);

struct Rec {
    unsigned char b0;
    unsigned char b1;
    unsigned char b2;
    unsigned char b3;
    int w4;
    int w8;
    int wc;
    int w10;
    int w14;
    int w18;
    int w1c;
};

int func_0205190c(int mode, unsigned char *src) {
    if (func_020498f0() == 0) return 1;
    if (src == 0) return 3;

    if (mode == 0) {
        Rec *rp;
        if (((int *)func_020498f0_state())->_1a0 == 0x13) return 1; /* see note */
        if (src[0] != 0) {
            if (src[1] <= 1) return 3;
        }
        rp = (Rec *)data_0219dc84;
        if (rp == 0) {
            rp = (Rec *)func_020454cc(4, 0x20);
            data_0219dc84 = (int *)rp;
            if (rp == 0) return 4;
        }
        rp->b0 = src[0];
        rp = (Rec *)data_0219dc84; rp->b1 = src[1];
        rp = (Rec *)data_0219dc84; rp->b2 = 0;
        rp = (Rec *)data_0219dc84; rp->b3 = 0;
        rp = (Rec *)data_0219dc84; rp->w4 = *(int *)(src + 4);
        rp = (Rec *)data_0219dc84; rp->w8 = 0;
        rp = (Rec *)data_0219dc84; rp->wc = 0;
        {
            long long v = func_020930b0();
            rp = (Rec *)data_0219dc84;
            rp->w10 = (int)v; rp->w14 = (int)(v >> 32);
        }
        {
            long long v = func_020930b0();
            rp = (Rec *)data_0219dc84;
            rp->w18 = (int)v; rp->w1c = (int)(v >> 32);
        }
        return 0;
    }
    /* mode==1 and default truncated in source asm */
    return 0;
}
