; func_0204f20c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dbb0
        .extern func_0204543c
        .extern func_02049868
        .extern func_0204987c
        .extern func_0204b2fc
        .extern func_02065dcc
        .extern func_02068ee0
        .global func_0204f20c
        .arm
func_0204f20c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0204987c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    cmp r0, #0x0
    beq .L_218
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    bl func_02068ee0
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0xe4]
.L_218:
    bl func_02065dcc
    mov r0, #0x0
    bl func_02049868
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    beq .L_24c
    mov r0, #0x4
    mov r2, #0x0
    bl func_0204543c
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
.L_24c:
    bl func_0204b2fc
    bl func_0204987c
    mov r1, #0x1
    strb r1, [r0, #0x18]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219dbb0
