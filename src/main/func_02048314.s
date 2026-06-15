; func_02048314 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc80
        .extern func_02048108
        .extern func_020489f8
        .extern func_02048fac
        .extern func_02052ddc
        .extern func_02052df4
        .extern func_02052f04
        .extern func_020535d4
        .extern func_02053644
        .extern func_02053650
        .extern func_020aaf40
        .global func_02048314
        .arm
func_02048314:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24
    mov sl, r1
    ldr r0, [sl]
    mov r8, #0x0
    cmp r0, #0x0
    mov r0, #0x1
    str r0, [sp]
    addne sp, sp, #0x24
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r4, _LIT0
    mov r9, r8
    ldr r2, [r4]
    ldr r1, [r2, #0x14]
    cmp r1, #0x0
    ble .L_168
    mov r7, r8
    str r0, [sp, #0x4]
    mov fp, r8
    mov r5, r0
.L_50:
    ldr r0, [r2, #0x18]
    add r0, r0, r7
    bl func_02053644
    cmp r0, #0x1
    bne .L_bc
    bl func_02048108
    ldr r1, [r4]
    add r2, sp, #0x8
    ldr r1, [r1, #0x18]
    add r1, r1, r7
    bl func_02052ddc
    add r0, sp, #0x8
    add r1, sl, #0x8e
    bl func_020aaf40
    cmp r0, #0x0
    bne .L_150
    ldr r0, [r4]
    ldr r1, [sl, #0x4]
    ldr r0, [r0, #0x18]
    add r0, r0, r7
    bl func_02052df4
    ldr r0, [r4]
    ldr r0, [r0, #0x18]
    add r0, r0, r7
    bl func_020535d4
    mov r8, r5
    b .L_150
.L_bc:
    ldr r0, [r4]
    ldr r0, [r0, #0x18]
    add r0, r0, r7
    bl func_02053644
    cmp r0, #0x3
    beq .L_ec
    ldr r0, [r4]
    ldr r0, [r0, #0x18]
    add r0, r0, r7
    bl func_02053644
    cmp r0, #0x2
    bne .L_150
.L_ec:
    ldr r0, [r4]
    ldr r0, [r0, #0x18]
    add r0, r0, r7
    bl func_02053650
    cmp r0, #0x1
    streq fp, [sp]
    beq .L_150
    ldr r6, [sl, #0x4]
    bl func_02048108
    ldr r1, [r4]
    ldr r1, [r1, #0x18]
    add r1, r1, r7
    bl func_02052f04
    cmp r6, r0
    bne .L_150
    ldr r0, [r4]
    mov r1, r6
    ldr r0, [r0, #0x18]
    add r0, r0, r7
    bl func_02052df4
    ldr r0, [r4]
    ldr r0, [r0, #0x18]
    add r0, r0, r7
    bl func_020535d4
    ldr r8, [sp, #0x4]
.L_150:
    ldr r2, [r4]
    add r9, r9, #0x1
    ldr r1, [r2, #0x14]
    add r7, r7, #0xc
    cmp r9, r1
    blt .L_50
.L_168:
    cmp r8, #0x0
    addeq sp, sp, #0x24
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r2, #0x18]
    ldr r2, [sl, #0x4]
    bl func_020489f8
    ldr r1, [sp]
    cmp r1, #0x0
    beq .L_190
    bl func_02048fac
.L_190:
    ldr r0, _LIT0
    mov r1, #0x1
    ldr r0, [r0]
    strb r1, [r0, #0x1d]
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219dc80
