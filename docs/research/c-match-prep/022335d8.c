/* CAMPAIGN-PREP candidate for func_022335d8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     1-(attr&1) parity rsb; :13 node mask via lsl19/lsr19; reload attr per guard; inline mla store
 *   risk:       asm TRUNCATED (literal pool + final store block cut off) so the tail after the last guard is reconstructed; node :13 field and 0x260/cf17c offsets are struct-guessed. struct-guessed + incomplete.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_022335d8 (ov002, class D) - brief 494.
 * UNVERIFIED build-free, TAIL TRUNCATED in source asm (literal pool + final
 * store block cut off). side = 1-(attr&1); par=(side&1)*0x868.
 * gate0: if *(int*)(LIT1 + par)==0 skip body.
 *   021c988c(LIT2[par+0x260] -> (rec<<0x13>>0x13 = &0x1fff stored in r4), 0, 0xd)
 *   if ==0: 021e2818(side). then 021d87dc(side).
 *   guard chain: 0202e234(r4)&& 020305d8(r4)&& 021ca440(side,r4)&& 021bc618(side)
 *                && 021ca2b8(side) -> then store r2=1 to &(LIT2[par])+0x260 (truncated).
 * LIT0=0x868? LIT1/LIT2 are cf16c-family tables; r4 carries a node id. */
typedef unsigned short u16;

extern char data_ov002_022cf16c[];   /* LIT1 base, parity 0x868 stride        */
extern char data_ov002_022cf17c[];   /* LIT2 base (node table)                 */
extern int  func_0202e234(int);
extern int  func_020305d8(int);
extern int  func_ov002_021bc618(int);
extern int  func_ov002_021c988c(int, int, int);
extern int  func_ov002_021ca2b8(int);
extern int  func_ov002_021ca440(int, int);
extern int  func_ov002_021d87dc(int);
extern int  func_ov002_021e2818(int);

int func_ov002_022335d8(void *cardv) {
    u16 *base = (u16 *)cardv;
    u16 attr = base[1];
    int side = 1 - (attr & 1);
    int par  = (side & 1) * 0x868;
    int node;

    if (*(int *)(data_ov002_022cf16c + par) == 0)
        return 0;
    node = (*(int *)(data_ov002_022cf17c + par + 0x260) << 0x13) >> 0x13;
    if (func_ov002_021c988c(node, 0, 0xd) == 0) {
        attr = base[1];
        func_ov002_021e2818(1 - (attr & 1));
    }
    attr = base[1];
    func_ov002_021d87dc(1 - (attr & 1));
    if (func_0202e234(node) && func_020305d8(node)) {
        attr = base[1];
        if (func_ov002_021ca440(1 - (attr & 1), node)) {
            attr = base[1];
            if (func_ov002_021bc618(1 - (attr & 1))) {
                attr = base[1];
                if (func_ov002_021ca2b8(1 - (attr & 1))) {
                    attr = base[1];
                    *(int *)(data_ov002_022cf16c + (1 - (attr & 1) & 1) * 0x868 + 0x260) = 1;
                }
            }
        }
    }
    return 0;
}
