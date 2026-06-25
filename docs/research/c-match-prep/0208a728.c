/* CAMPAIGN-PREP candidate for func_0208a728 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD (zero-check) + field decrement + reload guard + tail call
 *   risk:       Asm RELOADS [r0,#0x120] after the store; mwcc may CSE the post-decrement value into the second compare (no reload) — would drop one ldr. Field at +0x120 guessed.
 *   confidence: med
 */
/* func_0208a728: refcount decrement with two guards (clean leaf).
 *
 *   r1 = p->ref @0x120;  if (r1 == 0) return
 *   r1--; p->ref = r1
 *   r1 = p->ref @0x120 (reloaded);  if (r1 != 0) return
 *   func_02088518()
 */

extern void func_02088518(void);

typedef struct {
    char _pad[0x120];
    int  ref;     /* +0x120 */
} obj_t;

void func_0208a728(obj_t *p) {
    if (p->ref == 0) return;
    p->ref--;
    if (p->ref != 0) return;
    func_02088518();
}
