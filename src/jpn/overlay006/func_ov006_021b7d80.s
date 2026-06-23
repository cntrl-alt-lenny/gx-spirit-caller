; func_ov006_021b7d80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov006_021b7140
        .global func_ov006_021b7d80
        .arm
func_ov006_021b7d80:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r0, [r5, #0x1c]
    mov r7, #0x0
    cmp r0, #0x0
    bls .L_50
    mov r6, #0x1
    mov r4, r7
.L_24:
    str r6, [sp]
    add r0, r5, r7, lsl #0x1
    ldrh r3, [r0, #0x28]
    mov r0, r5
    mov r1, r6
    mov r2, r4
    bl func_ov006_021b7140
    ldr r0, [r5, #0x1c]
    add r7, r7, #0x1
    cmp r7, r0
    bcc .L_24
.L_50:
    ldr r0, [r5, #0x20]
    mov r4, #0x0
    cmp r0, #0x0
    bls .L_98
    mov r8, #0x1
    mov r7, #0x2
    mov r6, r4
.L_6c:
    str r8, [sp]
    add r0, r5, r4, lsl #0x1
    ldrh r3, [r0, #0xc8]
    mov r0, r5
    mov r1, r7
    mov r2, r6
    bl func_ov006_021b7140
    ldr r0, [r5, #0x20]
    add r4, r4, #0x1
    cmp r4, r0
    bcc .L_6c
.L_98:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    bls .L_e0
    mov r8, #0x1
    mov r7, #0x3
    mov r6, r4
.L_b4:
    str r8, [sp]
    add r0, r5, r4, lsl #0x1
    ldrh r3, [r0, #0xe6]
    mov r0, r5
    mov r1, r7
    mov r2, r6
    bl func_ov006_021b7140
    ldr r0, [r5, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    bcc .L_b4
.L_e0:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
