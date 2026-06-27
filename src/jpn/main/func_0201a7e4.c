/* CAMPAIGN-PREP candidate for func_0201a7e4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Accessor + byte-extract eq/ne to bool (== 0)
 *   risk:       field-at-+8 offset and func_02018b8c ptr-return assumed; bool codegen should match movs/moveq.
 *   confidence: high
 */
/* func_0201a7e4: leaf predicate.
 *   GetSystemWork() (discarded); p = func_02018b8c(0x1b);
 *   x = *(int*)(p+8); take low byte ((x<<24)>>24, movs sets flags);
 *   eq -> 1, ne -> 0  ==>  return (u8)x == 0.
 */

typedef unsigned char u8;

extern char *GetSystemWork(void);
extern char *func_02018b8c(int id);

int func_0201a7e4(void) {
    char *p;
    GetSystemWork();
    p = func_02018b8c(0x1b);
    return (u8)*(int *)(p + 8) == 0;
}
