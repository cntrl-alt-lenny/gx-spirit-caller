/* CAMPAIGN-PREP candidate for func_0222f348 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: addls-pc switch on state-0x7d; rsb 1-parity; case0->case1 fallthrough no break
 *   risk:       reshape-able->permuter-class: the addls pc,pc jump-table needs a dense switch(state-0x7d) with case0 falling into case1 (no break) and the unsigned>3 default; mwcc may emit cmp-chain instead of the table -> escape risk. v5b0/state offsets struct-guessed.
 *   confidence: low
 */
/* func_ov002_0222f348 (ov002, D) state branch-table (state-0x7d in 0..3) via
 * addls pc,pc,r1,lsl#2. Entity *e in r0; e->f2(+2) halfword. inv=1-(f2&1) (rsb r4).
 * state0(0x7d): clear g[0x5b0]; fallthrough to state1(0x7e): parity=(inv&1) base off
 * data_022cf16c stride 0x868; word table at +0x120; if entry!=0 compare a packed
 * field (entry<<18>>31 = bit13) to inv, set g[0x5b0]=1 if differ, then 021d71e0(inv,0)
 * ->return 0x7f; else return 0x7e. state2(0x7f): 021e286c(inv); if g[0x5b0] call
 * 021e286c(1-inv); return 0x7d. state3(0x80): 021e104c(inv,2); return 0.
 * NOTE C 'case' fallthrough state0->state1 mirrors the b .L_44 with no break. */
typedef struct { unsigned short f0; unsigned short f2; } Ent;
struct GState { char pad[0x5a8]; int state; char pad2[4]; int v5b0; };
extern struct GState data_ov002_022ce288;
extern unsigned char data_ov002_022cf16c[];
extern int *data_ov002_022cf178;
extern void func_ov002_021d71e0(int inv,int b);
extern void func_ov002_021e104c(int inv,int b);
extern void func_ov002_021e286c(int inv);
int func_ov002_0222f348(Ent *e) {
    unsigned short f2 = e->f2;
    int parity = (f2 << 31) >> 31;
    int inv = 1 - parity;
    int sel = data_ov002_022ce288.state - 0x7d;
    if ((unsigned)sel > 3) return 0;
    switch (sel) {
    case 0:
        data_ov002_022ce288.v5b0 = 0;
    case 1: {
        unsigned poff = (inv & 1) * 0x868;
        int *cnt = (int *)((char *)&data_ov002_022cf178 + poff);
        if (*cnt == 0) return 0x7e;
        {
            unsigned w = *(unsigned *)(data_ov002_022cf16c + poff + 0x120);
            if (inv != (int)((w << 18) >> 31))
                data_ov002_022ce288.v5b0 = 1;
            func_ov002_021d71e0(inv, 0);
            return 0x7f;
        }
    }
    case 2:
        func_ov002_021e286c(inv);
        if (data_ov002_022ce288.v5b0 != 0)
            func_ov002_021e286c(1 - inv);
        return 0x7d;
    default:
        func_ov002_021e104c(inv, 2);
        return 0;
    }
}
