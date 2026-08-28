/* func_02095b24: zero-init an 8-element array of 12-byte structs.
 *
 *     ldr r1, _LIT0             ; r1 = &data_021a8140
 *     mov r2, #0x0
 *     mov r0, r2
 * .L_c:
 *     str r0, [r1]
 *     str r0, [r1, #0x4]
 *     add r2, r2, #0x1
 *     strb r0, [r1, #0x8]
 *     cmp r2, #0x8
 *     add r1, r1, #0xc
 *     blt .L_c
 *     bx lr
 * _LIT0: .word data_021a8140
 *
 * Leaf, no stack frame -- .legacy.c per C-71. Pointer-strength-
 * reduced iteration (base pointer += 0xc each pass, C-65), not
 * array indexing. The "0" value is its own register, initialized
 * as a copy of the loop counter's start value (mirrors the
 * func_020442f8 `sh = i` pattern). Register-alloc note: `i`/`zero`
 * must be DECLARED before `p` -- declaring `p` first swaps which
 * of the two ends up in r1 vs r2 throughout, identical logic
 * otherwise.
 */

struct s_02095c18_elem {
    int f0;
    int f4;
    char f8;
    char _pad[3];
};

extern struct s_02095c18_elem data_021a8140[8];

void func_02095b24(void) {
    int i = 0;
    int zero = i;
    struct s_02095c18_elem *p = data_021a8140;

    for (; i < 8; i++) {
        p->f0 = zero;
        p->f4 = zero;
        p->f8 = (char)zero;
        p++;
    }
}
