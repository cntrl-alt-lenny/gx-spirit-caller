; func_ov016_021b27f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0200612c
        .extern func_02006160
        .global func_ov016_021b27f4
        .arm
func_ov016_021b27f4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_0200612c
    bl func_02006160
    cmp r0, #0x0
    beq .L_e4
    ldrh r1, [r4]
    ldr r2, [sp, #0x4]
    cmp r1, r2
    bgt .L_e4
    ldrb r0, [r4, #0x4]
    add r0, r1, r0
    cmp r0, r2
    ble .L_e4
    ldrh r1, [r4, #0x2]
    ldr r2, [sp]
    cmp r1, r2
    bgt .L_e4
    ldrb r0, [r4, #0x5]
    add r0, r1, r0
    cmp r0, r2
    addgt sp, sp, #0x8
    movgt r0, #0x1
    ldmgtia sp!, {r4, pc}
.L_e4:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
