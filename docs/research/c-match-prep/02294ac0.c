/* CAMPAIGN-PREP candidate for func_02294ac0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind 022577dc result to r; reload turn/id after; if-assign cmp r<=ret
 *   risk:       orig binds 022577dc->r4 then cmp r4,r0 with movle/movgt; eval order of the <= operands must keep r first. id+turn reloaded post-call. reshape-able
 *   confidence: med
 */
typedef struct Entity {
    unsigned short id;
    unsigned short turn : 1;
} Entity;

extern int func_ov002_02280980(int flag);
extern int func_ov002_022577dc(Entity *e);
extern int func_ov002_022536e8(int flag, int id, int zero);

int func_ov002_02294ac0(Entity *e) {
    int r;

    if (func_ov002_02280980(e->turn) >= 0)
        return 0;
    r = func_ov002_022577dc(e);
    return r <= func_ov002_022536e8(e->turn, e->id, 0);
}
