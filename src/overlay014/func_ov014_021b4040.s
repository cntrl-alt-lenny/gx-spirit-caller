; func_ov014_021b4040 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201e964
        .global func_ov014_021b4040
        .arm
func_ov014_021b4040:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x28
    mov r2, #0x80000
    mov r1, #0x60000
    mov r4, r0
    str r2, [sp, #0x20]
    str r1, [sp, #0x24]
    ldr r0, [r4, #0x58]
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r4, #0x58]
    bne .L_16c
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    str r3, [sp, #0x8]
    str r3, [sp, #0xc]
    str r3, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r0, [r4, #0xc]
    add r2, sp, #0x20
    ldr r1, [r0, #0x2c]
    mov r0, #0x1
    bl func_0201e964
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    str r3, [sp, #0x8]
    mov r0, #0x3
    str r0, [sp, #0xc]
    str r3, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r0, [r4, #0xc]
    add r2, sp, #0x20
    ldr r1, [r0, #0x2c]
    mov r0, #0x1
    add r1, r1, #0x8
    bl func_0201e964
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    str r3, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r1, #0x6000
    str r1, [sp, #0x10]
    mov r1, #0x200
    str r1, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x20]
    add r2, sp, #0x20
    ldr r1, [r1, #0x2c]
    bl func_0201e964
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    str r3, [sp, #0x8]
    mov r0, #0x2
    str r0, [sp, #0xc]
    mov r0, #0xa000
    str r0, [sp, #0x10]
    mov r0, #0x400
    str r0, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x34]
    mov r0, #0x1
    ldr r1, [r1, #0x2c]
    add r2, sp, #0x20
    bl func_0201e964
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    str r3, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r1, #0x12000
    str r1, [sp, #0x10]
    mov r1, #0x600
    str r1, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x48]
    add r2, sp, #0x20
    ldr r1, [r1, #0x2c]
    bl func_0201e964
.L_16c:
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r4, pc}
