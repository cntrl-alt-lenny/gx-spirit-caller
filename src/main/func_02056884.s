; func_02056884 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fff64
        .extern data_020fff78
        .extern data_020fff84
        .extern data_020fff90
        .extern data_020fffa0
        .extern data_020fffa8
        .extern data_020fffb4
        .extern data_020fffc0
        .extern func_020453b4
        .extern func_02056a34
        .extern func_02058038
        .extern func_02058070
        .extern func_0205d4c0
        .extern func_0205d560
        .extern func_0205d674
        .extern func_0205d6bc
        .extern func_0205ffc0
        .extern func_020a6d54
        .global func_02056884
        .arm
func_02056884:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    add r2, sp, #0x0
    ldr r5, [r6]
    bl func_0205d6bc
    cmp r0, #0x0
    bne .L_1c8
    ldr r1, _LIT0
    mov r0, r6
    bl func_0205ffc0
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_1c8:
    ldr r2, _LIT1
    mov r0, r6
    add r1, r5, #0x1f4
    bl func_02058070
    ldr r2, _LIT2
    mov r0, r6
    add r1, r5, #0x1f4
    bl func_02058070
    ldr r2, [r5, #0x198]
    mov r0, r6
    add r1, r5, #0x1f4
    bl func_02058038
    ldr r2, _LIT3
    mov r0, r6
    add r1, r5, #0x1f4
    bl func_02058070
    mov r0, r6
    add r1, r5, #0x1f4
    ldr r2, [sp]
    ldr r2, [r2]
    bl func_02058038
    mov r0, r6
    add r1, r5, #0x1f4
    ldr r2, _LIT4
    bl func_02058070
    ldr r0, [sp]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_30c
    ldr r4, [r0]
    cmp r4, #0x0
    bge .L_25c
    ldr r0, _LIT5
    ldr r1, _LIT6
    ldr r3, _LIT7
    mov r2, #0x0
    bl func_020a6d54
.L_25c:
    ldr r0, [sp]
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0x8]
    bl func_020453b4
    ldr r0, [sp]
    mov r1, #0x0
    ldr r0, [r0, #0x8]
    str r1, [r0, #0x8]
    ldr r0, [sp]
    ldr r0, [r0, #0x8]
    ldr r0, [r0, #0xc]
    bl func_020453b4
    ldr r0, [sp]
    mov r1, #0x0
    ldr r0, [r0, #0x8]
    str r1, [r0, #0xc]
    ldr r0, [sp]
    ldr r0, [r0, #0x8]
    bl func_020453b4
    ldr r0, [sp]
    mov r1, #0x0
    str r1, [r0, #0x8]
    ldr r0, [sp]
    bl func_0205d4c0
    cmp r0, #0x0
    beq .L_2d0
    ldr r1, [sp]
    mov r0, r6
    bl func_0205d674
.L_2d0:
    ldr r0, [r5, #0x430]
    sub r0, r0, #0x1
    str r0, [r5, #0x430]
    ldr r0, [r5, #0x430]
    cmp r0, #0x0
    bge .L_2fc
    ldr r0, _LIT8
    ldr r1, _LIT6
    mov r2, #0x0
    mov r3, #0x204
    bl func_020a6d54
.L_2fc:
    ldr r1, _LIT9
    mov r0, r6
    mov r2, r4
    bl func_0205d560
.L_30c:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020fff64
_LIT1: .word data_020fff78
_LIT2: .word data_020fff84
_LIT3: .word data_020fff90
_LIT4: .word data_020fffa0
_LIT5: .word data_020fffa8
_LIT6: .word data_020fffb4
_LIT7: .word 0x000001fd
_LIT8: .word data_020fffc0
_LIT9: .word func_02056a34
