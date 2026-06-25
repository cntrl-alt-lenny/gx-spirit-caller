/* CAMPAIGN-PREP candidate for func_02062118 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     field-zero guard + sub-first unsigned bls + guarded tail call
 *   risk:       empty sub sp,#4 frame and double fall-through-to-return-1 must reproduce; f90/f94 offsets guessed
 *   confidence: med
 */
/* func_02062118: if p->f90 == 0 return 1; else if (x - p->f94) <= 0x64
 * unsigned return 1; else call func_020629b8(p), return 0 only if it
 * returns 0, otherwise 1.
 */

typedef struct {
    char _pad[0x90];
    int f90;
    int f94;
} Obj_02062118;

extern int func_020629b8(Obj_02062118 *);

int func_02062118(Obj_02062118 *p, unsigned int x) {
    if (p->f90 == 0) return 1;
    if (x - p->f94 <= 0x64u) return 1;
    if (func_020629b8(p) == 0) return 0;
    return 1;
}
