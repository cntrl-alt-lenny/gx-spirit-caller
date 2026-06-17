/* func_02081fd0: lazy-init a global state slot. Read data_021a17d8.f_fc;
 * if bit 7 is clear, call func_02082050() then set bit 7 on
 * data_021a1938.f_fc. Always return &data_021a1938.
 *
 *     stmfd sp!, {lr}
 *     sub   sp, sp, #0x4
 *     ldr   r0, .L_src             ; r0 = &data_021a17d8
 *     ldr   r0, [r0, #0xfc]        ; r0 = data_021a17d8.f_fc
 *     ands  r0, r0, #0x80
 *     bne   .L_done
 *     bl    func_02082050
 *     ldr   r0, .L_dst             ; r0 = &data_021a1938
 *     ldr   r1, [r0, #0xfc]
 *     orr   r1, r1, #0x80
 *     str   r1, [r0, #0xfc]
 * .L_done:
 *     ldr   r0, .L_dst             ; r0 = &data_021a1938 (the return value)
 *     add   sp, sp, #0x4
 *     ldmfd sp!, {pc}
 * .L_src:  .word 0x021a18b8
 * .L_dst:  .word 0x021a1a18
 *
 * 14 insns + 2 pool = 0x40 bytes. Sibling func_02082010 differs only in
 * the second pool word (data_021a1908 instead of data_021a1938).
 *
 * mwcc emits two separate `ldr r0, .L_dst` for the dst address — one
 * for the set-bit branch and one for the return — preserving the
 * volatile re-read effect even though the address is the same. The
 * first ldr (.L_src) is shared between clones because both branches
 * read from the same source byte.
 */

#include <nitro/types.h>

typedef struct {
    u8 _pad[0xfc];
    u32 f_fc;
} state_021a18b8_t;

extern state_021a18b8_t data_021a17d8;
extern state_021a18b8_t data_021a1938;
extern void func_02082050(void);

state_021a18b8_t *func_02081fd0(void) {
    if (!(data_021a17d8.f_fc & 0x80)) {
        func_02082050();
        data_021a17d8.f_fc |= 0x80;
    }
    return &data_021a1938;
}
