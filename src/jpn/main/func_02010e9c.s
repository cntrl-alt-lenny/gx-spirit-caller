; func_02010e9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201115c
        .extern func_0208ebf0
        .global func_02010e9c
        .arm
func_02010e9c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x54
    mov r4, r0
    ldr r1, [r4, #0xac]
    cmp r1, #0x0
    beq .L_1c
    blx r1
.L_1c:
    mov r0, #0x400000
    rsb r0, r0, #0x0
    mov r3, #0x400000
    stmia sp, {r0, r3}
    str r3, [sp, #0x8]
    mov r2, #0x1
    mov r1, #0x70000
    str r2, [sp, #0xc]
    add r0, sp, #0x14
    str r0, [sp, #0x10]
    sub r0, r3, #0x470000
    sub r2, r1, #0xf0000
    mov r3, #0x80000
    bl func_0208ebf0
    ldr r1, [sp, #0x14]
    mov r0, r4
    str r1, [r4]
    ldr r2, [sp, #0x18]
    add r1, r4, #0x30
    str r2, [r4, #0x4]
    ldr r2, [sp, #0x1c]
    str r2, [r4, #0x8]
    ldr r2, [sp, #0x24]
    str r2, [r4, #0xc]
    ldr r2, [sp, #0x28]
    str r2, [r4, #0x10]
    ldr r2, [sp, #0x2c]
    str r2, [r4, #0x14]
    ldr r2, [sp, #0x34]
    str r2, [r4, #0x18]
    ldr r2, [sp, #0x38]
    str r2, [r4, #0x1c]
    ldr r2, [sp, #0x3c]
    str r2, [r4, #0x20]
    ldr r2, [sp, #0x44]
    str r2, [r4, #0x24]
    ldr r2, [sp, #0x48]
    str r2, [r4, #0x28]
    ldr r2, [sp, #0x4c]
    str r2, [r4, #0x2c]
    bl func_0201115c
    mov r0, #0x1
    add sp, sp, #0x54
    ldmia sp!, {r3, r4, pc}
