/* CAMPAIGN-PREP candidate for func_0203ee94 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Two-call guard chain returning constants; sub sp #4 stub frame
 *   risk:       mvn r1,#0x26 => compare against -0x27; constants 0xb/0x9 mapping; conditional-return epilogues
 *   confidence: high
 */
/* func_0203ee94: two-call guard returning status constants.
 *  if(func_0206df90()) return 0xb;
 *  r = func_0206e7b0();
 *  if(r==0 || r==-0x27) return 0x9;   (mvn r1,#0x26 == -0x27)
 *  return 0xb;
 */
extern int func_0206df90(void);
extern int func_0206e7b0(void);

int func_0203ee94(void) {
    int r;
    if (func_0206df90() != 0) return 0xb;
    r = func_0206e7b0();
    if (r == 0 || r == -0x27) return 0x9;
    return 0xb;
}
