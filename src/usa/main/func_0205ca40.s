; func_0205ca40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045364
        .extern func_020540d4
        .extern func_02054de0
        .extern func_02054dfc
        .global func_0205ca40
        .arm
func_0205ca40:
    stmdb sp!, {r4, lr}
    mov r4, r1
    ldr r0, [r4, #0x8]
    mov r1, #0x2
    bl func_02054de0
    ldr r0, [r4, #0x8]
    bl func_02054dfc
    ldr r0, [r4, #0x18]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x18]
    ldr r0, [r4, #0x28]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x28]
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq .L_2d8
    bl func_020540d4
    mov r0, #0x0
    str r0, [r4, #0x38]
.L_2d8:
    mov r0, r4
    bl func_02045364
    ldmia sp!, {r4, pc}
