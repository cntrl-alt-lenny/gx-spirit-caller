/* CAMPAIGN-PREP candidate for func_0202111c (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch returning const + dual global reference
 *   risk:       switch may emit a jump-table instead of the cmp #0/#1/#2 chain; case-2 empty arm may be pruned
 *   confidence: med
 */
/* func_0202111c: dispatch on *(int*)data_02194340 (offset 0);
 * case 1 invokes func_020216c8(data_02194340). cases 0/2 empty.
 * Two pool words = global materialized twice (deref for the switch
 * value + pointer passed as the call arg), mirroring the
 * func_0202162c / func_020215ec dual-reference codegen. */
extern char data_02194340[];
extern int func_020216c8(char *p);

int func_0202111c(void) {
    switch (*(int *)data_02194340) {
    case 0:
        break;
    case 1:
        func_020216c8(data_02194340);
        break;
    case 2:
        break;
    }
    return 1;
}
