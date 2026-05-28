/* func_0202bae4: clamp pattern `n = h() - a; if (n <= 0) n = 0; h2(self, n);`.
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r4, r1
 *     mov   r5, r0
 *     bl    helper1
 *     sub   r1, r0, r4
 *     cmp   r1, #0
 *     movle r1, #0
 *     mov   r0, r5
 *     bl    helper2
 *     pop   {r3, r4, r5, pc}
 *
 * Brief 241 C-42 sub-shape (clamp). Key recipe gotcha: mwcc lowers
 * `n <= 0 → movle` (with separate sub + cmp) but `n < 0 → subs +
 * movmi` (combined subs setting flags). Match orig's `<=` form to
 * get sub+cmp+movle.
 */

extern int func_0202b9ec(void);
extern void func_0202ba38(int self, int n);

void func_0202bae4(int self, int arg) {
    int r = func_0202b9ec() - arg;
    if (r <= 0) r = 0;
    func_0202ba38(self, r);
}
