; func_0203e204 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bec3c
        .extern func_0203c900
        .extern func_020ab054
        .global func_0203e204
        .arm
func_0203e204:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x10
    bl func_0203c900
    ldrb r0, [r0, #0xd0c]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1c
    beq .L_18c
    cmp r0, #0x6
    bne .L_1a8
.L_18c:
    ldr r1, _LIT0
    add r0, r4, #0xc
    mov r2, #0x8
    bl func_020ab054
    cmp r0, #0x0
    moveq r0, #0x8
    ldmeqia sp!, {r4, pc}
.L_1a8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_020bec3c+0x8
