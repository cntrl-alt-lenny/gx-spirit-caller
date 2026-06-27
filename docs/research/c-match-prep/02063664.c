/* CAMPAIGN-PREP candidate for func_02063664 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early-return guards in asm order; ordered byte stores; sub before tail call
 *   risk:       byte copy uses r2=pkt+4 base then [r2,#1..3] — if mwcc indexes off pkt directly the ldrb offsets shift by 4; reshape-able by using a `q=pkt+4` temp. permuter-class if reads reschedule.
 *   confidence: med
 */
/* func_02063664: guard checks (state!=0, len!=8, signature match), then
 * copy a 4-byte field out of the packet, compute a delta against the
 * current tick, hand it to func_020619b8 and return its bool. */

extern unsigned char data_02101534[];     /* 4-byte signature literal */
extern int func_02055330(void);            /* current tick             */
extern int func_020619b8(int self, int delta);
extern int func_020a7440(const void *a, const void *b, int n); /* memcmp */

typedef struct {
    char _pad0[0x34];
    int  state34;   /* +0x34 */
} Self;

int func_02063664(Self *self, unsigned char *pkt, int len)
{
    unsigned char buf[4];
    int sent;

    if (self->state34 == 0) return 1;
    if (len != 8)           return 1;
    if (func_020a7440(pkt, data_02101534, 4) != 0) return 1;

    buf[0] = pkt[4];
    buf[1] = pkt[5];
    buf[2] = pkt[6];
    buf[3] = pkt[7];

    sent = func_02055330();
    return func_020619b8((int)self, sent - *(int *)buf) != 0;
}
