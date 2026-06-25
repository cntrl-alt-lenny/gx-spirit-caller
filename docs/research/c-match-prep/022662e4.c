/* CAMPAIGN-PREP candidate for func_022662e4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla (a0&1)*0x868+0x30 base, step +0x14; movs :13 nonzero; r6=i,r4=a0,r5=const binds
 *   risk:       reshape-able: orig holds the const 0x151e in r5 and a0 in r4 across the whole loop (bound once), and steps r7 by +0x14 with `movs r0,...lsr#0x13;beq`. If mwcc reloads the literal or recomputes base+i*0x14 instead of stepping, ldr/add count diverges. mvn r0,#0 -> return -1.
 *   confidence: med
 */
// func_ov002_022662e4 — small mla-base scan loop, :13 bitfield test (register-reuse recipe)
extern unsigned char data_ov002_022cf16c[];
extern int func_ov002_021b4120(int a, int b, int c);

int func_ov002_022662e4(int a0)
{
    unsigned char *base;   /* r7 = data + (a0&1)*0x868 + 0x30, stepped +0x14 */
    int i;

    base = (unsigned char *)data_ov002_022cf16c + (a0 & 1) * 0x868 + 0x30;
    for (i = 0; i <= 4; i++) {
        unsigned v = ((unsigned)*(int *)base << 0x13) >> 0x13;   /* :13 test */
        if (v != 0) {
            if (func_ov002_021b4120(a0, i, 0x151e) == 1)
                return i;
        }
        base += 0x14;
    }
    return -1;
}
