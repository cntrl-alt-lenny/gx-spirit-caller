; func_02056034 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffc70
        .extern data_020ffd68
        .extern data_020ffd70
        .extern func_020552b0
        .extern func_020561f0
        .extern func_020581d0
        .extern func_02058654
        .extern func_020588e0
        .extern func_0205bc98
        .extern func_0205bce4
        .extern func_0205bea4
        .extern func_0205c7bc
        .extern func_0205d9d4
        .extern func_020a6c60
        .global func_02056034
        .arm
func_02056034:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov sl, r0
    ldr r7, [sl]
    mov r9, r1
    ldr r0, [r7, #0x1d8]
    mov r6, #0x0
    cmp r0, #0x4
    bls .L_38
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, r6
    bl func_020a6c60
.L_38:
    ldr r0, [r7, #0x1d8]
    cmp r0, #0x1
    bne .L_d4
    mov r4, #0x0
    mov r5, #0x1
    mov fp, #0xa
.L_50:
    mov r0, sl
    bl func_020588e0
    movs r6, r0
    bne .L_78
    cmp r9, #0x0
    beq .L_78
    ldr r0, [r7, #0x1d8]
    cmp r0, #0x1
    moveq r8, r5
    beq .L_7c
.L_78:
    mov r8, r4
.L_7c:
    cmp r8, #0x0
    beq .L_8c
    mov r0, fp
    bl func_020552b0
.L_8c:
    cmp r8, #0x0
    bne .L_50
    cmp r6, #0x0
    beq .L_d4
    add r1, sp, #0x0
    mov r0, sl
    mov r2, #0x1
    bl func_0205bc98
    cmp r0, #0x0
    ldrne r0, [sp]
    movne r1, #0x4
    strne r1, [r0, #0x1c]
    bne .L_d4
    ldr r0, _LIT3
    ldr r1, _LIT1
    ldr r3, _LIT4
    mov r2, #0x0
    bl func_020a6c60
.L_d4:
    ldr r0, [r7, #0x1d8]
    sub r0, r0, #0x2
    cmp r0, #0x1
    bhi .L_10c
    cmp r6, #0x0
    bne .L_f8
    mov r0, sl
    bl func_020561f0
    mov r6, r0
.L_f8:
    cmp r6, #0x0
    bne .L_10c
    mov r0, sl
    bl func_0205c7bc
    mov r6, r0
.L_10c:
    cmp r6, #0x0
    bne .L_120
    mov r0, sl
    bl func_0205d9d4
    mov r6, r0
.L_120:
    ldr r1, [r7, #0x424]
    str r1, [sp]
    cmp r1, #0x0
    beq .L_16c
.L_130:
    ldr r0, [r1, #0x1c]
    cmp r0, #0x0
    ldreq r0, [r1, #0x20]
    streq r0, [sp]
    beq .L_160
    mov r0, sl
    bl func_0205bea4
    ldr r1, [sp]
    mov r0, sl
    ldr r2, [r1, #0x20]
    str r2, [sp]
    bl func_0205bce4
.L_160:
    ldr r1, [sp]
    cmp r1, #0x0
    bne .L_130
.L_16c:
    mov r0, sl
    mov r1, r9
    bl func_020581d0
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r7, #0x41c]
    cmp r0, #0x0
    beq .L_19c
    mov r0, sl
    mov r1, #0x0
    bl func_02058654
.L_19c:
    mov r0, r6
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020ffc70
_LIT1: .word data_020ffd68
_LIT2: .word 0x000001b5
_LIT3: .word data_020ffd70
_LIT4: .word 0x000001db
