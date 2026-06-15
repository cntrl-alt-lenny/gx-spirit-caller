; func_02088000 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_020880bc
        .extern func_020950a0
        .global func_02088000
        .arm
func_02088000:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, [r4, #0x24]
    mov r0, r0, lsl #0x1e
    movs r0, r0, asr #0x1f
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq .L_50
    mov r5, #0x1
.L_28:
    bl OS_DisableIrq
    mov r6, r0
    mov r0, r4
    mov r1, r5
    bl func_020880bc
    mov r0, r6
    bl OS_RestoreIrq
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    bne .L_28
.L_50:
    ldr r0, [r4, #0x40]
    mov r2, #0x1
    mov r1, #0x0
    mov r2, r2, lsl r0
    ldr r0, [r4, #0x44]
    mov r3, r1
    bl func_020950a0
    ldmia sp!, {r4, r5, r6, pc}
