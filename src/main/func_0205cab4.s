; func_0205cab4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020453b4
        .extern func_02054148
        .extern func_02054e54
        .extern func_02054e70
        .global func_0205cab4
        .arm
func_0205cab4:
    stmdb sp!, {r4, lr}
    mov r4, r1
    ldr r0, [r4, #0x8]
    mov r1, #0x2
    bl func_02054e54
    ldr r0, [r4, #0x8]
    bl func_02054e70
    ldr r0, [r4, #0x18]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r4, #0x18]
    ldr r0, [r4, #0x28]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r4, #0x28]
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq .L_314
    bl func_02054148
    mov r0, #0x0
    str r0, [r4, #0x38]
.L_314:
    mov r0, r4
    bl func_020453b4
    ldmia sp!, {r4, pc}
