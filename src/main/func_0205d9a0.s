; func_0205d9a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020453b4
        .extern func_02059d90
        .global func_0205d9a0
        .arm
func_0205d9a0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_334
    ldr r0, [r0, #0x8]
    bl func_020453b4
    ldr r0, [r4, #0x8]
    mov r1, #0x0
    str r1, [r0, #0x8]
    ldr r0, [r4, #0x8]
    ldr r0, [r0, #0xc]
    bl func_020453b4
    ldr r0, [r4, #0x8]
    mov r1, #0x0
    str r1, [r0, #0xc]
    ldr r0, [r4, #0x8]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r4, #0x8]
.L_334:
    mov r0, r4
    bl func_02059d90
    ldr r0, [r4, #0x10]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r4, #0x10]
    ldr r0, [r4, #0x18]
    bl func_020453b4
    mov r0, #0x0
    str r0, [r4, #0x18]
    ldmia sp!, {r4, pc}
