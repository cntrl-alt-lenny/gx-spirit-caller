; func_02077c08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a071c
        .extern func_020930b0
        .extern func_02094688
        .global func_02077c08
        .arm
func_02077c08:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r9, r0
    mov r8, r1
    mov r7, r2
    bl OS_DisableIrq
    mov r5, r0
    bl func_020930b0
    ldr r6, _LIT0
    mov r4, r0, lsr #0x10
    mov r3, #0x0
    mov ip, r3
    mov r2, r6
    orr r4, r4, r1, lsl #0x10
    mvn r0, #0x0
.L_e8:
    ldrb r1, [r2, #0x5a]
    cmp r1, #0x0
    beq .L_120
    cmp r8, #0x0
    beq .L_120
    ldr lr, [r2, #0x54]
    cmp r8, lr
    bne .L_120
    cmp r7, #0x0
    beq .L_120
    ldrh lr, [r2, #0x58]
    cmp r7, lr
    moveq r6, r2
    beq .L_160
.L_120:
    mvn lr, #0x0
    cmp r3, lr
    beq .L_150
    cmp r1, #0x0
    moveq r3, r0
    moveq r6, r2
    beq .L_150
    ldr r1, [r2, #0x50]
    sub r1, r4, r1
    cmp r1, r3
    movhi r3, r1
    movhi r6, r2
.L_150:
    add ip, ip, #0x1
    cmp ip, #0x4
    add r2, r2, #0x5c
    blt .L_e8
.L_160:
    mov r1, r6
    add r0, r9, #0x74
    mov r2, #0x20
    bl func_02094688
    mov r0, r9
    add r1, r6, #0x20
    mov r2, #0x30
    bl func_02094688
    str r4, [r6, #0x50]
    mov r0, #0x1
    strb r0, [r6, #0x5a]
    str r8, [r6, #0x54]
    mov r0, r5
    strh r7, [r6, #0x58]
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
_LIT0: .word data_021a071c
