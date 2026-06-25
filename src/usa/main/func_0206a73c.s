; func_0206a73c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101cd0
        .extern data_02101cf4
        .extern func_0205405c
        .extern func_020540cc
        .extern func_0206b3d8
        .extern func_020a6c60
        .global func_0206a73c
        .arm
func_0206a73c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r8, r0
    ldr r0, [r8, #0x8]
    mov r7, r1
    mov r6, r2
    bl func_020540cc
    mov r5, r0
    cmp r5, #0x0
    mov r4, #0x0
    ble .L_f8
    mvn r9, #0x0
.L_30:
    ldr r0, [r8, #0x8]
    mov r1, r4
    bl func_0205405c
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_74
    cmp r0, #0x1
    beq .L_5c
    cmp r0, #0x2
    beq .L_68
    b .L_bc
.L_5c:
    add r7, r7, #0x1
    sub r6, r6, #0x1
    b .L_dc
.L_68:
    add r7, r7, #0x2
    sub r6, r6, #0x2
    b .L_dc
.L_74:
    cmp r6, #0x1
    addlt sp, sp, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldrb r0, [r7], #0x1
    sub r6, r6, #0x1
    cmp r0, #0xff
    bne .L_dc
    mov r0, r7
    mov r1, r6
    bl func_0206b3d8
    cmp r0, r9
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r7, r7, r0
    sub r6, r6, r0
    b .L_dc
.L_bc:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6c60
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_dc:
    cmp r6, #0x0
    addlt sp, sp, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_30
.L_f8:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02101cf4
_LIT1: .word data_02101cd0
_LIT2: .word 0x00000317
