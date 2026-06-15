; func_0206aa30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054148
        .extern func_02068bb8
        .extern func_0206aa68
        .extern func_0206b590
        .global func_0206aa30
        .arm
func_0206aa30:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0206aa68
    mov r0, r4
    bl func_0206b590
    mov r0, r4
    bl func_02068bb8
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_d8
    bl func_02054148
.L_d8:
    mov r0, #0x0
    str r0, [r4, #0x4]
    ldmia sp!, {r4, pc}
