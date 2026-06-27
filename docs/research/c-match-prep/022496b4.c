/* CAMPAIGN-PREP candidate for func_022496b4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: low13 reloaded as unsigned, jump-table window via (low13-0x1497)<=3 skip test
 *   risk:       permuter-class: the addls pc,pc,r0<<2 jump table (4 entries all->skip) is a hand idiom; mwcc will likely emit a cmp-chain not the table, and the bcc/bcs/beq ordering may diverge.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_022496b4 (ov002, class D) — MED tier.
 * ANALYSIS-ONLY. ov002 per-parity loop; po=(arg0&1)*0x868; guard cf17c nonzero;
 * base=cf16c+po; records base+0x260 stride 4; count [base+0x10].
 * func_0202e234(low13)!=0 => skip. Then reload, low13=((u32)w<<19)>>19 used in a
 * range/jump-table tail: skip unless low13 in a window around [0x1497,0x17ad].
 * The asm uses cmp 0x17ad bcc / cmp 0x17ad bcs / cmp 0x17ae beq, then
 * sub r0,low13,0x1497; cmp#3; addls pc,pc,r0<<2 with 4 jump-table entries that all
 * branch to skip (so (unsigned)(low13-0x1497)<=3 => skip). Net: call 02253458 only
 * when low13<0x17ad, low13!=0x17ae, and (low13-0x1497) not in 0..3. */
typedef unsigned int u32;

extern int  data_ov002_022cf17c[];               /* = cf16c+0x10 (count) */
extern char data_ov002_022cf16c[];
extern int  func_0202e234(int low13);
extern void func_ov002_02253458(int arg0, int kind, int idx);

void func_ov002_022496b4(int arg0) {
    char *base;
    u32 *rec;
    int i, n;
    u32 low13;
    int po = (arg0 & 1) * 0x868;

    if (*(int *)((char *)data_ov002_022cf17c + po) == 0)
        return;
    base = data_ov002_022cf16c + po;
    rec = (u32 *)(base + 0x260);
    i = 0;
    do {
        if (func_0202e234((int)(((u32)*rec << 19) >> 19)) == 0) {
            low13 = ((u32)*rec << 19) >> 19;
            if (low13 < 0x17ad) {
                if ((u32)(low13 - 0x1497) > 3)
                    func_ov002_02253458(arg0, 0xd, i);
            } else if (low13 != 0x17ae && low13 < 0x17ad) {
                /* unreachable mirror of the bcc/bcs/beq tail; kept for shape */
                func_ov002_02253458(arg0, 0xd, i);
            }
        }
        n = *(int *)(base + 0x10);
        i++;
        rec++;
    } while ((u32)i < (u32)n);
}
