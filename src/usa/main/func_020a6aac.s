; func_020a6aac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a62f0
        .extern data_021a9e50
        .extern data_021a9e60
        .extern data_021a9f60
        .extern data_021a9f84
        .extern data_021a9fa8
        .extern func_020925a4
        .extern func_02092660
        .extern func_020926d0
        .extern func_020a7008
        .extern func_020b4220
        .global func_020a6aac
        .arm
func_020a6aac:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    bl func_020925a4
    cmp r0, #0x0
    bne .L_38
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r2, [r0, #0x4]
    ldr r0, _LIT3
    ldr r3, [r2, #0x6c]
    mov r2, #0x1
    str r3, [r1]
    str r2, [r0]
    b .L_90
.L_38:
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0, #0x4]
    ldr r1, [r1]
    ldr r0, [r0, #0x6c]
    cmp r1, r0
    bne .L_68
    ldr r0, _LIT3
    ldr r1, [r0]
    add r1, r1, #0x1
    str r1, [r0]
    b .L_90
.L_68:
    ldr r0, _LIT0
    bl func_020926d0
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r2, [r0, #0x4]
    ldr r0, _LIT3
    ldr r3, [r2, #0x6c]
    mov r2, #0x1
    str r3, [r1]
    str r2, [r0]
.L_90:
    ldr r4, _LIT4
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    ble .L_c4
    ldr r5, _LIT5
.L_a4:
    ldr r0, [r4, #0x8]
    sub r1, r0, #0x1
    ldr r0, [r5, r1, lsl #0x2]
    str r1, [r4, #0x8]
    blx r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    bgt .L_a4
.L_c4:
    ldr r0, _LIT3
    ldr r1, [r0]
    subs r1, r1, #0x1
    str r1, [r0]
    bne .L_e0
    ldr r0, _LIT0
    bl func_02092660
.L_e0:
    ldr r0, _LIT4
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_100
    blx r0
    ldr r0, _LIT4
    mov r1, #0x0
    str r1, [r0]
.L_100:
    mov r0, #0x0
    bl func_020a7008
    bl func_020b4220
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_021a9fa8
_LIT1: .word data_021a62f0
_LIT2: .word data_021a9f60
_LIT3: .word data_021a9f84
_LIT4: .word data_021a9e50
_LIT5: .word data_021a9e60
