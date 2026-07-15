; func_ov019_021b3d38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201e798
        .extern func_0201e7ac
        .extern func_0201e910
        .extern func_0207fc40
        .global func_ov019_021b3d38
        .arm
func_ov019_021b3d38:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x28
    ldr r4, [r0, #0x4bc]
    mov r6, r2
    cmp r4, #0x0
    mov r5, r3
    addeq sp, sp, #0x28
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r2, [r5]
    add r0, r0, r1, lsl #0x2
    ldr r4, [r0, #0x448]
    mov r0, r2, lsl #0xc
    str r0, [sp, #0x20]
    ldrh r1, [r5, #0x2]
    mvn r0, #0x0
    cmp r6, r0
    mov r0, r1, lsl #0xc
    str r0, [sp, #0x24]
    beq .L_e2c
    mov r1, r6, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    bl func_0201e7ac
.L_e2c:
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    ldrh r1, [r5, #0x8]
    add r2, sp, #0x20
    mov r0, #0x2
    str r1, [sp, #0x8]
    ldrh r1, [r5, #0x6]
    str r1, [sp, #0xc]
    str r3, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x2c]
    bl func_0201e910
    mvn r0, #0x0
    cmp r6, r0
    addne sp, sp, #0x28
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r4
    mov r1, #0x1
    bl func_0201e798
    mov r0, r4
    mov r1, #0x1000
    bl func_0207fc40
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, pc}
