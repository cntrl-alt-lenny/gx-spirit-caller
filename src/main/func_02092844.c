/* func_02092844: clear 4 fields with a redundant load between writes.
 *
 *     mov r2, #0x0
 *     str r2, [r0, #0x4]
 *     ldr r1, [r0, #0x4]       ; redundant load (read-after-write)
 *     str r1, [r0, #0x0]
 *     str r2, [r0, #0x8]
 *     str r2, [r0, #0xc]
 *     bx  lr
 *
 * The reload `ldr r1, [r0, #4]` after the immediately-prior `str r2, [r0, #4]`
 * looks redundant but is forced by reading a `volatile`-typed field —
 * mwcc cannot CSE the read away.
 */

typedef struct {
    int          f_0;
    volatile int f_4;
    int          f_8;
    int          f_c;
} state_021_4clear_t;

void func_02092844(state_021_4clear_t *p) {
    p->f_4 = 0;
    p->f_0 = p->f_4;
    p->f_8 = 0;
    p->f_c = 0;
}
