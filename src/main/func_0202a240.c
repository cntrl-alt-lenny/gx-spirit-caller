/* func_0202a240: guard+Task_InvokeLocked+clear, dual-pool alias, tail call.
 *
 * C-34 candidate (docs/research/codegen-walls.md): BOTH pool slots hold the
 * literal same symbol `data_0219a934` (verified against the .s: both
 * `.L_0202a274` and `.L_0202a278` are `.word data_0219a934`), and ALL THREE
 * accesses (guard test, use-as-arg, clear-store) read/write the SAME field
 * (offset +0x0) -- unlike the main-module siblings in this batch, there is
 * no second distinct struct field to hang a typed-member split on, so the
 * typed-struct-member lever (different field -> independent pool load)
 * does not apply here structurally.
 *
 * Instead this reuses the project's existing, currently-shipping C-27
 * alias recipe for this EXACT shape (guard/invoke/clear + tail call):
 * see src/usa/main/func_0202a1ec.c and src/usa/main/func_02023f98.c,
 * which use `volatile` pointer views through two DIFFERENT extern names
 * for the same address to force two independent pool words. The alias
 * symbol `data_0219a934_alias` already exists in config/eur/arm9/
 * symbols.txt (added for the USA/JPN ports of this same shape) -- no new
 * symbols.txt entries needed here, just wiring the EUR baseline to use it.
 */

extern void *data_0219a934;
extern void *data_0219a934_alias;   /* SAME address — see symbols.txt */
extern void Task_InvokeLocked(void *p);
extern void func_0202a998(void);

int func_0202a240(void) {
    void * volatile *test_p  = (void * volatile *)&data_0219a934;
    void * volatile *store_p = (void * volatile *)&data_0219a934_alias;
    if (*test_p != 0) {
        Task_InvokeLocked(*store_p);
        *store_p = 0;
    }
    func_0202a998();
    return 1;
}
