/* func_02001dc4: insert low byte of arg into bits 0..7 of `p->f_1c`.
 *
 *     ldr r2, [r0, #0x1c]
 *     and r1, r1, #0xff
 *     bic r2, r2, #0xff
 *     orr r1, r2, r1
 *     str r1, [r0, #0x1c]
 *     bx  lr
 */

typedef struct {
    char         _pad[0x1c];
    unsigned int f_1c;
} state_1c_t;

void func_02001dc4(state_1c_t *p, unsigned int v) {
    p->f_1c = (p->f_1c & ~0xffu) | (v & 0xff);
}
