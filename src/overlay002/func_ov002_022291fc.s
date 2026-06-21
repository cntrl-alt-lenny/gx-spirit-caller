; func_ov002_022291fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021de4d8
        .extern func_ov002_021e05fc
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_022291fc
        .arm
func_ov002_022291fc:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    add r2, sp, #0x0
    mov r1, #0x0
    mov r6, r0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_88
    ldr r2, [sp]
    mov r0, r6
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r4, r2, #0xff
    and r5, r1, #0xff
    mov r1, r4
    mov r2, r5
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_88
    bl func_ov002_021e2b3c
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021de4d8
    cmp r0, #0x0
    beq .L_84
    ldrh r0, [r6, #0x2]
    mov r1, #0x3e8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e05fc
.L_84:
    bl func_ov002_021e2c5c
.L_88:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
