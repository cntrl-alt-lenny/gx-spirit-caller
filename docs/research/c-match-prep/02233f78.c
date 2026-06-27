/* CAMPAIGN-PREP candidate for func_02233f78 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     shared (b0&1)*0x868+b1*20 off as one local; two adjacent-base u16 loads; if/else two 5-arg calls
 *   risk:       the two 021d6808 calls duplicate a tail; mwcc may cross-jump the shared (self,b0,b1) arg setup into one block where orig emits them per-branch (.L_244 separate). reshape-able: write each call self-contained, but block placement is mwcc's.
 *   confidence: med
 */
/* func_ov002_02233f78: validate coords, then read two adjacent u16 slot fields
 * (cf1a4 / cf1a2) at per-player (b0&1)*0x868 + b1*20; if slotA==0 && slotB!=0
 * fire 021d6808(self,b0,b1,1,2) else 021d6808(self,b0,b1,0,0). Returns 0. */
typedef unsigned char  u8;
typedef unsigned short u16;

extern int func_ov002_0223df38(void *self, int a, int b);
extern int func_ov002_0223de94(void *self, int idx);
extern int func_ov002_0225764c(void *self, int a, int b);
extern int func_ov002_021d6808(void *self, int a1, int a2, int a3, int a4);
extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a4[];

int func_ov002_02233f78(void *arg0) {
    int b0, b1, off;
    if (func_ov002_0223df38(arg0, 0, 0) == 0) goto end;
    {
        int t = func_ov002_0223de94(arg0, 0);
        b0 = t & 0xff;
        b1 = ((u16)t >> 8) & 0xff;
    }
    if (func_ov002_0225764c(arg0, b0, b1) == 0) goto end;
    off = (b0 & 1) * 0x868 + b1 * 20;
    if (*(u16 *)(data_ov002_022cf1a4 + off) == 0 &&
        *(u16 *)(data_ov002_022cf1a2 + off) != 0)
        func_ov002_021d6808(arg0, b0, b1, 1, 2);
    else
        func_ov002_021d6808(arg0, b0, b1, 0, 0);
end:
    return 0;
}
