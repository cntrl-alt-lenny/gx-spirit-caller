/* func_02068368: clear 3 fields with a volatile-forced reload between
 * stores. Sibling of brief-028 func_02092844.
 *
 *     mov r2, #0x0
 *     str r2, [r0, #0x4]
 *     ldr r1, [r0, #0x4]      ; volatile reload
 *     str r1, [r0, #0x0]
 *     str r2, [r0, #0x8]
 *     bx  lr
 *
 * The reload `ldr r1, [r0, #0x4]` after the immediately-prior store
 * is forced by reading a `volatile`-typed field — preserves the
 * load that mwcc would otherwise CSE-elide.
 */

typedef struct {
    int          f_0;
    volatile int f_4;
    int          f_8;
} state_3vc_t;

void func_02068368(state_3vc_t *p) {
    p->f_4 = 0;
    p->f_0 = p->f_4;
    p->f_8 = 0;
}
