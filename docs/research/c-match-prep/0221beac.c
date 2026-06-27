/* CAMPAIGN-PREP candidate for func_0221beac (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: player==owner&&arg1==0xb guard; mla cf16c base +arg2*4 +0x120 :13 field; switch on (f6>>8)&ff; cmp-to-bool arms; return 0x800/0
 *   risk:       permuter-class: the three arms set r2(bool) via mixed movne/moveq before a shared cmp r2,#0;movne r0,#0x800 join; mwcc may inline each return rather than funnel through .L_e4, flipping cond-exec vs branch layout. 0202e234 reload of ce288[0x48c] in case2 must re-read (not bind).
 *   confidence: low
 */
/* func_ov002_0221beac (ov002, class D, MED) — UNVERIFIED build-free draft.
 * guard player==owner && arg1==0xb; read :13 id from cf16c cell (+arg2*4+0x120);
 * switch on (state->f6>>8)&0xff over 0202e234/021ca440; return 0x800 if flagged.
 */
typedef unsigned short u16;
typedef unsigned int   u32;

struct State { u16 f0; u16 owner : 1; u16 _r2 : 15; u16 f4; u16 f6; u16 _f8; u16 fa; };

extern unsigned char data_ov002_022ce288[];   /* +0x48c -> struct State* */
extern unsigned char data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern int func_ov002_021ca440(int player, int id);

int func_ov002_0221beac(int player, int arg1, int arg2)
{
    struct State *st = *(struct State **)(data_ov002_022ce288 + 0x48c);
    int r2;
    if (!(player == st->owner && arg1 == 0xb))
        return 0;
    {
        u32 cellw = *(u32 *)(data_ov002_022cf16c + (player & 1) * 0x868
                             + arg2 * 4 + 0x120);
        int id  = (int)((cellw << 0x13) >> 0x13);
        int sel = ((u32)(st->f6 << 0x10)) >> 0x18;
        if (sel == 0) {
            if (func_0202e234(id) != 0 && func_ov002_021ca440(player, id) != 0)
                r2 = 1;
            else
                r2 = 0;
        } else if (sel == 1) {
            r2 = (func_0202e234(id) == 0) ? 1 : 0;
        } else if (sel == 2) {
            if (func_0202e234(id) != 0) {
                r2 = 0;
            } else {
                struct State *st2 = *(struct State **)(data_ov002_022ce288 + 0x48c);
                r2 = (arg2 != st2->fa) ? 1 : 0;
            }
        } else {
            r2 = 0;
        }
    }
    if (r2 != 0)
        return 0x800;
    return 0;
}
