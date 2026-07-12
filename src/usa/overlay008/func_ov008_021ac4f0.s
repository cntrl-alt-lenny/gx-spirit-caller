; func_ov008_021ac4f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern func_ov008_021ab3a4
        .global func_ov008_021ac4f0
        .arm
func_ov008_021ac4f0:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    ldr r3, _LIT0
    cmp r2, #0x1
    ldr r3, [r3, #0x4]
    addle sp, sp, #0x10
    mov r3, r3, lsl #0x1d
    mov r3, r3, lsr #0x1d
    ldmleia sp!, {r3, pc}
    cmp r3, #0x0
    subne r3, r3, #0x1
    cmp r2, #0x2
    beq .L_48
    cmp r2, #0x3
    cmpne r2, #0x4
    subeq r0, r0, #0x3
    moveq lr, #0x1
    b .L_50
.L_48:
    add r1, r1, #0x4
    mov lr, #0x0
.L_50:
    mov r2, #0x0
    mov r3, r3, lsl #0x1
    add r3, r3, #0x2
    str r2, [sp]
    mov ip, #0x2
    str ip, [sp, #0x4]
    mov ip, #0x400
    str ip, [sp, #0x8]
    add r3, lr, r3
    str r2, [sp, #0xc]
    bl func_ov008_021ab3a4
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
_LIT0: .word data_02104e6c
