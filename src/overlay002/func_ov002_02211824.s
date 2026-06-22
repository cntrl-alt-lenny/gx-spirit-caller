; func_ov002_02211824 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf17c
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021e1bf8
        .global func_ov002_02211824
        .arm
func_ov002_02211824:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0]
    ldr r1, _LIT0
    mov r3, #0x0
    cmp r2, r1
    beq .L_34
    ldr r1, _LIT1
    cmp r2, r1
    beq .L_3c
    add r1, r1, #0x220
    cmp r2, r1
    moveq r3, #0x3
    b .L_40
.L_34:
    mov r3, #0x5
    b .L_40
.L_3c:
    mov r3, #0x3
.L_40:
    ldr r1, _LIT2
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7e
    beq .L_d8
    cmp r1, #0x7f
    beq .L_b0
    cmp r1, #0x80
    bne .L_f0
    ldrh r0, [r0, #0x2]
    ldr r1, _LIT3
    ldr r2, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, _LIT5
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r1, #0xf5
    bl func_ov002_021ae400
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_b0:
    ldrh r0, [r0, #0x2]
    cmp r3, #0x20
    movge r3, #0x20
    mov r0, r0, lsl #0x1f
    add r1, r3, #0x6
    mov r3, #0x0
    mov r0, r0, lsr #0x1f
    bl func_ov002_021af9d0
    mov r0, #0x7e
    ldmia sp!, {r3, pc}
.L_d8:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e1bf8
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_f0:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00001051
_LIT1: .word 0x0000162c
_LIT2: .word data_ov002_022ce288
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf17c
_LIT5: .word data_ov002_022cd744
