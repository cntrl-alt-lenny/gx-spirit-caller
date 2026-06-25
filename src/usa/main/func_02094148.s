; func_02094148 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6630
        .extern func_020904f4
        .extern func_020906cc
        .global func_02094148
        .arm
func_02094148:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r0, #0x200000
    bl func_020904f4
    ldr r2, _LIT0
    ldr r0, _LIT1
    ldr r1, [r2]
    ldr r3, [r0, #0x18]
    bic r1, r1, #-1073741824
    orr r1, r1, r3, lsl #0x1e
    str r1, [r2]
    ldr r1, [r0, #0x1c]
    mov r0, #0x200000
    bl func_020906cc
    ldr r0, _LIT1
    mov r2, #0x0
    ldr r1, [r0, #0x10]
    str r2, [r0]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldr r0, [r0, #0x14]
    ldmeqfd sp!, {lr}
    bxeq lr
    blx r1
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x04000600
_LIT1: .word data_021a6630
