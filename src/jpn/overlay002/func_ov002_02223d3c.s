; func_ov002_02223d3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021df728
        .extern func_ov002_0226b168
        .global func_ov002_02223d3c
        .arm
func_ov002_02223d3c:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    ldr r1, _LIT1
    ldr r3, [r2, #0x5a8]
    ldr ip, [r1, #0xcec]
    ldr r1, [r2, #0x5ac]
    cmp r3, #0x7e
    eor ip, ip, r1
    beq .L_6c
    cmp r3, #0x7f
    beq .L_44
    cmp r3, #0x80
    mov r0, #0x0
    bne .L_d8
    str r0, [r2, #0x5ac]
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_44:
    ldrh r0, [r0, #0x2]
    mov r1, r0, lsl #0x1f
    cmp ip, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    moveq r1, r0, lsr #0x1b
    mvnne r1, #0x0
    mov r0, ip
    bl func_ov002_0226b168
    mov r0, #0x7e
    ldmia sp!, {r3, pc}
.L_6c:
    ldr r1, _LIT2
    add r3, r0, ip, lsl #0x1
    ldrh r1, [r1, #0xb0]
    strh r1, [r3, #0x8]
    ldr r1, [r2, #0x5ac]
    add r1, r1, #0x1
    cmp r1, #0x2
    str r1, [r2, #0x5ac]
    movlt r0, #0x7f
    ldmltia sp!, {r3, pc}
    ldrh r2, [r0, #0xa]
    ldrh r1, [r0, #0x8]
    cmp r1, r2
    moveq r0, #0x80
    ldmeqia sp!, {r3, pc}
    movhi r1, #0x1
    movls r1, #0x0
    rsb r2, r1, #0x1
    add r2, r0, r2, lsl #0x1
    ldrh r3, [r2, #0x8]
    cmp r3, #0x6
    ldreq r2, _LIT3
    movne r2, #0x1f4
    mulne r2, r3, r2
    bl func_ov002_021df728
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_d8:
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022d0d8c
_LIT3: .word 0x00001770
