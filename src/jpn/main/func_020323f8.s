; func_020323f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .global func_020323f8
        .arm
func_020323f8:
    stmdb sp!, {r4, r5, r6, lr}
    movs r5, r0
    mov r4, r1
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl OS_DisableIrq
    ldr r2, [r5]
    ldr r1, [r5, #0x4]
    cmp r2, r1
    moveq r6, #0x0
    beq .L_68
    ldr r1, [r5, #0xc]
    add r2, r1, r2
    ldrb r1, [r2, #0x1]
    cmp r1, #0x1
    bne .L_5c
    mov r6, #0x0
    str r6, [r5]
    ldr r1, [r5, #0x4]
    cmp r1, #0x0
    beq .L_68
    ldr r1, [r5, #0xc]
    add r2, r1, r6
.L_5c:
    ldrh r1, [r2, #0x2]
    add r6, r2, #0x4
    str r1, [r4]
.L_68:
    bl OS_RestoreIrq
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
