/* CAMPAIGN-PREP candidate for func_0201a3ec (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Bind-base GetSystemWork + reload field, lsl/lsrs#31 bit-test guard, orr-set+store
 *   risk:       the empty-if/else to mirror beq fall-through may invert; mwcc could pick movs/lsr operand reg differently. Offset 0x8f8 from siblings.
 *   confidence: med
 */
/* func_0201a3ec: GetSystemWork held across two calls; if predicate true and
 * bit 9 of state[0x8f8] is clear, set bit 9 and notify.
 *   sys = GetSystemWork();           (bound in r4 across calls)
 *   func_020190c0();
 *   r = func_0201a3b8();
 *   if (r) {
 *       v = *(int*)(sys+0x8f8);
 *       if (((v << 0x16) >> 0x1f) == 0) {  // bit 9 clear
 *           *(int*)(sys+0x8f8) = v | 0x200;
 *           func_0200a26c(4);
 *       }
 *   }
 *   return r;
 */

extern char *GetSystemWork(void);
extern void  func_020190c0(void);
extern int   func_0201a3b8(void);
extern void  func_0200a26c(int);

int func_0201a3ec(void) {
    char *sys;
    int r;
    int v;
    sys = GetSystemWork();
    func_020190c0();
    r = func_0201a3b8();
    if (r != 0) {
        v = *(int *)(sys + 0x8f8);
        if ((unsigned int)((unsigned int)v << 0x16) >> 0x1f) {
        } else {
            *(int *)(sys + 0x8f8) = v | 0x200;
            func_0200a26c(4);
        }
    }
    return r;
}
