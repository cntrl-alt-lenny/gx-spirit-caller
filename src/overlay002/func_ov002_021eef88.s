; func_ov002_021eef88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .global func_ov002_021eef88
        .arm
func_ov002_021eef88:
    stmdb sp!, {r3, lr}
    cmp r2, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r3, pc}
    ldr r3, _LIT0
    and lr, r1, #0x1
    mul ip, lr, r3
    mov r1, #0x14
    mul lr, r2, r1
    ldr r3, _LIT1
    add r2, r3, ip
    add r1, r2, lr
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, _LIT2
    add r1, r1, ip
    ldrh r1, [lr, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    add r1, r2, #0x30
    ldr r1, [r1, lr]
    ldrh r2, [r0, #0x4]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x11
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r2, lsr #0x17
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
