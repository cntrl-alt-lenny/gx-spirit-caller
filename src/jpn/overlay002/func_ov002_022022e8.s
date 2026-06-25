; func_ov002_022022e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021c83c8
        .global func_ov002_022022e8
        .arm
func_ov002_022022e8:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0x2]
    ldr r2, [r0, #0x14]
    mov r0, r2, lsl #0x16
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r3, _LIT0
    mov r1, r2, lsl #0x12
    and ip, r0, #0x1
    mul lr, ip, r3
    mov r1, r1, lsr #0x1c
    mov r2, #0x14
    mul ip, r1, r2
    ldr r3, _LIT1
    add r2, r3, lr
    add r2, r2, ip
    ldr r2, [r2, #0x30]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r2, _LIT2
    add r2, r2, lr
    ldrh r2, [ip, r2]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov002_021c83c8
    cmp r0, #0x7d0
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
