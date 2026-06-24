; func_020610dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210133c
        .extern data_02101344
        .extern func_020552bc
        .extern func_020a6c60
        .extern func_020a9828
        .extern func_020a985c
        .global func_020610dc
        .arm
func_020610dc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    movs sl, r0
    bne .L_15c
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x2b
    bl func_020a6c60
.L_15c:
    bl func_020552bc
    bl func_020a985c
    bl func_020a9828
    ldr r1, _LIT2
    mov r2, r0, lsr #0x1f
    smull r3, r4, r1, r0
    mov r8, #0x0
    mov r4, r4, asr #0x4
    mov r9, #0x1
    ldr r1, _LIT3
    add r4, r2, r4
    smull r2, r3, r1, r4
    sub r4, r0, r2
    add r0, r4, #0x21
    strb r0, [sl]
    mov r5, r8
    mov r6, r9
    mov fp, r8
    mov r4, r9
.L_1a8:
    sub r0, r9, #0x1
    ldrb r2, [sl, r0]
    ldrb r3, [sl]
    add r7, sl, r9
    cmp r2, r3
    eor r2, r9, r2
    movcc r0, r6
    and r2, r2, #0x1
    movcs r0, r5
    cmp r3, #0x4f
    movcc r1, r4
    and r3, r3, #0x1
    eor r2, r8, r2
    movcs r1, fp
    eor r2, r3, r2
    eor r1, r2, r1
    eor r8, r1, r0
    bl func_020a9828
    ldr r2, _LIT2
    cmp r8, #0x0
    smull r3, r1, r2, r0
    mov r1, r1, asr #0x4
    mov r2, r0, lsr #0x1f
    add r1, r2, r1
    ldr r2, _LIT3
    smull r1, r3, r2, r1
    sub r1, r0, r1
    add r0, r1, #0x21
    strb r0, [sl, r9]
    beq .L_22c
    ldrb r0, [r7]
    ands r0, r0, #0x1
    beq .L_244
.L_22c:
    cmp r8, #0x0
    bne .L_250
    ldrb r0, [r7]
    and r0, r0, #0x1
    cmp r0, #0x1
    bne .L_250
.L_244:
    ldrb r0, [r7]
    add r0, r0, #0x1
    strb r0, [r7]
.L_250:
    add r9, r9, #0x1
    cmp r9, #0x20
    blt .L_1a8
    mov r0, sl
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0210133c
_LIT1: .word data_02101344
_LIT2: .word 0x2c0b02c1
_LIT3: .word 0x0000005d
