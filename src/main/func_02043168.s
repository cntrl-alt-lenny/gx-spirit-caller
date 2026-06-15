; func_02043168 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d9f0
        .extern func_020421d8
        .extern func_020919d8
        .extern func_02091ae0
        .extern func_02091d24
        .global func_02043168
        .arm
func_02043168:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldr r1, [r0]
    add r0, r1, #0x1000
    ldr r0, [r0, #0x188]
    cmp r0, #0x0
    beq .L_13e4
    ldr r0, _LIT1
    add r0, r1, r0
    bl func_02091ae0
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqfd sp!, {pc}
.L_13e4:
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1]
    mov r3, #0x1000
    ldr r1, _LIT2
    str r3, [sp]
    mov ip, #0x10
    add r0, r2, r0
    add r3, r2, #0x1000
    str ip, [sp, #0x4]
    bl func_02091d24
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1]
    add r0, r1, r0
    bl func_020919d8
    add sp, sp, #0xc
    ldmfd sp!, {pc}
_LIT0: .word data_0219d9f0
_LIT1: .word 0x0000111c
_LIT2: .word func_020421d8
