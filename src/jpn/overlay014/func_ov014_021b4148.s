; func_ov014_021b4148 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov014_021b4148
        .arm
func_ov014_021b4148:
    ldrh r1, [r0, #0x54]
    ldrh r0, [r0, #0x56]
    mov r2, r1, lsl #0x18
    mov r2, r2, lsr #0x18
    mov r1, r1, lsl #0x10
    and r3, r2, #0x1f
    mov r2, r1, lsr #0x18
    mov r1, r0, lsl #0x18
    mov r1, r1, lsr #0x18
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    orr r3, r3, #0x0
    mov r2, r2, lsl #0x1b
    orr r2, r3, r2, lsr #0x16
    mov r1, r1, lsl #0x1b
    orr r1, r2, r1, lsr #0x11
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0xc
    bx lr
