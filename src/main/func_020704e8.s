; func_020704e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219eec0
        .extern data_021a63d0
        .extern func_020705d4
        .extern func_02072f00
        .extern func_02073040
        .extern func_020747e0
        .global func_020704e8
        .arm
func_020704e8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr ip, _LIT0
    mov r7, r1
    ldr ip, [ip, #0x4]
    mov r6, r2
    ldr r4, [ip, #0xa4]
    mov r5, r3
    cmp r4, #0x0
    beq .L_950
    ldrb ip, [r4, #0x8]
    cmp ip, #0xa
    bne .L_8e0
    cmp r7, #0x0
    beq .L_8c0
    mov r2, r4
    bl func_02072f00
.L_8c0:
    cmp r5, #0x0
    beq .L_8d8
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02072f00
.L_8d8:
    add r0, r7, r5
    b .L_938
.L_8e0:
    cmp ip, #0xb
    bne .L_918
    cmp r7, #0x0
    beq .L_8f8
    mov r2, r4
    bl func_02073040
.L_8f8:
    cmp r5, #0x0
    beq .L_910
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_02073040
.L_910:
    add r0, r7, r5
    b .L_938
.L_918:
    ldrb ip, [r4, #0x9]
    cmp ip, #0x0
    beq .L_930
    str r4, [sp]
    bl func_020747e0
    b .L_938
.L_930:
    str r4, [sp]
    bl func_020705d4
.L_938:
    ldr r1, _LIT1
    ldrb r1, [r1]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
.L_950:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a63d0
_LIT1: .word data_0219eec0
