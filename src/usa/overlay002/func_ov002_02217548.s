; func_ov002_02217548 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf098
        .extern data_ov002_022d0d8c
        .extern func_ov002_021d7880
        .extern func_ov002_0226ac6c
        .extern func_ov002_0226aea4
        .global func_ov002_02217548
        .arm
func_ov002_02217548:
    stmdb sp!, {r3, lr}
    mov r1, r0
    ldrh r0, [r1, #0x4]
    ldrh r3, [r1, #0x8]
    mov r2, r0, lsl #0x1d
    and r0, r3, #0x1
    movs r2, r2, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r2, _LIT0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x7f
    beq .L_a4
    cmp r2, #0x80
    bne .L_cc
    ldrh r2, [r1, #0x2]
    mov r2, r2, lsl #0x1f
    cmp r0, r2, lsr #0x1f
    mov ip, r2, lsr #0x1f
    bne .L_68
    mov r2, #0x0
    mov r3, r2
    mov r1, #0x1
    bl func_ov002_0226ac6c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_68:
    rsb r2, ip, #0x1
    ldr r0, _LIT1
    and r2, r2, #0x1
    mul r3, r2, r0
    ldr r0, _LIT2
    ldr r0, [r0, r3]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh r1, [r1]
    mov r0, ip
    mov r2, #0x1
    bl func_ov002_0226aea4
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_a4:
    ldrh r1, [r1, #0x2]
    ldr r0, _LIT3
    mov r2, #0x1
    mov r1, r1, lsl #0x1f
    mov r3, r1, lsr #0x1f
    ldrh r1, [r0, #0xb0]
    rsb r0, r3, #0x1
    bl func_ov002_021d7880
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_cc:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022d0d8c
