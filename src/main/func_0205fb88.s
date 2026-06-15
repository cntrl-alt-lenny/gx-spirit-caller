; func_0205fb88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100de0
        .extern data_02100e20
        .extern data_02100e50
        .extern data_021010e8
        .extern data_02101110
        .extern data_02101144
        .extern data_02101174
        .extern data_02101194
        .extern func_020453e8
        .extern func_02054bfc
        .extern func_02054db8
        .extern func_02054e8c
        .extern func_02055250
        .extern func_020585d4
        .extern func_0205ffc0
        .extern func_0205ffd4
        .extern func_0206ebe8
        .extern func_020a6d54
        .global func_0205fb88
        .arm
func_0205fb88:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r1
    ldr r4, [r5, #0x4]
    mov r1, #0x1000
    str r1, [r4, #0xc]
    ldr r1, [r4, #0xc]
    mov r6, r0
    add r0, r1, #0x1
    bl func_020453e8
    str r0, [r4, #0x8]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    bne .L_2190
    ldr r1, _LIT0
    mov r0, r6
    bl func_0205ffc0
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_2190:
    mov r0, #0x2
    mov r1, #0x1
    mov r2, #0x0
    bl func_02054e8c
    str r0, [r4, #0x4]
    ldr r0, [r4, #0x4]
    mvn r1, #0x0
    cmp r0, r1
    bne .L_21e0
    ldr r2, _LIT1
    mov r0, r6
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x8
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_21e0:
    mov r1, #0x0
    bl func_02055250
    cmp r0, #0x0
    bne .L_221c
    ldr r2, _LIT2
    mov r0, r6
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x8
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_221c:
    ldr r0, _LIT3
    bl func_0206ebe8
    cmp r0, #0x0
    bne .L_2258
    ldr r2, _LIT4
    mov r0, r6
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x8
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_2258:
    add r1, sp, #0x0
    mov r2, #0x0
    str r2, [r1]
    str r2, [r1, #0x4]
    mov r1, #0x2
    strb r1, [sp, #0x1]
    ldr r0, [r0, #0xc]
    ldr r0, [r0]
    ldr r0, [r0]
    str r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_2298
    ldr r0, _LIT5
    ldr r1, _LIT6
    mov r3, #0x59
    bl func_020a6d54
.L_2298:
    ldr r0, _LIT7
    add r1, sp, #0x0
    strh r0, [sp, #0x2]
    ldr r0, [r4, #0x4]
    mov r2, #0x8
    bl func_02054db8
    mvn r1, #0x0
    cmp r0, r1
    bne .L_2314
    ldr r0, [r4, #0x4]
    bl func_02054bfc
    mvn r1, #0x5
    cmp r0, r1
    beq .L_2314
    mvn r1, #0x19
    cmp r0, r1
    beq .L_2314
    mvn r1, #0x4b
    cmp r0, r1
    beq .L_2314
    ldr r2, _LIT8
    mov r0, r6
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x8
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_2314:
    mov r0, #0x1
    str r0, [r5, #0x14]
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02100e20
_LIT1: .word data_021010e8
_LIT2: .word data_02101110
_LIT3: .word data_02100de0
_LIT4: .word data_02101144
_LIT5: .word data_02101174
_LIT6: .word data_02100e50
_LIT7: .word 0x0000cd74
_LIT8: .word data_02101194
