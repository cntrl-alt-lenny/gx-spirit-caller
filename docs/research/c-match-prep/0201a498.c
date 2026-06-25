/* CAMPAIGN-PREP candidate for func_0201a498 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Bind-base GetSystemWork + reload field, lsl/lsrs#31 bit-test guard, orr-set+store
 *   risk:       same as a3ec: empty-if/else fall-through may invert, lsr operand-reg choice may differ. Bit shift 0x15 -> bit 10, mask 0x400.
 *   confidence: med
 */
/* func_0201a498: sibling of a3ec. GetSystemWork bound across two calls; if
 * predicate true and bit 10 of state[0x8f8] is clear, set bit 10 and notify.
 *   sys = GetSystemWork();
 *   func_020190c0();
 *   r = func_0201a454();
 *   if (r) {
 *       v = *(int*)(sys+0x8f8);
 *       if (((v << 0x15) >> 0x1f) == 0) {  // bit 10 clear
 *           *(int*)(sys+0x8f8) = v | 0x400;
 *           func_0200a26c(5);
 *       }
 *   }
 *   return r;
 */

extern char *GetSystemWork(void);
extern void  func_020190c0(void);
extern int   func_0201a454(void);
extern void  func_0200a26c(int);

int func_0201a498(void) {
    char *sys;
    int r;
    int v;
    sys = GetSystemWork();
    func_020190c0();
    r = func_0201a454();
    if (r != 0) {
        v = *(int *)(sys + 0x8f8);
        if ((unsigned int)((unsigned int)v << 0x15) >> 0x1f) {
        } else {
            *(int *)(sys + 0x8f8) = v | 0x400;
            func_0200a26c(5);
        }
    }
    return r;
}
