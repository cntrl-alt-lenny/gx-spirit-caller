/* CAMPAIGN-PREP candidate for func_02273ca4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: (u8)[0x18] :8 state switch + byte-field RMW (set 0xa/0xf); card :8@22+:1@13 bitfields; (f22<<1)+b13; unsigned <=1 (bls); bind word0 once
 *   risk:       orig loads [0x18] once and reuses the word for both the switch AND the 0xa/0xf RMW; my separate s->lo reads/writes may emit extra ldr. reshape-able (single bound load); struct-guessed on the card bit layout
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02273ca4 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. State machine on (u8)cd300[0x18]:
 *   state 0  : set the byte to 0xa, fall through to the common path.
 *   default  : common path -> func_02271ab4(); if !=1 return it; else set byte
 *              to 0xf and return 0.
 *   state 0xf: idx=(bit0)*0x868; if cf178[idx] <= 1 return 1; else read
 *              card = *(int*)(cf16c_row+0x120); lvl=((card>>22)&0xff)*2+bit13;
 *              func_021d7a1c(bit0, lvl==(word0>>23)); return 0.
 */
typedef unsigned int u32;

struct Hdr300 { u32 b0 : 1; u32 _u1 : 7; u32 f8 : 15; u32 hi9 : 9; };
struct St318  { u32 lo : 8; u32 _hi : 24; };                  /* cd300[0x18] low byte */
struct Card   { u32 id : 13; u32 b13 : 1; u32 _mid : 8; u32 f22 : 8; u32 _top : 2; };

extern char data_ov002_022cd300[];
extern int  data_ov002_022cf178[];   /* per-player count, stride 0x868 bytes */
extern char data_ov002_022cf16c[];   /* per-player rows, stride 0x868 bytes */
extern void func_ov002_021d7a1c(int player, int match);
extern int  func_ov002_02271ab4(void);

int func_ov002_02273ca4(void) {
    struct St318 *s = (struct St318 *)(data_ov002_022cd300 + 0x18);
    int st = s->lo;
    if (st == 0xf) {
        u32 w = *(u32 *)data_ov002_022cd300;
        int player = ((struct Hdr300 *)&w)->b0;
        int idx = (player & 1) * 0x868;
        if (*(unsigned int *)((char *)data_ov002_022cf178 + idx) <= 1)
            return 1;
        {
            struct Card *c = (struct Card *)(data_ov002_022cf16c + idx + 0x120);
            int lvl = c->f22 * 2 + c->b13;
            func_ov002_021d7a1c(player, lvl == (int)(w >> 0x17));
        }
        return 0;
    }
    if (st == 0)
        s->lo = 0xa;
    {
        int r = func_ov002_02271ab4();
        if (r != 1)
            return r;
    }
    s->lo = 0xf;
    return 0;
}
