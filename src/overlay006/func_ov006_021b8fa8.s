; func_ov006_021b8fa8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f3e0
        .extern data_ov006_0224f3e8
        .global func_ov006_021b8fa8
        .arm
func_ov006_021b8fa8:
    ldr r0, _LIT0
    mov r1, r1, lsl #0x1
    ldrsh r2, [r0, r1]
    mov r1, #0x1
    ldr r0, _LIT1
    mov r1, r1, lsl r2
    strh r1, [r0]
    cmp r2, #0x0
    beq .L_48
    cmp r2, #0x7
    cmpne r2, #0x1
    ldrneh r1, [r0]
    orrne r1, r1, #0x4000
    strneh r1, [r0]
    ldr r0, _LIT1
    ldrh r1, [r0]
    orr r1, r1, #0x8000
    strh r1, [r0]
.L_48:
    mov r0, #0x1
    bx lr
_LIT0: .word data_ov006_0224f3e8
_LIT1: .word data_ov006_0224f3e0
