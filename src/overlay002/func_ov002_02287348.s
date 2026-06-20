; func_ov002_02287348 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_02280a1c
        .global func_ov002_02287348
        .arm
func_ov002_02287348:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    mov r3, #0x1
    bl func_ov002_02280a1c
    ldr r0, [sp, #0x4]
    mvn r1, #0x0
    cmp r0, r1
    ble .L_a4
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT0
    ldr lr, _LIT1
    mov r2, r2, lsl #0x1f
    mov r5, r2, lsr #0x1f
    and r2, r5, #0x1
    mul r3, r2, r1
    ldr ip, [lr, r3]
    cmp r0, ip
    bge .L_a4
    rsb r2, r5, #0x1
    and r2, r2, #0x1
    mul r3, r2, r1
    ldr r2, [lr, r3]
    cmp r0, r2
    addge sp, sp, #0x8
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, pc}
    sub r1, r1, #0x28c
    cmp r0, r1
    blt .L_a4
    sub r0, r2, r0
    cmp r0, ip
    addlt sp, sp, #0x8
    movlt r0, #0x1
    ldmltia sp!, {r3, r4, r5, pc}
.L_a4:
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x1
    bl func_ov002_02280a1c
    ldr r0, [sp, #0x4]
    mvn r1, #0x0
    cmp r0, r1
    ble .L_118
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT0
    ldr r3, _LIT1
    mov r2, r2, lsl #0x1f
    mov ip, r2, lsr #0x1f
    and r2, ip, #0x1
    mul r4, r2, r1
    ldr r2, [r3, r4]
    cmp r0, r2
    bge .L_118
    rsb r2, ip, #0x1
    and r2, r2, #0x1
    mul r1, r2, r1
    ldr r1, [r3, r1]
    cmp r0, r1
    addge sp, sp, #0x8
    movge r0, #0x1
    ldmgeia sp!, {r3, r4, r5, pc}
.L_118:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
