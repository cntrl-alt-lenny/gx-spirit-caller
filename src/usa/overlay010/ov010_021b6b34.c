/* func_ov010_021b6b34: set bit 0x8 on data_ov010_021b9784+0x364.
 *
 *     ldr r0, .L_...
 *     ldr r1, [r0, #0x364]
 *     orr r1, r1, #0x8
 *     str r1, [r0, #0x364]
 *     bx  lr
 *
 * Uses struct typedef to force base+offset codegen (see
 * ov015_021b3f80.c for the full literal-pool-folding note).
 */

typedef struct {
    char _pad[0x364];
    unsigned int flags;
} ov010_state_364_9884_t;

extern ov010_state_364_9884_t data_ov010_021b9784;

void func_ov010_021b6b34(void) {
    data_ov010_021b9784.flags |= 0x8;
}
