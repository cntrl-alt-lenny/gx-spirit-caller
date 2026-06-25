; func_0204739c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da0c
        .extern func_02047fdc
        .extern func_02048f24
        .extern func_0204f724
        .extern func_02052310
        .extern func_02055f10
        .extern func_02055f78
        .extern func_02055fc4
        .extern func_02060edc
        .extern func_02062764
        .extern func_02065dcc
        .extern func_020672e0
        .extern func_02068ee0
        .global func_0204739c
        .arm
func_0204739c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldr r0, [r0, #0x364]
    cmp r0, #0x0
    beq .L_2c8
    bl func_020672e0
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x364]
.L_2c8:
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    strb r2, [r1, #0x36c]
    ldr r0, [r0]
    ldr r0, [r0, #0x438]
    cmp r0, #0x0
    beq .L_2fc
    bl func_02068ee0
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x438]
.L_2fc:
    bl func_02065dcc
    bl func_02060edc
    ldr r0, _LIT0
    ldr ip, [r0]
    ldr r0, [ip, #0x1c]
    cmp r0, #0x0
    beq .L_3b0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, ip, #0x1c
    bl func_02055f10
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0]
    mov r3, r2
    add r0, r0, #0x1c
    mov r1, #0x3
    bl func_02055f10
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0]
    mov r3, r2
    add r0, r0, #0x1c
    mov r1, #0x1
    bl func_02055f10
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0]
    mov r1, #0x2
    add r0, r0, #0x1c
    mov r3, r2
    bl func_02055f10
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x1c
    bl func_02055f78
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x1c
    bl func_02055fc4
    mov r1, #0x0
    ldr r0, _LIT0
    ldr r0, [r0]
    str r1, [r0, #0x1c]
.L_3b0:
    bl func_02047fdc
    bl func_02048f24
    bl func_0204f724
    bl func_02052310
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_3e8
    bl func_02062764
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0]
.L_3e8:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219da0c
