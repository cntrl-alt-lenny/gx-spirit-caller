/* CAMPAIGN-PREP candidate for func_021aab7c (ov021, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order self-first; counter cascade as nested if; -[0x50]<<16 mask into window reg; both arms set r0/r1, r2 differs
 *   risk:       permuter-class + truncated: asm cut off mid-divmod (after second smull on _LIT3) so the /K tail and its r6/lr placement are reconstructed, not derived. data_02104bac AND-mask store-order and the window-reg target (_LIT1) are struct-guessed. Confirm full .s before building.
 *   confidence: low
 */
/* func_ov021_021aab7c: per-frame counter cascade on the controller struct r5,
 * then a hardware-window write and a (truncated) divmod tail. r4 = parity flag
 * from func_0202224c. NOTE: asm truncated mid-divmod after _LIT3 smull; the
 * .L_e4 window write is complete, the trailing /K block is reconstructed. */
extern unsigned char data_02104bac[];
extern volatile int data_ov021_021ac874;
extern void func_0200617c(int a);
extern int  func_02022234(int a);
extern int  func_0202224c(int a);
extern void func_ov021_021aae68(void *self, int a, int b);

void func_ov021_021aab7c(int *self) {
    int r4 = func_0202224c(0);
    self[0x5c / 4] += 1;
    if (r4 & 1)
        self[0x60 / 4] += 1;
    if (self[0x5c / 4] >= 0x69 && self[0x60 / 4] < 0xe0) {
        self[0x54 / 4] += 1;
        if (self[0x54 / 4] >= 2) {
            self[0x54 / 4] = 0;
            self[0x50 / 4] -= 1;
            if (self[0x50 / 4] < 0)
                self[0x50 / 4] = 0xff;
            self[0x58 / 4] += 1;
            if (self[0x58 / 4] >= 0x10) {
                self[0x58 / 4] = 0;
                if (self[0x48 / 4] >= self[0x44 / 4]) {
                    func_ov021_021aae68(self, self[0x4c / 4], -1);
                    r4 |= 1;
                } else {
                    func_ov021_021aae68(self, self[0x4c / 4], self[0x48 / 4]);
                }
                self[0x4c / 4] += 1;
                if (self[0x4c / 4] >= 0x10)
                    self[0x4c / 4] = 0;
                self[0x48 / 4] += 1;
            }
        }
    }
    {
        int v = -self[0x50 / 4];
        *(int *)data_02104bac = (*(int *)data_02104bac & (v << 16)) | 0x1f8;
    }
    /* truncated tail: if(self[0x5c]>=LIT2){ t=self[0x5c]+(LIT2-0x30c);
     * divmod by magic _LIT3 (0x... ) into lr,r6 ... } */
}
