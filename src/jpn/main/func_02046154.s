; func_02046154 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02046494
        .global func_02046154
        .arm
func_02046154:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, [r1, #0x4]
    ldr r0, _LIT0
    cmp r1, r0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldr r0, _LIT1
    cmp r1, r0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldr r0, _LIT2
    cmp r1, r0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    mov r0, #0x3
    bl func_02046494
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word 0x00000603
_LIT1: .word 0x00000901
_LIT2: .word 0x00000b01
