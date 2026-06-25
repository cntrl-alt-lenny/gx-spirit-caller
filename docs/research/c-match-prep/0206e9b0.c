/* CAMPAIGN-PREP candidate for func_0206e9b0 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     NULL-guard; sparse switch; ldrsb accessor; if/else byte-write fallthrough
 *   risk:       switch may emit jump-table not cmp-chain; case-4 fallthrough vs default ordering could flip; +0x72 offset guessed
 *   confidence: med
 */
/* func_0206e9b0 (main, class B): NULL-guard -> small switch(sel) with
 * one branch reading a signed byte flag (+0x72) and another writing it.
 *
 *   cmp r0,#0; mvneq r0,#0; bxeq lr        -> if(!p) return -1;
 *   cmp r1,#3 -> case 3: ldrsb +0x72; ==1 ? 0 : 4
 *   cmp r1,#4 -> case 4: (flags&4) ? f=0 : f=1; fallthrough
 *   default/.L_48: return 0;
 *
 * Case 4 has no break: the str path falls into the shared `return 0`
 * tail (the .L_48 block). The `ands;movne 0;strneb;moveq 1;streqb`
 * pair is the if/else field-write, NOT a ternary.
 */

struct Obj0206e9b0 {
    char _pad[0x72];
    signed char f72;        /* +0x72, ldrsb/strb */
};

int func_0206e9b0(struct Obj0206e9b0 *p, int sel, int flags)
{
    if (p == 0)
        return -1;

    switch (sel) {
    case 3:
        if (p->f72 == 1)
            return 0;
        return 4;
    case 4:
        if (flags & 4)
            p->f72 = 0;
        else
            p->f72 = 1;
        /* fallthrough */
    }
    return 0;
}
