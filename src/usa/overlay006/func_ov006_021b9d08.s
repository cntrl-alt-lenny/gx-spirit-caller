; func_ov006_021b9d08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cbaa8
        .global func_ov006_021b9d08
        .arm
func_ov006_021b9d08:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x40
    cmp r2, #0x0
    movge ip, r2
    rsblt ip, r2, #0x0
    cmp r2, #0x0
    mov r3, #0x0
    movlt lr, #0x1
    ldr r7, _LIT0
    movge lr, r3
    add r0, sp, #0x0
    mov r6, #0xa
.L_30:
    smull r5, r8, r7, ip
    mov r4, ip, lsr #0x1f
    add r8, r4, r8, asr #0x2
    smull r4, r5, r6, r8
    sub r8, ip, r4
    mov r5, ip
    smull r4, ip, r7, r5
    mov r4, r5, lsr #0x1f
    add ip, r4, ip, asr #0x2
    str r8, [r0, r3, lsl #0x2]
    cmp ip, #0x0
    add r3, r3, #0x1
    ble .L_6c
    cmp r3, #0x10
    blt .L_30
.L_6c:
    cmp r2, #0x0
    bge .L_84
    ldr r0, _LIT1
    ldr r0, [r0]
    ldrh r0, [r0, #0x14]
    strh r0, [r1]
.L_84:
    cmp r3, #0x0
    mov r6, #0x0
    ble .L_c8
    ldr r0, _LIT1
    sub r5, r3, #0x1
    ldr r7, [r0]
    add r4, sp, #0x0
.L_a0:
    sub r0, r5, r6
    ldr r2, [r4, r0, lsl #0x2]
    add r0, r6, lr
    mov r2, r2, lsl #0x1
    ldrh r2, [r7, r2]
    mov r0, r0, lsl #0x1
    add r6, r6, #0x1
    strh r2, [r1, r0]
    cmp r6, r3
    blt .L_a0
.L_c8:
    add r0, r3, lr
    mov r2, #0x0
    strb r2, [r1, r0, lsl #0x1]
    mov r0, #0x1
    add sp, sp, #0x40
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x66666667
_LIT1: .word data_ov006_021cbaa8
