; func_ov006_021b6250 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov006_021b7bb0
        .extern func_ov006_021b7c94
        .extern func_ov006_021b7cc0
        .extern func_ov006_021b7db0
        .global func_ov006_021b6250
        .arm
func_ov006_021b6250:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    str r1, [sp]
    mov sl, r0
    bl func_ov006_021b7db0
    ldr r0, [sp]
    mov r9, #0x0
    cmp r0, #0x0
    movne r1, #0x1
    mov r8, #0x1
    moveq r1, #0x0
    add r0, sl, #0x6000
    str r1, [r0, #0x29c]
    mov r7, r9
    mvn r6, #0x0
    mov r5, r8
    mov r4, #0x2
    mov fp, #0x3
.L_334:
    cmp r9, #0x0
    bne .L_3e4
    mov r0, sl
    mov r1, r9
    mov r2, r8
    bl func_ov006_021b7c94
    mov r0, sl
    mov r1, r9
    mov r2, r7
    mov r3, r6
    bl func_ov006_021b7cc0
    mov r0, sl
    mov r1, r9
    mov r2, r5
    mov r3, r6
    bl func_ov006_021b7cc0
    mov r0, sl
    mov r1, r9
    mov r2, r4
    mov r3, r6
    bl func_ov006_021b7cc0
    mov r0, sl
    mov r1, r9
    mov r2, fp
    mov r3, r6
    bl func_ov006_021b7cc0
    mov r0, sl
    mov r1, r9
    mov r2, #0x4
    mov r3, r6
    bl func_ov006_021b7cc0
    mov r0, sl
    mov r1, r9
    mov r2, #0x5
    mov r3, r6
    bl func_ov006_021b7cc0
    mov r0, sl
    mov r1, r9
    mov r2, #0x6
    mov r3, r6
    bl func_ov006_021b7cc0
    mov r0, sl
    mov r1, r9
    bl func_ov006_021b7bb0
.L_3e4:
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_334
    ldr r0, [sp]
    add r1, sl, #0x6000
    str r0, [r1, #0x240]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
