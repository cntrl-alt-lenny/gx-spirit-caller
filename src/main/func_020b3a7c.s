; func_020b3a7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b3a7c
        .arm
func_020b3a7c:
    cmp r1, #0x0
    bxeq lr
    cmp r0, r1
    movcc r1, r0
    movcc r0, #0x0
    bxcc lr
    mov r2, #0x1c
    mov r3, r0, lsr #0x4
    cmp r1, r3, lsr #0xc
    suble r2, r2, #0x10
    movle r3, r3, lsr #0x10
    cmp r1, r3, lsr #0x4
    suble r2, r2, #0x8
    movle r3, r3, lsr #0x8
    cmp r1, r3
    suble r2, r2, #0x4
    movle r3, r3, lsr #0x4
    mov r0, r0, lsl r2
    rsb r1, r1, #0x0
    adds r0, r0, r0
    add r2, r2, r2, lsl #0x1
    add pc, pc, r2, lsl #0x2
    nop
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    adcs r3, r1, r3, lsl #0x1
    subcc r3, r3, r1
    adcs r0, r0, r0
    mov r1, r3
    bx lr
