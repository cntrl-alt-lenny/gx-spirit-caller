; func_ov004_021d3f24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032638
        .global func_ov004_021d3f24
        .arm
func_ov004_021d3f24:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02032638
    ldr r0, [r0, #0xeb0]
    cmp r0, #0x2
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    movne r0, #0x17
    moveq r0, #0x11
    str r0, [r4, #0x30]
    mov r0, #0x1
    str r0, [r4, #0x38]
    mov r0, #0x0
    str r0, [r4, #0x3c]
    ldmia sp!, {r4, pc}
