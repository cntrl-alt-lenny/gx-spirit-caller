; func_0203fc70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe630
        .extern data_020fe640
        .extern data_0219d9d4
        .extern data_0219d9d8
        .extern func_0203f968
        .extern func_02040e3c
        .extern func_02044cb8
        .extern func_02044e58
        .extern func_02044ea8
        .global func_0203fc70
        .arm
func_0203fc70:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    add r2, r0, #0x1000
    ldr r0, [r2, #0x314]
    ldr r5, [r2, #0x20c]
    ldr r4, [r2, #0x210]
    bl func_02040e3c
    cmp r0, #0x1
    beq .L_5f4
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r1, [r0]
    add sp, sp, #0x4
    add r1, r1, #0x1000
    str r2, [r1, #0x8]
    mov r0, #0xe
    ldmia sp!, {r4, r5, pc}
.L_5f4:
    bl func_0203f968
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0xe
    ldmneia sp!, {r4, r5, pc}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0]
    add r0, r0, #0x1000
    ldr r2, [r0, #0x8]
    cmp r2, r1
    bge .L_6c8
    ldr r0, _LIT2
    cmp r2, r0
    bne .L_6bc
    ldr r0, _LIT3
    ldr r1, _LIT4
    blx r5
    movs r5, r0
    bne .L_664
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r1, [r0]
    add sp, sp, #0x4
    add r1, r1, #0x1000
    str r2, [r1, #0x8]
    mov r0, #0x2
    ldmia sp!, {r4, r5, pc}
.L_664:
    add r1, r5, #0x1f
    ldr r0, _LIT5
    bic r1, r1, #0x1f
    bl func_02044e58
    cmp r0, #0x1
    beq .L_6ac
    ldr r0, _LIT6
    mov r1, r5
    mov r2, #0x0
    blx r4
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r1, [r0]
    add sp, sp, #0x4
    add r1, r1, #0x1000
    str r2, [r1, #0x8]
    mov r0, #0xf
    ldmia sp!, {r4, r5, pc}
.L_6ac:
    ldr r0, _LIT6
    mov r1, r5
    mov r2, #0x0
    blx r4
.L_6bc:
    add sp, sp, #0x4
    mov r0, #0x15
    ldmia sp!, {r4, r5, pc}
.L_6c8:
    ldr r0, _LIT7
    cmp r2, r0
    beq .L_6e4
    ldr r0, _LIT8
    cmp r2, r0
    beq .L_70c
    b .L_77c
.L_6e4:
    ldr r0, _LIT5
    bl func_02044cb8
    ldr r0, _LIT0
    ldr r2, _LIT7
    ldr r1, [r0]
    add sp, sp, #0x4
    add r1, r1, #0x1000
    str r2, [r1, #0x8]
    mov r0, #0x10
    ldmia sp!, {r4, r5, pc}
.L_70c:
    ldr r0, _LIT3
    mov r1, #0x700
    blx r5
    movs r5, r0
    bne .L_740
    ldr r0, _LIT0
    ldr r2, _LIT8
    ldr r1, [r0]
    add sp, sp, #0x4
    add r1, r1, #0x1000
    str r2, [r1, #0x8]
    mov r0, #0x11
    ldmia sp!, {r4, r5, pc}
.L_740:
    add r0, r5, #0x1f
    bic r0, r0, #0x1f
    bl func_02044ea8
    ldr r0, _LIT6
    mov r1, r5
    mov r2, #0x0
    blx r4
    ldr r0, _LIT0
    ldr r2, _LIT8
    ldr r1, [r0]
    add sp, sp, #0x4
    add r1, r1, #0x1000
    str r2, [r1, #0x8]
    mov r0, #0x11
    ldmia sp!, {r4, r5, pc}
.L_77c:
    mov r0, #0x12
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219d9d4
_LIT1: .word 0x00004e84
_LIT2: .word 0x00004e22
_LIT3: .word data_020fe630
_LIT4: .word 0x0000071f
_LIT5: .word data_0219d9d8
_LIT6: .word data_020fe640
_LIT7: .word 0x00004e88
_LIT8: .word 0x00004e8c
