/* CAMPAIGN-PREP candidate for func_020620d8 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     sub-first (B) + unsigned bls compare + guarded tail call
 *   risk:       empty sub sp,#4 frame and the fall-through-to-return-1 must reproduce; 0x7530 literal-pool vs immediate; f88 offset guessed
 *   confidence: med
 */
/* func_020620d8: if (x - p->f88) <= 0x7530 unsigned, return 1;
 * else call func_02062aec(p) and return 0 only if it returns 0.
 */

typedef struct {
    char _pad[0x88];
    unsigned int f88;
} Obj_020620d8;

extern int func_02062aec(Obj_020620d8 *);

int func_020620d8(Obj_020620d8 *p, unsigned int x) {
    if (x - p->f88 <= 0x7530u) return 1;
    if (func_02062aec(p) == 0) return 0;
    return 1;
}
