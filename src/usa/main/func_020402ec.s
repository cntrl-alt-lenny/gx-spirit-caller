; func_020402ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d8f4
        .extern func_02091a0c
        .global func_020402ec
        .arm
func_020402ec:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, [r0]
    add r0, r1, #0x1000
    ldr r0, [r0, #0x384]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldr r0, _LIT1
    add r0, r1, r0
    bl func_02091a0c
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219d8f4
_LIT1: .word 0x00001318
