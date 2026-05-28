/* func_ov002_0227b090: pattern N4 — 2-helper if-else reg-alloc.
 *
 *     push  {r3, lr}
 *     ldr   r3, [pc, #24]
 *     ldr   r3, [r3]
 *     cmp   r3, r0
 *     bne   .L_else
 *     bl    helper1
 *     pop   {r3, pc}
 *   .L_else:
 *     bl    helper2
 *     pop   {r3, pc}
 *
 * Brief 248 pattern N4. Recipe: gotcha 7 with 3-arg pass-through
 * forces the pool temp from r1 → r3. Brief 247 noted "no obvious
 * source-side lever was tried" — but brief 246's lesson applies
 * directly: count target temp register, then pick arg count.
 * r3 target → 3 args (function + helpers).
 */
extern int data_ov002_022cd524;
extern void func_ov002_0227aee0(int arg, int a, int b);
extern void func_ov002_0227af30(int arg, int a, int b);

void func_ov002_0227b090(int arg, int a, int b) {
    if (data_ov002_022cd524 == arg) {
        func_ov002_0227aee0(arg, a, b);
    } else {
        func_ov002_0227af30(arg, a, b);
    }
}
