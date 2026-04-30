/* func_ov016_021b22c8: comparator — returns `b->f_c - a->f_c`.
 *
 *     ldr r1, [r1, #0xc]        ; b's int at +0xc
 *     ldr r0, [r0, #0xc]        ; a's int at +0xc
 *     sub r0, r1, r0            ; b - a (descending sort)
 *     bx  lr
 *
 * 4 insns = 0x10 bytes. Standard `qsort` comparator shape; `b - a`
 * order means descending sort (b first if b > a).
 */

int func_ov016_021b22c8(void *a, void *b) {
    return *(int *)((char *)b + 0xc) - *(int *)((char *)a + 0xc);
}
