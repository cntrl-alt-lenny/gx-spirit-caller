; func_020620a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02062944
        .global func_020620a4
        .arm
func_020620a4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r2, [r0, #0x90]
    cmp r2, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqfd sp!, {pc}
    ldr r2, [r0, #0x94]
    sub r1, r1, r2
    cmp r1, #0x64
    bls .L_40
    bl func_02062944
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
.L_40:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
