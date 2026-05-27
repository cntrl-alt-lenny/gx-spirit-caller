/* func_ov002_0220b720: C-42 — fn-ptr arg + bool >= 2.
 *
 *   ldr r1, [pc, #N]; bl helper(self, fn); cmp r0, #2; movge #1; movlt #0; pop
 */

extern int func_ov002_02257878(void *self, void *fn);
extern void func_ov002_021e9ac4(void);

int func_ov002_0220b720(void *self) {
    return func_ov002_02257878(self, (void *)func_ov002_021e9ac4) >= 2;
}
