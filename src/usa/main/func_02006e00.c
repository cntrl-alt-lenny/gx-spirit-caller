/* func_02006e00: minimal pass-through thunk to Task_InvokeLocked.
 *
 * Cascade target #18 (12 transitive callees, depth 3) — one of the
 * most-called thunks in main. Worth rewriting as C specifically
 * because PR #217 proved that mwcc-from-C avoids the mwasm pool-reloc
 * bug that would bite an equivalent `.s` file.
 */

extern void Task_InvokeLocked(void *p);

void func_02006e00(void *p) {
    Task_InvokeLocked(p);
}
