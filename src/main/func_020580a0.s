; func_020580a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021000b8
        .extern data_021000d0
        .extern data_02100154
        .extern data_02100240
        .extern data_02100250
        .extern func_020453cc
        .extern func_0205ffc0
        .extern func_020a6d54
        .extern func_020a7368
        .global func_020580a0
        .arm
func_020580a0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    movs r8, r2
    mov sl, r0
    mov r9, r1
    mov r7, r3
    bne .L_2c
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x51
    bl func_020a6d54
.L_2c:
    cmp r7, #0x0
    bge .L_48
    ldr r0, _LIT2
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x52
    bl func_020a6d54
.L_48:
    cmp r9, #0x0
    bne .L_64
    ldr r0, _LIT3
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x53
    bl func_020a6d54
.L_64:
    cmp r8, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r6, [r9, #0x8]
    ldr r5, [r9, #0x4]
    ldr r4, [r9]
    sub r0, r5, r6
    cmp r0, r7
    bge .L_c0
    cmp r7, #0x800
    movlt r0, #0x800
    movge r0, r7
    add r5, r5, r0
    mov r0, r4
    add r1, r5, #0x1
    bl func_020453cc
    movs r4, r0
    bne .L_c0
    ldr r1, _LIT4
    mov r0, sl
    bl func_0205ffc0
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_c0:
    mov r1, r8
    mov r2, r7
    add r0, r4, r6
    bl func_020a7368
    add r1, r6, r7
    mov r0, #0x0
    strb r0, [r4, r1]
    ldr r1, [r9, #0x8]
    add r1, r1, r7
    str r1, [r9, #0x8]
    str r5, [r9, #0x4]
    str r4, [r9]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_02100240
_LIT1: .word data_021000d0
_LIT2: .word data_02100250
_LIT3: .word data_021000b8
_LIT4: .word data_02100154
