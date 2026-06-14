; func_ov006_021bdcdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f448
        .extern func_ov006_021b6d1c
        .extern func_ov006_021b6e3c
        .extern func_ov006_021bd6bc
        .extern func_ov006_021bd700
        .extern func_ov006_021be5b8
        .global func_ov006_021bdcdc
        .arm
func_ov006_021bdcdc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r1, [r7, #0x50]
    add r3, r7, #0xa0
    mov r2, #0x24
    mla r5, r1, r2, r3
    ldr r2, [r5, #0xc]
    ldr r4, _LIT0
    cmp r2, #0x0
    bne .L_494
    ldr r0, [r5, #0x20]
    ldr r1, [r5, #0x20]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    moveq r0, #0x1
    movne r0, #0x0
    and r0, r0, #0x1
    bic r1, r1, #0x1
    orr r0, r1, r0
    str r0, [r5, #0x20]
    mov r0, #0x0
    str r0, [r5]
    str r0, [r5, #0x4]
    str r0, [r5, #0x8]
    b .L_51c
.L_494:
    bl func_ov006_021bd6bc
    movs r2, r0
    ldrmi r0, [r5, #0xc]
    ldr r1, [r7, #0x50]
    submi r2, r0, #0x1
    ldr r0, [r5, #0x20]
    mov r3, r0, lsl #0x1f
    mov r0, r4
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6d1c
    ldr r1, [r5, #0x20]
    mov r6, r0
    mov r0, r1, lsl #0x1f
    movs r0, r0, lsr #0x1f
    moveq r0, #0x1
    ldr r1, [r5, #0x20]
    movne r0, #0x0
    and r0, r0, #0x1
    bic r1, r1, #0x1
    orr r1, r1, r0
    mov r0, r7
    str r1, [r5, #0x20]
    bl func_ov006_021be5b8
    ldr r0, [r5, #0x20]
    ldr r1, [r7, #0x50]
    mov r3, r0, lsl #0x1f
    mov r0, r4
    mov r2, r6
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6e3c
    mov r2, r0
    ldr r1, [r7, #0x50]
    mov r0, r7
    bl func_ov006_021bd700
.L_51c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov006_0224f448
