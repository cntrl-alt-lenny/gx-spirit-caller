/* func_ov002_021d7c1c: C-42 — pass-through with appended literals (14, 0, 0).
 *
 *   sub sp, #8; mov ip, #0; str ip, [sp]; mov r3, #14; str ip, [sp, #4]
 *   bl helper(arg0, arg1, arg2, 14, 0, 0)
 *   add sp, #8; pop
 */

extern void func_ov002_021d730c(void *a, void *b, void *c, int k, int z0, int z1);

void func_ov002_021d7c1c(void *a, void *b, void *c) {
    func_ov002_021d730c(a, b, c, 14, 0, 0);
}
