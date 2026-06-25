; func_02026b38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c68ec
        .extern data_020c68f0
        .extern Task_Invoke
        .extern func_0200adbc
        .extern func_0200af08
        .extern func_0200afc8
        .extern func_0200b59c
        .extern func_0200b614
        .extern func_0200f044
        .extern func_0200f13c
        .extern func_0202162c
        .extern func_02021660
        .extern func_0207dca8
        .extern func_0207dcf8
        .extern func_0207dd20
        .extern func_020a978c
        .global func_02026b38
        .arm
func_02026b38:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x88
    mov r7, r1
    mov r1, r7, lsl #0x18
    mov r6, r2
    mov r5, r3
    add r4, r0, #0x94
    movs r7, r1, asr #0x18
    bmi .L_b98
    add r0, r4, r7, lsl #0x2
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_b98
    bl Task_Invoke
    add r0, r4, r7, lsl #0x2
    mov r1, #0x0
    str r1, [r0, #0x4]
.L_b98:
    ldrb r0, [r4, #0x16]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_bcc
    bl func_0202162c
    ldrsh r2, [r4, #0x14]
    mov r1, #0x3
    bl func_02021660
    add r0, r0, r7, lsl #0x2
    ldr r2, [r0, #0x98]
    add r0, r4, r7, lsl #0x2
    str r2, [r0, #0x4]
    b .L_bec
.L_bcc:
    cmp r7, #0x0
    ldrlt r2, [r4]
    blt .L_bec
    ldr r0, [r5]
    bl func_0200adbc
    mov r2, r0
    add r0, r4, r7, lsl #0x2
    str r2, [r0, #0x4]
.L_bec:
    ldr r1, _LIT0
    add r0, sp, #0x20
    bl func_0207dd20
    cmp r0, #0x0
    addeq sp, sp, #0x88
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    tst r6, #0x1
    beq .L_cac
    ldr r0, [r4, #0x10]
    ldr r0, [r0, #0x80]
    cmp r0, #0x0
    beq .L_c28
    tst r6, #0x80
    bne .L_cac
.L_c28:
    cmp r0, #0x0
    beq .L_c4c
    bl func_0200af08
    ldr r0, [r4, #0x10]
    mov r1, #0x0
    str r1, [r0, #0x80]
    ldrb r0, [r4, #0x17]
    bic r0, r0, #0x1
    strb r0, [r4, #0x17]
.L_c4c:
    ldr r2, [r5, #0x8]
    cmp r2, #0x0
    beq .L_cac
    ldr r1, _LIT1
    add r0, sp, #0x0
    bl func_020a978c
    add r0, sp, #0x0
    bl func_0207dca8
    bl func_0200b59c
    ldr r2, [r4, #0x10]
    mov r1, #0x0
    str r0, [r2, #0x80]
    ldrb r0, [r4, #0x17]
    mov r2, r1
    mov r3, #0x1
    orr r0, r0, #0x1
    strb r0, [r4, #0x17]
    ldr r0, [r4, #0x10]
    bl func_0200f044
    mov r1, #0x1
    ldr r0, [r4, #0x10]
    mov r2, #0x0
    mov r3, r1
    bl func_0200f044
.L_cac:
    tst r6, #0x4
    beq .L_d50
    ldr r0, [r4, #0x10]
    ldr r0, [r0, #0x88]
    cmp r0, #0x0
    beq .L_ccc
    tst r6, #0x80
    bne .L_d50
.L_ccc:
    cmp r0, #0x0
    beq .L_cf0
    bl func_0200afc8
    ldr r0, [r4, #0x10]
    mov r1, #0x0
    str r1, [r0, #0x88]
    ldrb r0, [r4, #0x17]
    bic r0, r0, #0x4
    strb r0, [r4, #0x17]
.L_cf0:
    ldr r2, [r5, #0x10]
    cmp r2, #0x0
    beq .L_d50
    ldr r1, _LIT1
    add r0, sp, #0x0
    bl func_020a978c
    add r0, sp, #0x0
    bl func_0207dca8
    bl func_0200b614
    ldr r2, [r4, #0x10]
    mov r1, #0x0
    str r0, [r2, #0x88]
    ldrb r0, [r4, #0x17]
    mov r2, r1
    mov r3, #0x1
    orr r0, r0, #0x4
    strb r0, [r4, #0x17]
    ldr r0, [r4, #0x10]
    bl func_0200f13c
    mov r1, #0x1
    ldr r0, [r4, #0x10]
    mov r2, #0x0
    mov r3, r1
    bl func_0200f13c
.L_d50:
    add r0, sp, #0x20
    bl func_0207dcf8
    mov r0, #0x1
    add sp, sp, #0x88
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_020c68ec
_LIT1: .word data_020c68f0
