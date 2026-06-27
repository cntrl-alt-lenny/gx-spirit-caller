/* CAMPAIGN-PREP candidate for func_021deac8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: Slot.lsb bit13 (lsl#18;lsr#31); c=(player==lsb)?0x40000:0 ternary (cmp+moveq/movne both); mask=1<<(idx+player*16)
 *   risk:       reshape-able: same +0x30 addressing-mode split as 021de528 (mla;ldr[,#0x30] vs add#0x30;ldr[,idx*0x14]). The cmp folds the bitfield (cmp player,word,lsr#0x1f) only if lsb stays a :1 bitfield. struct-guessed.
 *   confidence: med
 */
typedef unsigned short u16;

extern char data_ov002_022cf16c[];

struct Slot {
    unsigned id  : 13;
    unsigned lsb : 1;    /* bit 13 (lsl#18;lsr#31) */
    unsigned     : 8;
    unsigned hi  : 8;
    unsigned char pad[16];
};

extern int func_ov002_021de134(int a0, int mask, int b, int c);

int func_ov002_021deac8(int a0, int player, int idx)
{
    struct Slot *s;
    int mask;
    int c;
    int r;

    s    = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30);
    mask = 1 << (idx + player * 16);
    c    = (player == s[idx].lsb) ? 0x40000 : 0;

    r = func_ov002_021de134(a0, mask, 0xd, c);
    return (mask & r) ? 1 : 0;
}
