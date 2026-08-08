/* func_0207da48: guard + conditional field sync, returns a pointer delta.
 *
 *     add r3, r0, #0x24
 *     ldr r2, [r0, #0x1c]
 *     ldr r1, [r3, #0x4]
 *     subs r1, r2, r1
 *     movne r0, #0x0
 *     bxne lr
 *     ldr r1, [r3]
 *     str r1, [r0, #0x1c]
 *     ldr r1, [r0, #0x1c]
 *     str r1, [r3, #0x4]
 *     ldr r1, [r0, #0x1c]
 *     sub r0, r1, r0
 *     bx lr
 *
 * Leaf, no stack frame -- routed .legacy.c per C-71 (this round's
 * canary + func_0207d37c/func_0208c9d4 all needed it too). The guard
 * must be an explicit subtraction tested against 0 (`subs`), not a
 * plain `!=` (which folds to a result-discarding `cmp`) -- otherwise
 * everything else here matched on the first structural draft (a
 * substruct pointer materialized once for the two self+0x24-relative
 * fields, self+0x1c accessed inline via casts rather than its own
 * pointer variable so the compiler doesn't materialize an address
 * for a single-offset field).
 */

struct s_0207da48_sub {
    int f24;
    int f28;
};

int func_0207da48(char *self) {
    struct s_0207da48_sub *sub = (struct s_0207da48_sub *)(self + 0x24);

    if ((*(int *)(self + 0x1c) - sub->f28) != 0) {
        return 0;
    }
    *(int *)(self + 0x1c) = sub->f24;
    sub->f28 = *(int *)(self + 0x1c);
    return *(int *)(self + 0x1c) - (int)self;
}
