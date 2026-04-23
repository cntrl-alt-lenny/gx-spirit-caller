/* func_ov010_021b4678: set bit 0x4 on data_ov010_021b91b4+0x2cc.
 *
 *     ldr r0, .L_...
 *     ldr r1, [r0, #0x2cc]
 *     orr r1, r1, #0x4
 *     str r1, [r0, #0x2cc]
 *     bx  lr
 *
 * Uses struct typedef to force base+offset codegen (see
 * ov015_021b3f80.c for the full literal-pool-folding note).
 */

typedef struct {
    char _pad[0x2cc];
    unsigned int flags;
} ov010_state_2cc_91b4_t;

extern ov010_state_2cc_91b4_t data_ov010_021b91b4;

void func_ov010_021b4678(void) {
    data_ov010_021b91b4.flags |= 0x4;
}
