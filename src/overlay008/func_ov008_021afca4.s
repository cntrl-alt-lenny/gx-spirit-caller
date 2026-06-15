; func_ov008_021afca4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2de4
        .extern func_02005dac
        .extern func_02006194
        .extern func_0202b6b4
        .extern func_0202bb20
        .extern func_02037208
        .extern func_020944a4
        .extern func_ov008_021aa578
        .extern func_ov008_021ab484
        .global func_ov008_021afca4
        .arm
func_ov008_021afca4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24
    ldr r4, _LIT0
    mov sl, r2
    smull r3, r6, r4, sl
    mov r2, sl, lsr #0x1f
    add r5, r1, #0x4
    and r1, r5, #0xff
    orr fp, r1, #0x2000
    add r6, r2, r6, asr #0x1
    mov r3, #0x5
    smull r1, r2, r3, r6
    add r8, r0, #0x19
    add r0, sl, sl, lsl #0x2
    str r0, [sp, #0x10]
    sub r0, r5, #0x2
    sub r6, sl, r1
    str r0, [sp, #0x14]
    mvn r0, #0x0
    add r9, r6, r6, lsl #0x2
    ldr r4, _LIT1
    orr fp, fp, #-2147483648
    mov r6, #0x0
    str r0, [sp, #0x18]
.L_77c:
    ldr r2, [r4, #0xc0]
    ldr r0, [sp, #0x10]
    mov r1, r6, lsl #0x1
    add r0, r2, r0, lsl #0x1
    ldrh r7, [r1, r0]
    mov r0, r7
    bl func_0202bb20
    cmp r0, #0x0
    bne .L_7d4
    mov r0, #0x0
    str r0, [sp]
    ldr r0, _LIT2
    ldr r1, [sp, #0x14]
    str r0, [sp, #0x4]
    mov r0, #0x40
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    add r0, r8, #0x7
    mov r2, #0x1
    mov r3, #0x3
    bl func_ov008_021ab484
.L_7d4:
    add r0, r8, #0x3
    mov r0, r0, lsl #0x17
    orr r0, fp, r0, lsr #0x7
    str r0, [sp, #0x1c]
    mov r0, r9, lsl #0x3
    add r0, r0, #0xf3
    add r0, r0, #0x200
    orr r0, r0, #0x1400
    strh r0, [sp, #0x20]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x1c
    mov r2, #0x8
    bl func_020944a4
    mov r0, r7
    bl func_0202b6b4
    cmp r0, #0x0
    ble .L_898
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_85c
    b .L_85c
    b .L_854
    b .L_854
    b .L_84c
    b .L_844
.L_844:
    mov r3, #0x0
    b .L_860
.L_84c:
    mov r3, #0x1
    b .L_860
.L_854:
    mov r3, #0x2
    b .L_860
.L_85c:
    mov r3, #0x4
.L_860:
    cmp r3, #0x4
    bge .L_898
    mov r0, #0x0
    str r0, [sp]
    ldr r0, _LIT2
    add r1, r5, #0x3
    str r0, [sp, #0x4]
    mov r0, #0x40
    str r0, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    add r0, r8, #0x9
    mov r2, #0x1
    bl func_ov008_021ab484
.L_898:
    bl func_02006194
    cmp r0, #0x0
    beq .L_918
    ldrh r0, [r4, #0xaa]
    cmp r0, #0x0
    ldreq r0, [r4, #0xac]
    cmpeq r0, #0x0
    bne .L_918
    add r0, r8, #0x9
    add r1, r5, #0x3
    add r2, r8, #0x1d
    add r3, r5, #0x1d
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_918
    ldrh r3, [r4]
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    sub r3, sl, r3
    add r2, r6, #0x1
    strh r3, [r4, #0x2]
    strh r2, [r4, #0x4]
    ldrh r2, [r4, #0x2]
    cmp r1, r2
    ldreqh r1, [r4, #0x4]
    cmpeq r0, r1
    beq .L_918
    ldr r1, [sp, #0x18]
    mov r0, #0x38
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_918:
    add r8, r8, #0x1a
    add r9, r9, #0x1
    add r6, r6, #0x1
    cmp r6, #0x5
    blt .L_77c
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x66666667
_LIT1: .word data_ov008_021b2de4
_LIT2: .word 0x000001f2
