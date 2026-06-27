/* CAMPAIGN-PREP candidate for func_022965c0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard &&/||-chain; turn:1 reloaded per call; movgt/movle bool >1; e passed as int self
 *   risk:       orig reloads turn before each call and recomputes 1-turn (rsb) twice; if mwcc hoists 1-e->turn into one reg the two rsb collapse -> 1-insn diverge. reshape-able (keep 1-e->turn inline at each callsite)
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_ov002_022965c0 (ov002, class D-light, MED tier).
 * Recipe: guard chain. f021c3ae4(turn,0x198c)!=0 ->0; f02281760(e,1-turn,1)!=0 ->1; return f02257ab8(e,1-turn)>1.
 * f021c3ae4(player,code) sig from sibling 021b025c/021c3ae4; f02257ab8(a,b) from sibling 02257ab8.
 */
typedef struct Entity {
    unsigned short id;
    unsigned short turn : 1;
} Entity;

extern int func_ov002_021c3ae4(int player, int code);
extern int func_ov002_02281760(int e, int side, int one);
extern int func_ov002_02257ab8(int a, int b);

int func_ov002_022965c0(Entity *e) {
    if (func_ov002_021c3ae4(e->turn, 0x198c) != 0)
        return 0;
    if (func_ov002_02281760((int)e, 1 - e->turn, 1) != 0)
        return 1;
    return func_ov002_02257ab8((int)e, 1 - e->turn) > 1;
}
