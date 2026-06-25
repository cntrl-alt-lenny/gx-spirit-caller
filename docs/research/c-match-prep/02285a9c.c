/* CAMPAIGN-PREP candidate for func_02285a9c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     byte-unpack asr#8/and#ff; RMW (x&~0x2000)|(b&bit); store-order a2/a4/a8 preserved
 *   risk:       struct-guessed + permuter-class: the tail compare cascade (sl vs r6+0xb20/0xe20, r4+0x1640) and which base reg (r2=index) the addhi/ldmlt early-exit folds into are reconstructed from raw addressing; the `0x2000>>0x13` mask is literal-derived, easy to misfold to a plain `&1`.
 *   confidence: low
 */
/* func_ov002_02285a9c (ov002, class D) — loop, byte-unpack, mla addr, tail RMW stores.
 * For each of n packed u16 entries: low byte = player-ish lo, high byte = hi index;
 * accumulate worker results, and seed a stride-0x14 cell. Then a guard, a :13-field RMW
 * into the entity word at +0x40, two halfword stores, and a conditional doubled count. */
typedef unsigned short u16;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a8[];
extern int  func_ov002_021bc6c4(int a);
extern int  func_ov002_021c848c(int lo, int hi);
extern void func_ov002_0229cd5c(void *cell, int twenty);

int func_ov002_02285a9c(int a, int b, int c, int n, u16 *entries) {
    int total = 0;
    int i;
    int r;
    char *fp;
    char *cell;
    for (i = 0; i < n; i++) {
        u16 e  = entries[i];
        int lo = e & 0xff;
        int hi = (e >> 8) & 0xff;
        int w  = func_ov002_021c848c(lo, hi);
        char *row = data_ov002_022cf16c + (lo & 1) * 0x868 + 0x30;
        total += w;
        func_ov002_0229cd5c(row + hi * 0x14, 0x14);
    }
    r = func_ov002_021bc6c4(a);
    if (r < 0) return r;
    fp   = data_ov002_022cf16c + (a & 1) * 0x868;
    cell = fp + 0x30 + r * 0x14;
    *(int *)cell = (*(int *)cell & ~0x2000) | (b & (0x2000 >> 0x13));
    *(u16 *)(data_ov002_022cf1a2 + (a & 1) * 0x868 + r * 0x14) = 1;
    *(u16 *)(data_ov002_022cf1a4 + (a & 1) * 0x868 + r * 0x14) = c;
    if (b == 0x14 + 0x1640 || b != 0xb20 + (a & 1) * 0x868) {
        if (b != 0xe20 + (a & 1) * 0x868) return r;
    } else {
        total <<= 1;
    }
    *(int *)(data_ov002_022cf1a8 + (a & 1) * 0x868 + r * 0x14) = total;
    return r;
}
