; func_0207cb68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0207b450
        .global func_0207cb68
        .arm
func_0207cb68:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, #0x0
    bl func_0207b450
    mov r4, r0
    bl OS_DisableIrq
    cmp r4, #0x0
    beq .L_b0
    add r1, r4, #0x2000
    ldr r2, [r1, #0x260]
    cmp r2, #0x9
    bne .L_b0
    ldrb r1, [r1, #0x26b]
    cmp r1, #0x0
    ldreq r1, _LIT0
    addeq r5, r4, r1
.L_b0:
    bl OS_RestoreIrq
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word 0x00002144
