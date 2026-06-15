; func_0204f280 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc90
        .extern func_0204548c
        .extern func_020498dc
        .extern func_020498f0
        .extern func_0204b370
        .extern func_02065e40
        .extern func_02068f54
        .global func_0204f280
        .arm
func_0204f280:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_020498f0
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    cmp r0, #0x0
    beq .L_1e58
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    bl func_02068f54
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0xe4]
.L_1e58:
    bl func_02065e40
    mov r0, #0x0
    bl func_020498dc
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    beq .L_1e8c
    mov r0, #0x4
    mov r2, #0x0
    bl func_0204548c
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
.L_1e8c:
    bl func_0204b370
    bl func_020498f0
    mov r1, #0x1
    strb r1, [r0, #0x18]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219dc90
