; func_02062064 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02062a78
        .global func_02062064
        .arm
func_02062064:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r3, [r0, #0x88]
    ldr r2, _LIT0
    sub r1, r1, r3
    cmp r1, r2
    bls .L_b90
    bl func_02062a78
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
.L_b90:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word 0x00007530
