; func_ov011_021c9f5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_ov010_021b2760
        .global func_ov011_021c9f5c
        .arm
func_ov011_021c9f5c:
    stmdb sp!, {r3, lr}
    .word 0xebff9cf6
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x15
    mov r0, r0, lsr #0x1e
    tst r0, #0x1
    beq .L_1f4
    bl GetSystemWork
    ldr r2, [r0, #0x900]
    mov r1, r2, lsl #0x15
    mov r1, r1, lsr #0x1e
    bic r1, r1, #0x1
    bic r2, r2, #0x600
    mov r1, r1, lsl #0x1e
    orr r1, r2, r1, lsr #0x15
    str r1, [r0, #0x900]
    ldmia sp!, {r3, pc}
.L_1f4:
    bl func_ov010_021b2760
    ldmia sp!, {r3, pc}
