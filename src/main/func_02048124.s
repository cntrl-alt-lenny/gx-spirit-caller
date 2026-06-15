; func_02048124 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc78
        .extern func_02045280
        .extern func_020479ec
        .extern func_020480b4
        .extern func_02055fec
        .extern func_020930b0
        .extern func_020b3808
        .global func_02048124
        .arm
func_02048124:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_02045280
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    ldr r0, _LIT0
    ldr r1, [r0]
    ldr r0, [r1, #0x4]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_100
    b .L_100
    b .L_5c
    b .L_68
    b .L_68
    b .L_68
    b .L_100
.L_5c:
    bl func_020479ec
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_68:
    ldr r0, [r1]
    cmp r0, #0x0
    beq .L_84
    ldr r1, [r0]
    cmp r1, #0x0
    beq .L_84
    bl func_02055fec
.L_84:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x30]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_020930b0
    ldr r3, _LIT0
    ldr r2, _LIT1
    ldr ip, [r3]
    mov r3, #0x0
    ldr lr, [ip, #0x34]
    ldr ip, [ip, #0x38]
    subs lr, r0, lr
    sbc r0, r1, ip
    mov r1, r0, lsl #0x6
    orr r1, r1, lr, lsr #0x1a
    mov r0, lr, lsl #0x6
    bl func_020b3808
    ldr r2, _LIT2
    cmp r1, #0x0
    cmpeq r0, r2
    addls sp, sp, #0x4
    ldmlsfd sp!, {pc}
    ldr r1, _LIT3
    mov r0, #0x6
    bl func_020480b4
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x30]
.L_100:
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219dc78
_LIT1: .word 0x000082ea
_LIT2: .word 0x0000ea60
_LIT3: .word 0xffff1172
