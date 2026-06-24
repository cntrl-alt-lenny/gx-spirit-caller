; func_020318f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219acd8
        .extern func_02093b08
        .global func_020318f8
        .arm
func_020318f8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mvn r0, #0x0
    and r0, r0, #0x0
    and r1, r4, #0x0
    cmp r0, #0x0
    cmpeq r1, #0x0
    beq .L_24
    bl func_02093b08
.L_24:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r3, [r0, #0x4]
    mov ip, r1, lsl #0x1c
    orr ip, ip, r3, lsr #0x4
    mov r2, r4, lsr #0x4
    add r1, r3, #0x1
    str r1, [r0, #0x4]
    orr r1, ip, #0x0
    orr r0, r2, r3, lsl #0x1c
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219acd8
