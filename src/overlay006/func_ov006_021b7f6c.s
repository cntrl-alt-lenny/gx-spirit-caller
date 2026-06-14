; func_ov006_021b7f6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov006_021b7240
        .global func_ov006_021b7f6c
        .arm
func_ov006_021b7f6c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, [r5, #0x1c]
    mov r4, #0x0
    cmp r0, #0x0
    bls .L_2c4
    mov r8, #0x1
    mov r7, r4
    mvn r6, #0x0
.L_298:
    str r8, [sp]
    add r0, r5, r4, lsl #0x1
    ldrh r3, [r0, #0x28]
    mov r0, r5
    mov r1, r7
    mov r2, r6
    bl func_ov006_021b7240
    ldr r0, [r5, #0x1c]
    add r4, r4, #0x1
    cmp r4, r0
    bcc .L_298
.L_2c4:
    ldr r0, [r5, #0x20]
    mov r4, #0x0
    cmp r0, #0x0
    bls .L_30c
    mov r8, #0x1
    mov r7, r4
    mvn r6, #0x0
.L_2e0:
    str r8, [sp]
    add r0, r5, r4, lsl #0x1
    ldrh r3, [r0, #0xc8]
    mov r0, r5
    mov r1, r7
    mov r2, r6
    bl func_ov006_021b7240
    ldr r0, [r5, #0x20]
    add r4, r4, #0x1
    cmp r4, r0
    bcc .L_2e0
.L_30c:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    bls .L_354
    mov r8, #0x1
    mov r7, r4
    mvn r6, #0x0
.L_328:
    str r8, [sp]
    add r0, r5, r4, lsl #0x1
    ldrh r3, [r0, #0xe6]
    mov r0, r5
    mov r1, r7
    mov r2, r6
    bl func_ov006_021b7240
    ldr r0, [r5, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    bcc .L_328
.L_354:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
