; func_0209d1f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a84c0
        .extern func_02094688
        .global func_0209d1f0
        .arm
func_0209d1f0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r5, _LIT0
    mov r1, #0x200
    ldr r3, [r5, #0x1c]
    rsb r1, r1, #0x0
    ldr r2, [r0, #0x8]
    and r3, r3, r1
    cmp r3, r2
    bne .L_784
    ldr r2, [r5, #0x1c]
    ldr r1, [r5, #0x24]
    sub r3, r2, r3
    rsb r4, r3, #0x200
    cmp r4, r1
    movhi r4, r1
    add r0, r0, #0x20
    ldr r1, [r5, #0x20]
    mov r2, r4
    add r0, r0, r3
    bl func_02094688
    ldr r0, [r5, #0x1c]
    add r0, r0, r4
    str r0, [r5, #0x1c]
    ldr r0, [r5, #0x20]
    add r0, r0, r4
    str r0, [r5, #0x20]
    ldr r0, [r5, #0x24]
    sub r0, r0, r4
    str r0, [r5, #0x24]
.L_784:
    ldr r0, [r5, #0x24]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a84c0
