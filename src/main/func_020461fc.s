; func_020461fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204653c
        .global func_020461fc
        .arm
func_020461fc:
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
    bl func_0204653c
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word 0x00000603
_LIT1: .word 0x00000901
_LIT2: .word 0x00000b01
