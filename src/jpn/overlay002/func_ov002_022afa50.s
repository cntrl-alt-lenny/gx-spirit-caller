; func_ov002_022afa50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b377c
        .global func_ov002_022afa50
        .arm
func_ov002_022afa50:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    cmp r1, #0x0
    bgt .L_e90
    mov r0, #0x0
    str r0, [r5, #0x18]
    ldr r0, [r5, #0x40]
    str r0, [r5, #0x3c]
    ldmia sp!, {r3, r4, r5, pc}
.L_e90:
    ldr r2, [r5, #0x34]
    ldr r0, [r5, #0x30]
    sub r0, r2, r0
    cmp r1, r0
    blt .L_eb4
    str r0, [r5, #0x18]
    ldr r0, [r5, #0x44]
    str r0, [r5, #0x3c]
    ldmia sp!, {r3, r4, r5, pc}
.L_eb4:
    str r1, [r5, #0x18]
    ldr r4, [r5, #0x40]
    ldr r0, [r5, #0x44]
    ldr r3, [r5, #0x34]
    sub r0, r0, r4
    mul r2, r1, r0
    ldr r0, [r5, #0x30]
    sub r1, r3, r0
    add r0, r1, r1, lsr #0x1f
    add r0, r2, r0, asr #0x1
    bl func_020b377c
    add r0, r4, r0
    str r0, [r5, #0x3c]
    ldmia sp!, {r3, r4, r5, pc}
