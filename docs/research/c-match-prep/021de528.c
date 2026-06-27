/* CAMPAIGN-PREP candidate for func_021de528 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: Slot.id bitfield (lsl#19;lsr#19); mask=1<<(idx+player*16); b=cond?0xc:0xd if-assign; bind a0(r5) across call
 *   risk:       reshape-able: orig folds +0x30 into the ldr (mla idx*0x14; ldr [,#0x30]) while my (Slot*)(base+0x30)[idx] may emit add#0x30 then ldr [,idx*0x14] — an addressing-mode split. Reshape via row-header struct if it diverges.
 *   confidence: med
 */
typedef unsigned short u16;

extern char data_ov002_022cf16c[];

struct Slot {
    unsigned id  : 13;   /* bits 0-12 (lsl#19;lsr#19) */
    unsigned lsb : 1;
    unsigned     : 8;
    unsigned hi  : 8;
    unsigned char pad[16];
};

extern int func_0202e2c8(int id);
extern int func_ov002_021de134(int a0, int mask, int b, int c);

int func_ov002_021de528(int a0, int player, int idx)
{
    struct Slot *s;
    int id;
    int mask;
    int b;
    int r;

    s    = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30);
    id   = s[idx].id;
    mask = 1 << (idx + player * 16);

    if (func_0202e2c8(id))
        b = 0xc;
    else
        b = 0xd;

    r = func_ov002_021de134(a0, mask, b, 2);
    return r ? 1 : 0;
}
