/* CAMPAIGN-PREP candidate for func_020989a8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     DECL-ORDER digest(sp+4) before work(sp+0x18); byte-stride compare loop; BIND a0 in r4
 *   risk:       struct-guessed: gKey/gLen meaning and func_02094688 arg-direction inferred; the equal-return uses cmp r3,#0x14 sentinel after the loop — mwcc may emit `i==0x14?1:0` differently. struct-guessed.
 *   confidence: low
 */
/* func_020989a8 (main, class C) — build a 5-word digest on the stack, then
 * memcmp it against the caller's 5-word buffer; return 1 iff equal.
 *   buf[0x4..0x18) : zeroed (memset 0x14)
 *   work@0x18      : f_02094688(*gKey, &work, *gLen)   (key expand into work)
 *   digest@0x4     : f_020992d8(&digest, a1, a2, &work, *gLen)  (5th arg stacked)
 *   loop           : compare digest[i] vs a0[i] for i in 0..0x14 step 4
 * gKey=data_021024bc, gLen=data_021024c0 (both int cells holding a ptr/len).
 * a0=r0 (held in r4 across all calls), a1=r1->r6, a2=r2->r5. */

extern int  data_021024bc;   /* key ptr */
extern int  data_021024c0;   /* len */
extern void func_02094688(void *dst, const void *src, int n);
extern void func_020945f4(void *dst, int val, int n);
extern void func_020992d8(void *out, int a1, int a2, void *work, int len);

int func_020989a8(const int *expect, int a1, int a2) {
    int digest[5];   /* sp+0x4  */
    char work[0x44]; /* sp+0x18 */
    int i;
    func_020945f4(digest, 0, 0x14);
    func_02094688((void *)data_021024bc, work, data_021024c0);
    func_020992d8(digest, a1, a2, work, data_021024c0);
    for (i = 0; i < 0x14; i += 4) {
        if (*(int *)((char *)digest + i) != *(int *)((char *)expect + i))
            return 0;
    }
    return 1;
}
