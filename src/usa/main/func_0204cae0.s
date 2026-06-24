; func_0204cae0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02049868
        .extern func_0204987c
        .extern func_0204bd18
        .extern func_0204be8c
        .extern func_0204ce1c
        .extern func_0204ffe0
        .extern func_02065714
        .global func_0204cae0
        .arm
func_0204cae0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_790
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_778
    bl func_0204bd18
.L_778:
    ldr r1, _LIT0
    mov r0, #0x6
    bl func_0204ffe0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_790:
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    strb r0, [r5, #0x14]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x200]
    bl func_0204987c
    ldr r0, [r0, #0x194]
    cmp r0, #0x0
    beq .L_7d8
    bl func_0204987c
    ldr r0, [r0, #0x194]
    bl func_02065714
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x194]
.L_7d8:
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_7f0
    bl func_0204be8c
    b .L_804
.L_7f0:
    mov r0, #0x4
    bl func_02049868
    mov r0, #0x0
    bl func_0204ce1c
    mov r4, r0
.L_804:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0xfffec5d2
