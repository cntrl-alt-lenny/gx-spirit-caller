; func_020549bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020549bc
        .arm
func_020549bc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r2, #0x0
    mov lr, #0x0
    ble .L_168
    add ip, sp, #0x0
.L_154:
    ldrsb r3, [r0, lr]
    add lr, lr, #0x1
    cmp lr, r2
    strb r3, [ip], #0x1
    blt .L_154
.L_168:
    cmp lr, #0x3
    bge .L_18c
    add r0, sp, #0x0
    add r2, r0, lr
    mov r0, #0x0
.L_17c:
    add lr, lr, #0x1
    cmp lr, #0x3
    strb r0, [r2], #0x1
    blt .L_17c
.L_18c:
    ldrb r0, [sp]
    mov r0, r0, asr #0x2
    strb r0, [r1]
    ldrb r2, [sp]
    ldrb r0, [sp, #0x1]
    and r2, r2, #0x3
    mov r2, r2, lsl #0x4
    orr r0, r2, r0, asr #0x4
    strb r0, [r1, #0x1]
    ldrb r2, [sp, #0x1]
    ldrb r0, [sp, #0x2]
    and r2, r2, #0xf
    mov r2, r2, lsl #0x2
    orr r0, r2, r0, asr #0x6
    strb r0, [r1, #0x2]
    ldrb r0, [sp, #0x2]
    and r0, r0, #0x3f
    strb r0, [r1, #0x3]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
