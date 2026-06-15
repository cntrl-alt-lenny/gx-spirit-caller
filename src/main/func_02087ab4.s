; func_02087ab4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c31f8
        .extern data_021a4868
        .extern func_0207cfdc
        .extern func_02087690
        .extern func_02087790
        .extern func_0208b040
        .extern func_0208b058
        .extern func_0208b070
        .extern func_020951e8
        .extern func_02095244
        .extern func_02095554
        .extern func_02095d34
        .global func_02087ab4
        .arm
func_02087ab4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    bl func_02095d34
    str r0, [sp]
    ldr r0, _LIT0
    mov r1, #0x0
    bl func_0207cfdc
    movs sl, r0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x8000
    rsb r0, r0, #0x0
    ldr r4, _LIT1
    str r0, [sp, #0x4]
    mov r5, #0x1
    mov fp, #0x0
.L_ec:
    ldr r0, _LIT0
    mov r1, sl
    bl func_0207cfdc
    ldrb r1, [sl, #0x2d]
    mov r9, r0
    cmp r1, #0x0
    bne .L_118
    ldr r0, [sl, #0x30]
    bl func_02095554
    cmp r0, #0x0
    strneb r5, [sl, #0x2d]
.L_118:
    ldrb r0, [sl, #0x2d]
    cmp r0, #0x0
    beq .L_144
    ldrb r0, [sl, #0x3c]
    mov r1, r5, lsl r0
    ldr r0, [sp]
    ands r0, r0, r1
    bne .L_144
    mov r0, sl
    bl func_02087690
    b .L_20c
.L_144:
    add r0, sl, #0x1c
    bl func_0208b058
    ldr r0, [sl, #0x4]
    ldrb r2, [sl, #0x41]
    ldrb r1, [sl, #0x40]
    ldrb r0, [r0, #0x20]
    mov r3, r2, lsl #0x1
    mov r2, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    add r0, sl, #0x1c
    ldrsh r8, [r4, r3]
    ldrsh r7, [r4, r2]
    ldrsh r6, [r4, r1]
    bl func_0208b070
    mov r0, r0, asr #0x8
    mov r2, r0, lsl #0x1
    add r1, r7, r8
    mov r0, #0x8000
    ldrsh r2, [r4, r2]
    add r1, r6, r1
    rsb r0, r0, #0x0
    add r6, r2, r1
    cmp r6, r0
    ldrlt r6, [sp, #0x4]
    blt .L_1b4
    ldr r0, _LIT2
    cmp r6, r0
    movgt r6, r0
.L_1b4:
    ldrsh r0, [sl, #0x3e]
    cmp r6, r0
    beq .L_1d0
    ldrb r0, [sl, #0x3c]
    mov r1, r6
    bl func_020951e8
    strh r6, [sl, #0x3e]
.L_1d0:
    ldrb r0, [sl, #0x2c]
    cmp r0, #0x2
    bne .L_1f4
    add r0, sl, #0x1c
    bl func_0208b040
    cmp r0, #0x0
    beq .L_1f4
    mov r0, sl
    bl func_02087790
.L_1f4:
    ldrb r0, [sl, #0x2f]
    cmp r0, #0x0
    beq .L_20c
    ldrb r0, [sl, #0x3c]
    bl func_02095244
    strb fp, [sl, #0x2f]
.L_20c:
    mov sl, r9
    cmp r9, #0x0
    bne .L_ec
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021a4868
_LIT1: .word data_020c31f8
_LIT2: .word 0x00007fff
