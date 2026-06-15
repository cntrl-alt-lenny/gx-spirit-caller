; func_02055c04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffc10
        .extern func_0205a18c
        .extern func_0205ffc0
        .global func_02055c04
        .arm
func_02055c04:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    beq .L_8f0
    ldr ip, [r0]
    cmp ip, #0x0
    bne .L_8fc
.L_8f0:
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_8fc:
    ldr r3, [ip, #0x108]
    cmp r3, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmnefd sp!, {pc}
    ldr r3, [ip, #0x1d8]
    cmp r3, #0x4
    bne .L_930
    ldr r1, _LIT0
    bl func_0205ffc0
    add sp, sp, #0x4
    mov r0, #0x2
    ldmfd sp!, {pc}
.L_930:
    bl func_0205a18c
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_020ffc10
