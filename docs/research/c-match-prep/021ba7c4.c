/* CAMPAIGN-PREP candidate for func_021ba7c4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: count/2 as signed /2; reverse-swap loop; advancing ptr vs recomputed mirror
 *   risk:       half=(int)count/2 folds to add;asr#1 only if count read signed; mirror &list[count-1-i] is recomputed each iter while &list[i] is +4 induction -- if mwcc makes both inductions the inner add stream diverges. reshape-able. list@0x260 struct-guessed
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_021ba7c4 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * Drop into src/, run ninja + objdiff, apply the risk note below.
 *   recipe:   CLASS D: signed half = count/2 via (n + (u)n>>31)>>1 -> write `(int)count/2`; reverse loop swapping list[i] with list[count-1-i]; advancing r8=&list[i] (induction +4) vs recomputed r7+(count-1-i)*4 mirror; leq early-exit when half<=0.
 *   risk:     half = (int)count/2 should fold to `add r0,r1,r1,lsr#31; asr#1` (constant /2). Confirm count is read SIGNED (cf17c word@0); the mirror &list[count-1-i] is recomputed from r7 each iter while r0=&list[i] advances by 4 -- if mwcc strength-reduces the mirror to a second induction ptr, the inner add stream diverges. reshape-able (keep mirror as base+index). list@0x260 struct-guessed.
 *   confidence: low
 */
/* func_ov002_021ba7c4(team): reverse player(team&1)'s 0x260 list in place.
 * off=idx*0x868; count=cf17c[idx] (signed); half=count/2; for i in 0..half-1
 * swap(list[i], list[count-1-i]) via func_021b91d0. list base cf16c+off+0x260. */
typedef unsigned char u8;

extern u8  data_ov002_022cf16c[];
extern int data_ov002_022cf17c[];   /* +0x10 view; word@0 = count (signed) */
extern void func_ov002_021b91d0(int *a, int *b);

void func_ov002_021ba7c4(int team) {
    int idx = team & 1;
    int off = idx * 0x868;
    int count = *(int *)((u8 *)data_ov002_022cf17c + off);
    int half = count / 2;
    int i;
    if (half <= 0)
        return;
    {
        int *list = (int *)(data_ov002_022cf16c + off + 0x260);
        for (i = 0; i < half; i++)
            func_ov002_021b91d0(&list[i], &list[count - 1 - i]);
    }
}
