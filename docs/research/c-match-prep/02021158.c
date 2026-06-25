/* CAMPAIGN-PREP candidate for func_02021158 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch, shared case body (cmpne fusion)
 *   risk:       case-0 empty arm may be dropped (losing the leading cmp #0); 1||2 might not fuse to cmpne
 *   confidence: med
 */
/* func_02021158: dispatch on *(int*)data_02194340 (offset 0);
 * cases 1 and 2 share a body calling func_02021934(data_02194340),
 * case 0 is empty. mwcc fuses 1||2 into `cmp #1; cmpne #2; bne`.
 * Two pool words = global referenced as deref + pointer arg. */
extern char data_02194340[];
extern int func_02021934(char *p);

int func_02021158(void) {
    switch (*(int *)data_02194340) {
    case 0:
        break;
    case 1:
    case 2:
        func_02021934(data_02194340);
        break;
    }
    return 1;
}
