; func_ov004_021ce284 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b2a0
        .extern data_ov004_0220efc8
        .extern func_02052c68
        .extern func_020530fc
        .extern func_02094688
        .global func_ov004_021ce284
        .arm
func_ov004_021ce284:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r5, _LIT0
    ldr r7, _LIT1
    mov r6, r0
    mov r4, #0x0
.L_18c:
    mov r0, r6
    mov r1, r7
    bl func_02052c68
    cmp r0, #0x0
    beq .L_1ec
    mov r2, #0x54
    mul lr, r4, r2
    add r0, r5, lr
    add r3, r0, #0x3000
    ldrb ip, [r3, #0xd78]
    add r0, r5, #0x128
    add r1, r0, #0x3c00
    strb ip, [r6, #0x50]
    ldrb r5, [r3, #0xd79]
    mov r0, r6
    add r1, r1, lr
    strb r5, [r6, #0x51]
    ldrb r5, [r3, #0xd7a]
    strb r5, [r6, #0x52]
    ldr r3, [r3, #0xd74]
    str r3, [r6, #0x4c]
    bl func_02094688
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1ec:
    add r4, r4, #0x1
    cmp r4, #0x3c
    add r7, r7, #0x54
    blt .L_18c
    add r0, r5, #0x128
    add r4, r0, #0x3c00
    mov r7, #0x0
.L_208:
    mov r0, r4
    bl func_020530fc
    cmp r0, #0x0
    beq .L_228
    add r7, r7, #0x1
    cmp r7, #0x3c
    add r4, r4, #0x54
    blt .L_208
.L_228:
    cmp r7, #0x3c
    bge .L_258
    add r0, r5, #0x128
    add r0, r0, #0x3c00
    mov r2, #0x54
    mla r1, r7, r2, r0
    mov r3, #0x1
    mov r0, r6
    str r3, [r6, #0x48]
    bl func_02094688
    mov r0, r7
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_258:
    mvn r4, #0x0
    mov r1, r4
    mov r2, r5
    mov r3, #0x0
.L_268:
    add r0, r2, #0x3000
    ldr r0, [r0, #0xd34]
    add r2, r2, #0x54
    cmp r0, r1
    movcc r4, r3
    add r3, r3, #0x1
    movcc r1, r0
    cmp r3, #0x3c
    blt .L_268
    add r0, r5, #0x128
    add r0, r0, #0x3c00
    mov r2, #0x54
    mla r1, r4, r2, r0
    mov r3, #0x1
    mov r0, r6
    str r3, [r6, #0x48]
    bl func_02094688
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_ov004_0220efc8
