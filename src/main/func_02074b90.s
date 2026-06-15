; func_02074b90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ef0c
        .extern func_02075928
        .extern func_02075ae8
        .extern func_02075d74
        .global func_02074b90
        .arm
func_02074b90:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    ldr r4, [r5, #0xc]
    mov r6, r0
    ldr ip, [r4, #0x824]
    cmp ip, #0x0
    beq .L_4bc
    ldrb r0, [r4, #0x456]
    cmp r0, #0x0
    bne .L_4bc
    ldr r3, [r4, #0x82c]
    ldr r1, [r4, #0x828]
    mov r2, r5
    add r0, ip, r3
    sub r1, r1, r3
    bl func_02075d74
    cmp r0, #0x0
    beq .L_4a0
    ldr r1, _LIT0
    ldr r0, [r4, #0x824]
    ldr r1, [r1]
    blx r1
    mov r0, #0x0
    str r0, [r4, #0x824]
    str r0, [r6]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_4a0:
    ldr r1, [r4, #0x824]
    mov r0, r4
    bl func_02075ae8
    ldrb r0, [r4, #0x456]
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r4, #0x824]
.L_4bc:
    ldr r0, [r4, #0x824]
    cmp r0, #0x0
    bne .L_4f0
.L_4c8:
    mov r0, r5
    bl func_02075928
    cmp r0, #0x9
    moveq r0, #0x0
    streq r0, [r6]
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldr r0, [r4, #0x824]
    cmp r0, #0x0
    beq .L_4c8
.L_4f0:
    ldr r1, [r4, #0x828]
    ldr r0, [r4, #0x82c]
    sub r0, r1, r0
    str r0, [r6]
    ldr r1, [r4, #0x824]
    ldr r0, [r4, #0x82c]
    add r0, r1, r0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_0219ef0c
