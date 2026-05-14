/* func_ov016_021b5a28: disable BG0/BG1 of the DS sub-engine via DISPCNT,
 * reset their scroll offsets, clear arg->f_8. Returns 1.
 *
 * Byte-identical clones at:
 *   ov017|0x021b7b5c  func_ov017_021b7b5c
 *   ov019|0x021b56f8  func_ov019_021b56f8
 *
 *     stmfd sp!, {r3, lr}
 *     mov   lr, #0x0
 *     str   lr, [r0, #0x8]                 ; arg->f_8 = 0
 *     ldr   r3, .L_data                    ; r3 = REG_DISPCNT_B
 *     mov   r0, #0x1                       ; return value 1
 *     ldr   r2, [r3]                       ; r2 = DISPCNT  (first read)
 *     ldr   r1, [r3]                       ; r1 = DISPCNT  (second read; volatile)
 *     and   r2, r2, #0x1f00                ; r2 = old & enable-mask
 *     mov   ip, r2, lsr #0x8               ; ip = enable bits (0..0x1f)
 *     bic   r2, r1, #0x1f00                ; r2 = DISPCNT cleared of enable bits
 *     bic   r1, ip, #0x3                   ; r1 = enable bits minus BG0/BG1
 *     orr   r1, r2, r1, lsl #0x8           ; r1 = recombined DISPCNT
 *     str   r1, [r3]                       ; write back
 *     str   lr, [r3, #0x10]                ; BG0HOFS_B = 0 (+ VOFS in same w)
 *     str   lr, [r3, #0x14]                ; BG1HOFS_B = 0
 *     ldmfd sp!, {r3, pc}
 * .L_data: .word 0x04001000                 ; REG_DISPCNT_B
 *
 * 16 insns + 1 pool = 0x44 bytes. The two consecutive `ldr r,[r3]` are the
 * cue that DISPCNT must be modelled as volatile — mwcc would otherwise
 * cache the value from the first read. We declare it as `vu32` to force
 * the re-read.
 */

#include <nitro/types.h>

#define REG_DISPCNT_B (*(vu32 *)0x04001000)
#define REG_BG0HOFS_B (*(vu32 *)0x04001010)  /* HOFS+VOFS share this word */
#define REG_BG1HOFS_B (*(vu32 *)0x04001014)

typedef struct {
    u8 _pad0[8];
    int f_8;
} state_021b5a28_t;

int func_ov016_021b5a28(state_021b5a28_t *p) {
    int enable, kept;
    p->f_8 = 0;
    enable = (REG_DISPCNT_B & 0x1f00) >> 8;
    kept = enable & ~0x3;
    REG_DISPCNT_B = (REG_DISPCNT_B & ~0x1f00) | (kept << 8);
    REG_BG0HOFS_B = 0;
    REG_BG1HOFS_B = 0;
    return 1;
}
