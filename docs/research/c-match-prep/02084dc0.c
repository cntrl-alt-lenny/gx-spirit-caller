/* CAMPAIGN-PREP candidate for func_02084dc0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     cached &obj->f8 for RMW-clear; obj-relative reload for exit test; blx via table
 *   risk:       permuter-class: orig holds &obj->f8 in r4 for the clear but reloads [r5,#8] for the exit test - splitting one field across two regs is a reg-alloc coin-flip a C reshape won't reliably force.
 *   confidence: low
 */
/* func_02084dc0: dispatch loop. obj->f8 RMW clears 0x40 each iter (via cached
 * &obj->f8 in r4); tag = **(u8**)obj; low 5 bits index handler table
 * data_021022e0; handler(obj, tag & 0xe0). Loop exits when obj->f8 & 0x20
 * (this test reloads obj->f8 via obj+8). */

typedef void (*Handler_02084dc0)(void *obj, int hi);
extern Handler_02084dc0 data_021022e0[];

void func_02084dc0(unsigned char *obj)
{
    int *flag = (int *)(obj + 8);
    do {
        unsigned char tag;
        *flag &= ~0x40;
        tag = **(unsigned char **)obj;
        data_021022e0[tag & 0x1f](obj, tag & 0xe0);
    } while ((*(int *)(obj + 8) & 0x20) == 0);
}
