; func_020577d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a7388
        .global func_020577d8
        .arm
func_020577d8:
    stmdb sp!, {r4, lr}
    movs r4, r1
    beq .L_da4
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_da4
    ldr r1, [r4, #0xc]
    cmp r1, #0x0
    bne .L_dac
.L_da4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_dac:
    ldr r0, [r4, #0x8]
    sub r0, r0, r1
    str r0, [r4, #0x8]
    ldr r2, [r4, #0x8]
    cmp r2, #0x0
    beq .L_dd4
    ldr r0, [r4]
    ldr r1, [r4, #0xc]
    add r1, r0, r1
    bl func_020a7388
.L_dd4:
    ldr r2, [r4]
    ldr r1, [r4, #0x8]
    mov r0, #0x0
    strb r0, [r2, r1]
    str r0, [r4, #0xc]
    ldmia sp!, {r4, pc}
