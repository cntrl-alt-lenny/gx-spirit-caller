; func_02061e14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021013fc
        .extern data_02101404
        .extern func_02064a2c
        .extern func_020a6c60
        .global func_02061e14
        .arm
func_02061e14:
    stmdb sp!, {r4, lr}
    movs r4, r0
    bne .L_930
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x1b
    bl func_020a6c60
.L_930:
    cmp r4, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r1, [r4, #0x1c]
    mov r0, r4
    add r1, r1, #0x1
    str r1, [r4, #0x1c]
    ldr r1, [r4, #0x24]
    blx r1
    ldr r0, [r4, #0x1c]
    sub r0, r0, #0x1
    str r0, [r4, #0x1c]
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_998
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    bne .L_998
    mov r0, r4
    bl func_02064a2c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_998:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_021013fc
_LIT1: .word data_02101404
