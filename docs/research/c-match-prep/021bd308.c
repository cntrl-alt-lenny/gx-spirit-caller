/* CAMPAIGN-PREP candidate for func_021bd308 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     leaf bx-lr (no push); mla-base; id@+0x94 cap@+0x64; addeq count; i=5..10
 *   risk:       loop counter starts at r2=5 cmp<0xa (i in 5..10) with two ptr inductions (+0x94,+0x64); mwcc must keep idp/rec in r3/ip and count in r0 with no frame. likely the two-base induction or addeq-count predication diverges. reshape-able (decl order count after ptrs).
 *   confidence: low
 */
/* func_ov002_021bd308: leaf. scan slots 5..10 (i=5; i<10) of player (arg0&1) at
 * record offset +0x64 (id) / row +0x94? counts slots whose id!=0 and cap==0.
 * two parallel ptrs: id at base+0x94, cap-record at base+0x64. */
extern unsigned char data_ov002_022cf16c[];
struct slot { unsigned int id : 13; };

int func_ov002_021bd308(int arg0) {
    unsigned char *base = data_ov002_022cf16c + (arg0 & 1) * 0x868;
    unsigned char *idp = base + 0x94;
    unsigned char *rec = base + 0x64;
    int count = 0;
    int i;
    for (i = 5; i < 10; i++) {
        if (((struct slot *)idp)->id != 0) {
            if (*(unsigned short *)(rec + 0x38) == 0)
                count++;
        }
        idp += 20;
        rec += 20;
    }
    return count;
}
