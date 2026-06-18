; func_ov002_02291b44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_ov002_021bbd14
        .extern func_ov002_021c3ae4
        .global func_ov002_02291b44
        .arm
func_ov002_02291b44:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r3, r0, #0x1
    and r3, r3, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x5
    movcs r0, #0x1
    ldmcsia sp!, {r4, pc}
    ldr r1, _LIT2
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    bne .L_200
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbd14
    cmp r0, #0x0
    beq .L_23c
.L_200:
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT3
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r3, r2, r0
    ldr r0, [r1, r3]
    cmp r0, #0x3e8
    ble .L_23c
    ldr r0, _LIT1
    ldr r0, [r0, r3]
    cmp r0, #0xf
    movcs r0, #0x1
    ldmcsia sp!, {r4, pc}
.L_23c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word 0x000014f0
_LIT3: .word data_ov002_022cf16c
