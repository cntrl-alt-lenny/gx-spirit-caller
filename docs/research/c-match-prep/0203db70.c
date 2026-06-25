/* CAMPAIGN-PREP candidate for func_0203db70 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dense range switch -> addls pc jump table; calls per case; tail return 0
 *   risk:       May collapse missing cases differently; case-11 vs case-12 body order (early-return) may still swap; -1 via mvn r0,#0; jump-table arm layout must match.
 *   confidence: med
 */
/* func_0203db70: dense 0..12 switch on func_0207b5f8() -> addls pc
 * jump table. case0->1; cases 1/3/6/9/12 run a call then return 0;
 * case11 calls func_0203c85c(0) and returns -1; all else return 0.
 * Case bodies written 0,1,3,6,9,12,11 to match the .text layout
 * (case-12 body precedes case-11's early-return body).
 */
extern int  func_0207b5f8(void);
extern void func_0207c20c(void);
extern void func_0207bec8(void);
extern void func_0207bc20(void);
extern void func_0207b888(void);
extern void func_0207b62c(void);
extern void func_0203c85c(int arg);

int func_0203db70(void)
{
    switch (func_0207b5f8()) {
    case 0:  return 1;
    case 1:  func_0207c20c(); break;
    case 3:  func_0207bec8(); break;
    case 6:  func_0207bc20(); break;
    case 9:  func_0207b888(); break;
    case 12: func_0207b62c(); break;
    case 11: func_0203c85c(0); return -1;
    }
    return 0;
}
