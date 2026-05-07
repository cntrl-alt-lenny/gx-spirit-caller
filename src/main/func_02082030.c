/* func_02082030: conditionally write two args to two struct fields,
 * skipping zero values.
 *
 *     cmp r1, #0x0
 *     strne r1, [r0, #0x8]
 *     cmp r2, #0x0
 *     strne r2, [r0, #0x18]
 *     bx  lr
 */

typedef struct {
    char _pad_8[0x8];
    int  f_8;
    char _pad_18[0x18 - 0x8 - 4];
    int  f_18;
} state_8_18_t;

void func_02082030(state_8_18_t *p, int a, int b) {
    if (a != 0) p->f_8 = a;
    if (b != 0) p->f_18 = b;
}
