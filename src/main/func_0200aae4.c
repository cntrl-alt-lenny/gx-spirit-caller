/* func_0200aae4: flag dispatch — read `data_02104bac.flags`, fork on
 * bit-3 set (call helper1) or any of bits 0..2 + 8..13 set (return 1),
 * else call helper2 with the mask and return 0.
 *
 *     stmfd sp!, {r3, lr}
 *     ldr   r0, .L_data           ; r0 = &data_02104bac
 *     ldrh  r1, [r0, #0x54]
 *     tst   r1, #0x8
 *     beq   .L_no_bit3
 *     bl    func_02008548
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 * .L_no_bit3:
 *     ldr   r0, .L_mask           ; r0 = 0x2f07
 *     tst   r1, r0
 *     movne r0, #0x1
 *     ldmneia sp!, {r3, pc}        ; return 1 if any of those bits set
 *     bl    func_0200aa60          ; r0 still = 0x2f07
 *     mov   r0, #0x0
 *     ldmia sp!, {r3, pc}
 * .L_data: .word 0x02104bac
 * .L_mask: .word 0x00002f07
 *
 * 15 insns + 2 pool = 0x44 bytes. Shape-clone family of 3 (differ only
 * in the bl targets):
 *   main|0x0200aae4 → bl func_02008548 + bl func_0200aa60
 *   main|0x0200ab28 → bl func_020085e4 + bl func_0200aa60
 *   main|0x0200ab6c → bl func_02008888 + bl func_0200aa60
 *
 * The clones share the constant 0x2f07 — mwcc loads it once into r0 for
 * the `tst` and reuses the same register as the helper2 argument.
 */

#include <nitro/types.h>

typedef struct {
    u8  _pad[0x54];
    u16 flags;
} state_0200aae4_t;

extern state_0200aae4_t data_02104bac;
extern int func_02008548(state_0200aae4_t *p);
extern void func_0200aa60(int mask);

int func_0200aae4(void) {
    if (data_02104bac.flags & 0x8) {
        func_02008548(&data_02104bac);
        return 1;
    }
    if (data_02104bac.flags & 0x2f07) {
        return 1;
    }
    func_0200aa60(0x2f07);
    return 0;
}
