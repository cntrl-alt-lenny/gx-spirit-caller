/* func_ov002_021bc68c: counting loop, 5 iterations.
 *
 *     push  {r4, r5, r6, lr}
 *     mov   r5, #0          ; count = 0
 *     mov   r6, r0          ; self saved
 *     mov   r4, r5          ; i = 0 (from r5)
 *   loop:
 *     mov   r0, r6
 *     mov   r1, r4
 *     bl    helper(self, i)
 *     cmp   r0, #0
 *     add   r4, #1          ; i++
 *     addne r5, #1          ; count++ if helper returned non-zero
 *     cmp   r4, #5
 *     blt   loop
 *     mov   r0, r5          ; return count
 *     pop
 *
 * Brief 244 pattern 9 (loop counter/index reg-alloc). NEW recipe
 * gotcha 11: declare loop variable BEFORE counter — the variable
 * declared FIRST gets the lower-index callee-save register (r4).
 * Since `i` is the loop var (compared, passed to helper), it needs
 * r4 by convention; `count` is the accumulator that goes to r5.
 *
 * Wrong form (count first):  int count = 0; int i; for (i = 0; ...)
 *   → mwcc allocates count to r4 (wrong)
 * Right form (i first):      int i; int count = 0; for (i = 0; ...)
 *   → mwcc allocates i to r4 (matches orig)
 */
extern int func_ov002_021bc55c(int self, int i);

int func_ov002_021bc68c(int self) {
    int i;
    int count = 0;
    for (i = 0; i < 5; i++) {
        if (func_ov002_021bc55c(self, i)) count++;
    }
    return count;
}
