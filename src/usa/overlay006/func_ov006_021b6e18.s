; func_ov006_021b6e18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021b6e18
        .arm
func_ov006_021b6e18:
    cmp r3, #0x0
    cmpne r1, #0x0
    mov r3, #0x68
    beq .L_220
    mla r0, r1, r3, r0
    add r0, r0, r2, lsl #0x1
    add r0, r0, #0xc800
    ldrsh r0, [r0, #0x7e]
    bx lr
.L_220:
    mla r0, r1, r3, r0
    add r0, r0, r2, lsl #0x1
    add r0, r0, #0xc600
    ldrsh r0, [r0, #0x76]
    bx lr
