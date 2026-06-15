; func_0205da48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100e20
        .extern data_02100e30
        .extern data_02100e50
        .extern func_020453b4
        .extern func_020453e8
        .extern func_0205bd58
        .extern func_0205dba4
        .extern func_0205ffc0
        .extern func_020a6d54
        .global func_0205da48
        .arm
func_0205da48:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov sl, r0
    ldr r9, [sl]
    mov r6, #0x0
    ldr r0, [r9, #0x210]
    cmp r0, #0x0
    ble .L_140
    mov r0, r0, lsl #0x2
    bl func_020453e8
    movs r8, r0
    bne .L_48
    ldr r1, _LIT0
    mov r0, sl
    bl func_0205ffc0
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_48:
    ldr r7, [r9, #0x424]
    cmp r7, #0x0
    beq .L_c4
    ldr fp, _LIT1
    mov r5, r6
    mov r4, #0x1
.L_60:
    ldr r0, [r7]
    cmp r0, #0x3
    bne .L_b8
    ldr r0, [r7, #0x14]
    cmp r0, #0x5
    beq .L_b8
    ldr r0, [r7, #0x4]
    ldr r0, [r0, #0x13c]
    cmp r0, #0x0
    bne .L_b8
    ldr r0, [r9, #0x210]
    cmp r6, r0
    blt .L_a8
    ldr r1, _LIT2
    ldr r3, _LIT3
    mov r0, fp
    mov r2, r5
    bl func_020a6d54
.L_a8:
    str r7, [r8, r6, lsl #0x2]
    ldr r0, [r7, #0x4]
    add r6, r6, #0x1
    str r4, [r0, #0x13c]
.L_b8:
    ldr r7, [r7, #0x20]
    cmp r7, #0x0
    bne .L_60
.L_c4:
    cmp r6, #0x0
    mov r4, #0x0
    ble .L_f4
.L_d0:
    ldr r1, [r8, r4, lsl #0x2]
    mov r0, sl
    bl func_0205dba4
    cmp r0, #0x0
    ldrne r1, [r8, r4, lsl #0x2]
    add r4, r4, #0x1
    strne r0, [r1, #0x1c]
    cmp r4, r6
    blt .L_d0
.L_f4:
    cmp r6, #0x0
    mov r4, #0x0
    ble .L_138
    mov r5, r4
.L_104:
    ldr r0, [r8, r4, lsl #0x2]
    mov r1, r4, lsl #0x2
    ldr r0, [r0, #0x4]
    str r5, [r0, #0x13c]
    ldr r0, [r0, #0x140]
    cmp r0, #0x0
    beq .L_12c
    ldr r1, [r8, r1]
    mov r0, sl
    bl func_0205bd58
.L_12c:
    add r4, r4, #0x1
    cmp r4, r6
    blt .L_104
.L_138:
    mov r0, r8
    bl func_020453b4
.L_140:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02100e20
_LIT1: .word data_02100e30
_LIT2: .word data_02100e50
_LIT3: .word 0x00000563
