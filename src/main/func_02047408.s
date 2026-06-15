; func_02047408 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219daec
        .extern func_02048050
        .extern func_02048f98
        .extern func_0204f798
        .extern func_02052384
        .extern func_02055f84
        .extern func_02055fec
        .extern func_02056038
        .extern func_02060f50
        .extern func_020627d8
        .extern func_02065e40
        .extern func_02067354
        .extern func_02068f54
        .global func_02047408
        .arm
func_02047408:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldr r0, [r0, #0x364]
    cmp r0, #0x0
    beq .L_7bc
    bl func_02067354
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x364]
.L_7bc:
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    strb r2, [r1, #0x36c]
    ldr r0, [r0]
    ldr r0, [r0, #0x438]
    cmp r0, #0x0
    beq .L_7f0
    bl func_02068f54
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x438]
.L_7f0:
    bl func_02065e40
    bl func_02060f50
    ldr r0, _LIT0
    ldr ip, [r0]
    ldr r0, [ip, #0x1c]
    cmp r0, #0x0
    beq .L_8a4
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, ip, #0x1c
    bl func_02055f84
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0]
    mov r3, r2
    add r0, r0, #0x1c
    mov r1, #0x3
    bl func_02055f84
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0]
    mov r3, r2
    add r0, r0, #0x1c
    mov r1, #0x1
    bl func_02055f84
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0]
    mov r1, #0x2
    add r0, r0, #0x1c
    mov r3, r2
    bl func_02055f84
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x1c
    bl func_02055fec
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x1c
    bl func_02056038
    mov r1, #0x0
    ldr r0, _LIT0
    ldr r0, [r0]
    str r1, [r0, #0x1c]
.L_8a4:
    bl func_02048050
    bl func_02048f98
    bl func_0204f798
    bl func_02052384
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_8dc
    bl func_020627d8
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0]
.L_8dc:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219daec
