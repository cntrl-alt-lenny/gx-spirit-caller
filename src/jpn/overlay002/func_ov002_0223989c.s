; func_ov002_0223989c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021df728
        .extern func_ov002_021e050c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0226b13c
        .global func_ov002_0223989c
        .arm
func_ov002_0223989c:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldr r3, [r1, #0x5a8]
    ldr lr, [r2, #0xcec]
    sub r2, r3, #0x7d
    ldr ip, [r1, #0x5ac]
    cmp r2, #0x3
    eor r3, lr, ip
    addls pc, pc, r2, lsl #0x2
    b .L_d4
    b .L_b4
    b .L_80
    b .L_50
    b .L_3c
.L_3c:
    mov r0, #0x0
    str r0, [r1, #0x5ac]
    bl func_ov002_021e2a4c
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_50:
    ldrh r0, [r0, #0x2]
    mov r2, #0x1
    mov r1, r0, lsl #0x1f
    cmp r3, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    moveq r1, r0, lsr #0x1b
    mov r0, r3
    mvnne r1, #0x0
    mov r3, r2
    bl func_ov002_0226b13c
    mov r0, #0x7e
    ldmia sp!, {r3, pc}
.L_80:
    ldr r1, _LIT2
    ldrh r1, [r1, #0xb2]
    cmp r1, #0x0
    beq .L_a0
    mov r0, r3
    mov r1, #0x7d0
    bl func_ov002_021e050c
    b .L_ac
.L_a0:
    mov r1, r3
    mov r2, #0x7d0
    bl func_ov002_021df728
.L_ac:
    mov r0, #0x7d
    ldmia sp!, {r3, pc}
.L_b4:
    add r0, ip, #0x1
    str r0, [r1, #0x5ac]
    cmp r0, #0x2
    movlt r0, #0x7f
    ldmltia sp!, {r3, pc}
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_d4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022d0d8c
