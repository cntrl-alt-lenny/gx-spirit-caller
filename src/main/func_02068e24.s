; func_02068e24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101928
        .extern data_02101d80
        .extern func_02055324
        .extern func_02067b8c
        .extern func_02068d0c
        .extern func_0206ab88
        .extern func_020a978c
        .extern func_020aaddc
        .global func_02068e24
        .arm
func_02068e24:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10c
    ldr r8, [sp, #0x130]
    mov sl, r0
    str r1, [sp, #0x4]
    add r4, sp, #0x8
    mov r9, r3
    mov r1, #0x40
    mov r0, #0x0
.L_124:
    strb r0, [r4], #0x1
    strb r0, [r4], #0x1
    strb r0, [r4], #0x1
    strb r0, [r4], #0x1
    subs r1, r1, #0x1
    bne .L_124
    mov r7, #0x0
    str r2, [sl, #0x620]
    mov r6, r7
    str r7, [sl, #0x40]
    cmp r8, #0x0
    ble .L_1ac
    ldr fp, _LIT0
.L_158:
    ldrb r0, [r9, r6]
    add r4, r9, r6
    ldr r5, [fp, r0, lsl #0x2]
    mov r0, r5
    bl func_020aaddc
    add r0, r7, r0
    add r0, r0, #0x1
    cmp r0, #0x100
    bge .L_1ac
    add r0, sp, #0x8
    ldr r1, _LIT1
    mov r2, r5
    add r0, r0, r7
    bl func_020a978c
    add r7, r7, r0
    ldrb r1, [r4]
    mov r0, sl
    bl func_02067b8c
    add r6, r6, #0x1
    cmp r6, r8
    blt .L_158
.L_1ac:
    ldr r4, [sp, #0x13c]
    ldr r2, [sp, #0x134]
    ldr r3, [sp, #0x138]
    add r1, sp, #0x8
    add r0, sl, #0x4c
    str r4, [sp]
    bl func_0206ab88
    cmp r0, #0x0
    addne sp, sp, #0x10c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [sp, #0x4]
    cmp r1, #0x0
    addne sp, sp, #0x10c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r4, #0xa
    b .L_1fc
.L_1ec:
    mov r0, r4
    bl func_02055324
    mov r0, sl
    bl func_02068d0c
.L_1fc:
    ldr r1, [sl, #0x4c]
    cmp r1, #0x3
    beq .L_1ec
    ldr r1, [sl, #0x10]
    cmp r1, #0x0
    addle sp, sp, #0x10c
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r0, #0x0
    beq .L_1ec
    add sp, sp, #0x10c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02101928
_LIT1: .word data_02101d80
