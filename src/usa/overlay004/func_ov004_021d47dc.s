; func_ov004_021d47dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov004_021d3ba8
        .global func_ov004_021d47dc
        .arm
func_ov004_021d47dc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r4, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_28
    bl func_ov004_021d3ba8
.L_28:
    ldr r0, [r4, #0x3c]
    add r0, r0, #0x1
    str r0, [r4, #0x3c]
    cmp r0, #0x8
    ldmccia sp!, {r4, pc}
    mov r0, #0x29
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
