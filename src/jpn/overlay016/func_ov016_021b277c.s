; func_ov016_021b277c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020060f4
        .extern func_02006190
        .global func_ov016_021b277c
        .arm
func_ov016_021b277c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_020060f4
    bl func_02006190
    cmp r0, #0x0
    beq .L_6c
    ldrh r1, [r4]
    ldr r2, [sp, #0x4]
    cmp r1, r2
    bgt .L_6c
    ldrb r0, [r4, #0x4]
    add r0, r1, r0
    cmp r0, r2
    ble .L_6c
    ldrh r1, [r4, #0x2]
    ldr r2, [sp]
    cmp r1, r2
    bgt .L_6c
    ldrb r0, [r4, #0x5]
    add r0, r1, r0
    cmp r0, r2
    addgt sp, sp, #0x8
    movgt r0, #0x1
    ldmgtia sp!, {r4, pc}
.L_6c:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
