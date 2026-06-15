; func_0204cb54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498dc
        .extern func_020498f0
        .extern func_0204bd8c
        .extern func_0204bf00
        .extern func_0204ce90
        .extern func_02050054
        .extern func_02065788
        .global func_0204cb54
        .arm
func_0204cb54:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_1acc
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_1ab4
    bl func_0204bd8c
.L_1ab4:
    ldr r1, _LIT0
    mov r0, #0x6
    bl func_02050054
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_1acc:
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    strb r0, [r5, #0x14]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x208]
    bl func_020498f0
    ldr r0, [r0, #0x19c]
    cmp r0, #0x0
    beq .L_1b14
    bl func_020498f0
    ldr r0, [r0, #0x19c]
    bl func_02065788
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x19c]
.L_1b14:
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_1b2c
    bl func_0204bf00
    b .L_1b40
.L_1b2c:
    mov r0, #0x4
    bl func_020498dc
    mov r0, #0x0
    bl func_0204ce90
    mov r4, r0
.L_1b40:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0xfffec5d2
