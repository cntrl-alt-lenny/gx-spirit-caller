; func_0204f724 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba4
        .extern data_0219dbac
        .extern data_0219dbb0
        .extern func_0204543c
        .extern func_0204988c
        .extern func_0204b2fc
        .global func_0204f724
        .arm
func_0204f724:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r0, #0x0
    bl func_0204988c
    ldr r0, _LIT0
    ldr r1, [r0]
    cmp r1, #0x0
    beq .L_38
    mov r0, #0x4
    mov r2, #0x0
    bl func_0204543c
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
.L_38:
    bl func_0204b2fc
    ldr r0, _LIT1
    ldr r1, [r0]
    cmp r1, #0x0
    beq .L_64
    mov r0, #0x4
    mov r2, #0x0
    bl func_0204543c
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0]
.L_64:
    ldr r0, _LIT2
    mov r1, #0x0
    strb r1, [r0]
    strb r1, [r0, #0x1]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219dbb0
_LIT1: .word data_0219dba4
_LIT2: .word data_0219dbac
