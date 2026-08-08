/* func_02077094: scan for '.' or NUL, return the offset.
 *
 *     mov r2, r0
 *     b .L_c
 * .L_8:
 *     add r0, r0, #0x1
 * .L_c:
 *     ldrsb r1, [r0]
 *     cmp r1, #0x2e
 *     beq .L_20
 *     cmp r1, #0x0
 *     bne .L_8
 * .L_20:
 *     sub r0, r0, r2
 *     bx lr
 *
 * Leaf, no stack frame -- .legacy.c per C-71 (every Pool A leaf this
 * round needed it; trying it first here rather than plain tier).
 *
 * Register-alloc note: the incoming parameter register must be the
 * one that gets MUTATED by the loop (`str++`), with a fresh local
 * holding the saved original for the final subtraction -- writing
 * it the other way around (`char *p = str;` mutate `p`, subtract
 * from untouched `str`) is the same math but lands the moving
 * pointer in r2 instead of r0, swapping both operands of the final
 * `sub` throughout.
 */

int func_02077094(char *str) {
    char *orig = str;
    while (*str != '.' && *str != 0) {
        str++;
    }
    return str - orig;
}
