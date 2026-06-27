/* CAMPAIGN-PREP candidate for func_02280d18 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     per-player mla base + :13 bitfield; if-assign clamp/max; result on stack init -1
 *   risk:       out-buf is a guessed 0x2c local struct filled by aee0/af30; its sp offset must keep `add r2,sp,#8` and outbuf[5]/[6]=+0x14/+0x18. struct-guessed
 *   confidence: low
 */
/* func_ov002_02280d18 (ov002, cls C) — clone-variant lt-select.
 * Per-player row at cf16c+(wantPlayer&1)*0x868; scan 5 slots from +0x30
 * (stride 0x14), skip i==count and id==0; per-slot call aee0(own)/af30(other)
 * into a local out-buf; clamp out[+0x14]>=0 (flagA) and max with out[+0x18]
 * (flagB); keep the index of the smallest value (<0x1869f). id is :13. */
extern char data_ov002_022cf16c[];
extern void func_ov002_0227aee0(int player, int i, void *out);
extern void func_ov002_0227af30(int player, int i, void *out);

struct Ov002Slot { unsigned int id : 13; };

int func_ov002_02280d18(int self, int wantPlayer, int count, int flagA, int flagB) {
    char *base = data_ov002_022cf16c + (wantPlayer & 1) * 0x868 + 0x30;
    int best = 0x1869f;
    int result = -1;
    int i;
    int v;
    int outbuf[11];
    for (i = 0; i < 5; i++) {
        if (i == count)
            continue;
        if (((struct Ov002Slot *)(base + i * 0x14))->id == 0)
            continue;
        v = 0;
        if (self == wantPlayer)
            func_ov002_0227aee0(wantPlayer, i, outbuf);
        else
            func_ov002_0227af30(wantPlayer, i, outbuf);
        if (flagA != 0) {
            v = outbuf[5];
            if (v < 0)
                v = 0;
        }
        if (flagB != 0) {
            if (v <= outbuf[6])
                v = outbuf[6];
        }
        if (v < best) {
            result = i;
            best = v;
        }
    }
    return result;
}
