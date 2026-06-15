; func_02084bc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02084bc8
        .arm
func_02084bc8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    mov r3, #0x1
    mov r4, #0x0
.L_f8:
    ldrb r2, [r1, #0x19]
    mov r5, r4
    cmp r2, #0x0
    ble .L_138
.L_108:
    add r2, r1, r5, lsl #0x1
    ldrh r2, [r2, #0x1a]
    ands r2, r2, #0x100
    movne lr, r5, asr #0x5
    andne r2, r5, #0x1f
    ldrne ip, [r0, lr, lsl #0x2]
    add r5, r5, #0x1
    orrne r2, ip, r3, lsl r2
    strne r2, [r0, lr, lsl #0x2]
    ldrb r2, [r1, #0x19]
    cmp r5, r2
    blt .L_108
.L_138:
    ldr r1, [r1, #0x10]
    cmp r1, #0x0
    bne .L_f8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
