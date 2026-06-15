; func_02048c68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc80
        .extern func_02048108
        .extern func_0204861c
        .extern func_02048880
        .extern func_020489c4
        .extern func_02048b08
        .extern func_0204918c
        .extern func_02052ddc
        .extern func_02052df4
        .extern func_02052f04
        .extern func_020535d4
        .extern func_02053650
        .extern func_02055654
        .extern func_02055738
        .extern func_020557b8
        .extern func_020558fc
        .extern func_02055d58
        .global func_02048c68
        .arm
func_02048c68:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24c
    ldr r2, _LIT0
    mov r6, r0
    ldr r2, [r2]
    mov r5, r1
    ldrb r0, [r2, #0x1e]
    cmp r0, #0x0
    bne .L_a80
    ldr r0, [r2, #0x4]
    add r1, sp, #0x18
    bl func_020558fc
    bl func_02048880
    ldr r0, [sp, #0x18]
    mov fp, #0x0
    str fp, [sp, #0x1c]
    cmp r0, #0x0
    ble .L_a70
    ldr r8, _LIT0
    mov r9, #0x1
    mov r7, #0xc
.L_9a8:
    ldr r0, [r8]
    ldr r1, [sp, #0x1c]
    ldr r0, [r0, #0x4]
    add r2, sp, #0x38
    bl func_020557b8
    bl func_02048880
    mov r4, fp
    cmp r5, #0x0
    ble .L_a24
.L_9cc:
    mov r0, r4
    bl func_0204918c
    ldr r1, [sp, #0x38]
    cmp r1, r0
    bne .L_a18
    mul sl, r4, r7
    add r0, r6, sl
    bl func_02053650
    cmp r0, #0x0
    bne .L_a24
    add sl, r6, sl
    ldr r1, [sp, #0x38]
    mov r0, sl
    bl func_02052df4
    mov r0, sl
    bl func_020535d4
    ldr r0, [r8]
    strb r9, [r0, #0x1d]
    b .L_a24
.L_a18:
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_9cc
.L_a24:
    cmp r4, r5
    bne .L_a58
    ldr r0, [r8]
    ldr r1, [sp, #0x38]
    ldr r0, [r0, #0x4]
    bl func_02055654
    bl func_02048880
    ldr r1, [sp, #0x18]
    ldr r0, [sp, #0x1c]
    sub r1, r1, #0x1
    sub r0, r0, #0x1
    str r1, [sp, #0x18]
    str r0, [sp, #0x1c]
.L_a58:
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x18]
    add r1, r1, #0x1
    str r1, [sp, #0x1c]
    cmp r1, r0
    blt .L_9a8
.L_a70:
    ldr r0, _LIT0
    mov r1, #0x1
    ldr r0, [r0]
    strb r1, [r0, #0x1e]
.L_a80:
    ldr sl, _LIT0
    ldr r0, [sl]
    ldrb r0, [r0, #0x1c]
    cmp r0, r5
    addge sp, sp, #0x24c
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r4, sp, #0x1c
    mov r8, #0xc
    mvn r9, #0x0
.L_aa4:
    bl func_0204918c
    movs r7, r0
    beq .L_afc
    ldr r1, [sl]
    mov r0, r6
    ldrb r1, [r1, #0x1c]
    mov r2, r7
    bl func_02048b08
    cmp r0, #0x0
    bne .L_b90
    ldr r0, [sl]
    mov r1, r7
    ldr r0, [r0, #0x4]
    mov r2, r4
    bl func_02055738
    bl func_02048880
    ldr r0, [sp, #0x1c]
    cmp r0, r9
    bne .L_b90
    mov r0, r7
    bl func_020489c4
    b .L_b90
.L_afc:
    bl func_02048108
    ldr r1, [sl]
    ldrb r2, [r1, #0x1c]
    mla r1, r2, r8, r6
    bl func_02052f04
    cmp r0, r9
    bne .L_b90
    bl func_02048108
    ldr r2, _LIT0
    mov r1, #0xc
    ldr r3, [r2]
    add r2, sp, #0x20
    ldrb r3, [r3, #0x1c]
    mla r1, r3, r1, r6
    bl func_02052ddc
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r4, [r0]
    add r2, sp, #0x20
    str r1, [sp]
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r0, _LIT1
    str r1, [sp, #0xc]
    str r0, [sp, #0x10]
    ldrb r0, [r4, #0x1c]
    mov r2, r1
    mov r3, r1
    str r0, [sp, #0x14]
    ldr r0, [r4, #0x4]
    bl func_02055d58
    ldr r0, _LIT0
    mov r1, #0x2
    ldr r0, [r0]
    add sp, sp, #0x24c
    strb r1, [r0, #0x1e]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b90:
    ldr r1, [sl]
    ldrb r0, [r1, #0x1c]
    add r0, r0, #0x1
    strb r0, [r1, #0x1c]
    ldr r0, [sl]
    ldrb r0, [r0, #0x1c]
    cmp r0, r5
    blt .L_aa4
    add sp, sp, #0x24c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219dc80
_LIT1: .word func_0204861c
