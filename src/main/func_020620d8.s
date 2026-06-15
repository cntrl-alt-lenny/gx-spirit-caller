; func_020620d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02062aec
        .global func_020620d8
        .arm
func_020620d8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, [r0, #0x88]
    ldr r2, _LIT0
    sub r1, r1, r3
    cmp r1, r2
    bls .L_bc8
    bl func_02062aec
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
.L_bc8:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word 0x00007530
