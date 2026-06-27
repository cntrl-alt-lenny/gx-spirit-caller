/* CAMPAIGN-PREP candidate for func_0229da84 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: store-order field copy; mul idx*0x14; signed /32 bitmap-word idiom; ~(1<<(cnt&31)) clear
 *   risk:       orig reloads [self+0xa4] thrice and recomputes cnt-1 each; mwcc may bind cnt once across the copy and the clear, dropping 2 ldr. reshape-able (re-read self->a4 separately each use)
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229da84 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. recipe: post-inc counter; field-by-field
 * signed struct copy (20B) at base + idx*0x14, exact store-order; clear bit
 * cnt in bitmap at +0xbc (cnt/32 word, ~(1<<(cnt&31))). struct guessed. */
extern void func_ov002_0229da1c(char *self, int idx);

void func_ov002_0229da84(char *self, char *src) {
    int cnt = *(int *)(self + 0xa4);
    *(int *)(self + 0xa4) = cnt + 1;
    func_ov002_0229da1c(self, cnt);

    {
        int now = *(int *)(self + 0xa4);
        int slot = ((now - 1) - *(int *)(self + 0xa8)) * 0x14;
        char *d = self + slot;
        *(signed char *)(d + 0x0) = *(signed char *)(src + 0x0);
        *(signed char *)(d + 0x1) = *(signed char *)(src + 0x1);
        *(signed char *)(d + 0x2) = *(signed char *)(src + 0x2);
        *(signed char *)(d + 0x3) = *(signed char *)(src + 0x3);
        *(short *)(d + 0x4) = *(short *)(src + 0x4);
        *(short *)(d + 0x6) = *(short *)(src + 0x6);
        *(short *)(d + 0x8) = *(short *)(src + 0x8);
        *(unsigned short *)(d + 0xa) = *(unsigned short *)(src + 0xa);
        *(int *)(d + 0xc) = *(int *)(src + 0xc);
        *(int *)(d + 0x10) = *(int *)(src + 0x10);
    }
    {
        int bit = *(int *)(self + 0xa4) - 1;
        *(int *)(self + 0xbc + (bit / 32) * 4) &= ~(1 << (bit & 0x1f));
    }
}
