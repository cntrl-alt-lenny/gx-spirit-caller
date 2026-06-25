; func_0207a0f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a07ac
        .extern func_0207a370
        .extern func_0207ae40
        .extern func_0207af50
        .extern func_0207b054
        .extern func_0209e828
        .global func_0207a0f4
        .arm
func_0207a0f4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldrh r0, [r0, #0x2]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_47c
    b .L_390
    b .L_464
    b .L_47c
    b .L_464
    b .L_47c
.L_390:
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0x260]
    cmp r0, #0xc
    bne .L_3c0
    mov r0, #0xa
    bl func_0207af50
    bl func_0207ae40
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_3c0:
    ldr r0, _LIT1
    mov r1, #0x0
    bl func_0209e828
    cmp r0, #0x2
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    cmp r0, #0x3
    beq .L_41c
    cmp r0, #0x8
    bne .L_434
    mov r0, #0xc
    bl func_0207af50
    ldr r0, _LIT0
    ldr r3, _LIT2
    ldr r1, [r0]
    mov r0, #0x1
    add r1, r1, #0x2140
    mov r2, #0x0
    bl func_0207b054
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_41c:
    mov r0, #0xa
    bl func_0207af50
    bl func_0207ae40
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_434:
    mov r0, #0xb
    bl func_0207af50
    ldr r1, _LIT0
    mov r0, #0x7
    ldr r1, [r1]
    mov r2, #0x0
    add r1, r1, #0x2140
    mov r3, #0x8c0
    bl func_0207b054
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_464:
    mov r0, #0xa
    bl func_0207af50
    bl func_0207ae40
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_47c:
    mov r0, #0xb
    bl func_0207af50
    ldr r0, _LIT0
    ldr r3, _LIT3
    ldr r1, [r0]
    mov r0, #0x7
    add r1, r1, #0x2140
    mov r2, #0x0
    bl func_0207b054
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a07ac
_LIT1: .word func_0207a370
_LIT2: .word 0x000008b4
_LIT3: .word 0x000008d3
