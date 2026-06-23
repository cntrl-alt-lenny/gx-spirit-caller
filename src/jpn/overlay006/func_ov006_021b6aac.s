; func_ov006_021b6aac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021b6aac
        .arm
func_ov006_021b6aac:
    cmp r1, #0x0
    beq .L_e8
    cmp r1, #0x1
    beq .L_f4
    b .L_100
.L_e8:
    add r0, r0, #0x6000
    ldr r0, [r0, #0x234]
    bx lr
.L_f4:
    add r0, r0, #0x6000
    ldr r0, [r0, #0x238]
    bx lr
.L_100:
    mov r0, #0x0
    bx lr
