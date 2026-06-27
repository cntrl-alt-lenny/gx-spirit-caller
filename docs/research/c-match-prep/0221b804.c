/* CAMPAIGN-PREP candidate for func_0221b804 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: switch(global-0x7d) via addls pc table; :1 owner bitfield; cf178/cf188 indexed by owner*0x868
 *   risk:       reshape-able: the addls pc,pc jump-table needs a dense switch on (state-0x7d) with case bodies in source order .L_bc/.L_78/.L_38/.L_2c; if mwcc emits cmp-ladder instead of pc-relative table the dispatch diverges. Const returns 0x7f/0x7e/0x7d/0 must follow each arm.
 *   confidence: med
 */
/* func_ov002_0221b804 (ov002, class D, MED) — UNVERIFIED build-free draft.
 * switch on (*(int*)(ce288+0x5a8) - 0x7d); per-state guard reads owner bit of
 * self->f2 and a cf178 int (indexed owner*0x868), conditionally calls helpers.
 */
typedef unsigned short u16;

struct CmdEvt { u16 f0; u16 owner : 1; u16 _r2 : 15; u16 f4; };

extern unsigned char data_ov002_022ce288[];   /* +0x5a8 int state */
extern unsigned char data_ov002_022cf178[];   /* +owner*0x868 int */
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);
extern int  func_ov002_0226ad5c(int a, int b, int c, int d);

int func_ov002_0221b804(struct CmdEvt *self)
{
    int state = *(int *)(data_ov002_022ce288 + 0x5a8) - 0x7d;
    switch (state) {
    case 0:
        func_ov002_021e2c5c();
        return 0;
    case 1: {
        int owner = self->owner;
        int rsb   = 1 - owner;
        if (*(int *)(data_ov002_022cf178 + rsb * 0x868) != 0)
            func_ov002_0226ad5c(rsb, 1, 0, 1);
        return 0x7d;
    }
    case 2: {
        int owner = self->owner;
        if (*(int *)(data_ov002_022cf178 + owner * 0x868) != 0)
            func_ov002_0226ad5c(owner, 1, 0, 0);
        return 0x7e;
    }
    case 3:
        func_ov002_021e2b3c();
        return 0x7f;
    default:
        return 0;
    }
}
