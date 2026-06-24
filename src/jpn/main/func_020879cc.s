; func_020879cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3104
        .extern data_021a4788
        .extern func_0207cef4
        .extern func_020875a8
        .extern func_020876a8
        .extern func_0208af58
        .extern func_0208af70
        .extern func_0208af88
        .extern func_020950f4
        .extern func_02095150
        .extern func_02095460
        .extern func_02095c40
        .global func_020879cc
        .arm
func_020879cc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    bl func_02095c40
    str r0, [sp]
    ldr r0, _LIT0
    mov r1, #0x0
    bl func_0207cef4
    movs sl, r0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x8000
    rsb r0, r0, #0x0
    ldr r4, _LIT1
    str r0, [sp, #0x4]
    mov r5, #0x1
    mov fp, #0x0
.L_40:
    ldr r0, _LIT0
    mov r1, sl
    bl func_0207cef4
    ldrb r1, [sl, #0x2d]
    mov r9, r0
    cmp r1, #0x0
    bne .L_6c
    ldr r0, [sl, #0x30]
    bl func_02095460
    cmp r0, #0x0
    strneb r5, [sl, #0x2d]
.L_6c:
    ldrb r0, [sl, #0x2d]
    cmp r0, #0x0
    beq .L_98
    ldrb r0, [sl, #0x3c]
    mov r1, r5, lsl r0
    ldr r0, [sp]
    ands r0, r0, r1
    bne .L_98
    mov r0, sl
    bl func_020875a8
    b .L_160
.L_98:
    add r0, sl, #0x1c
    bl func_0208af70
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
    bl func_0208af88
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
    blt .L_108
    ldr r0, _LIT2
    cmp r6, r0
    movgt r6, r0
.L_108:
    ldrsh r0, [sl, #0x3e]
    cmp r6, r0
    beq .L_124
    ldrb r0, [sl, #0x3c]
    mov r1, r6
    bl func_020950f4
    strh r6, [sl, #0x3e]
.L_124:
    ldrb r0, [sl, #0x2c]
    cmp r0, #0x2
    bne .L_148
    add r0, sl, #0x1c
    bl func_0208af58
    cmp r0, #0x0
    beq .L_148
    mov r0, sl
    bl func_020876a8
.L_148:
    ldrb r0, [sl, #0x2f]
    cmp r0, #0x0
    beq .L_160
    ldrb r0, [sl, #0x3c]
    bl func_02095150
    strb fp, [sl, #0x2f]
.L_160:
    mov sl, r9
    cmp r9, #0x0
    bne .L_40
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021a4788
_LIT1: .word data_020c3104
_LIT2: .word 0x00007fff
