; func_ov006_021b5ee4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_ov006_0224f2c8
        .extern data_ov006_0224f2e0
        .extern func_ov006_021b7ab0
        .extern func_ov006_021b7bfc
        .extern func_ov006_021b7d80
        .global func_ov006_021b5ee4
        .arm
func_ov006_021b5ee4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    mov r1, r9
    add r0, r9, #0x124
    mov r2, #0x124
    bl Copy32
    mov r0, r9
    add r1, r9, #0x6000
    mov r2, #0x1
    str r2, [r1, #0x294]
    bl func_ov006_021b7bfc
    mov r0, r9
    bl func_ov006_021b7d80
    mov r6, #0x0
    add r0, r9, #0x6000
    ldr r8, _LIT0
    ldr r5, _LIT1
    mov r7, r9
    str r6, [r0, #0x294]
    mov r4, r6
.L_50:
    cmp r6, #0x0
    beq .L_9c
    add r0, r9, r6, lsl #0x1
    add r0, r0, #0x6200
    ldrsh r0, [r0, #0x44]
    mov r1, r6, lsl #0x1
    mov r2, r4
    strh r0, [r5, r1]
.L_70:
    add r0, r7, r2, lsl #0x1
    add r0, r0, #0x6200
    ldrsh r0, [r0, #0x4e]
    mov r1, r2, lsl #0x1
    add r2, r2, #0x1
    strh r0, [r8, r1]
    cmp r2, #0x7
    blt .L_70
    mov r0, r9
    mov r1, r6
    bl func_ov006_021b7ab0
.L_9c:
    add r6, r6, #0x1
    cmp r6, #0x5
    add r7, r7, #0xe
    add r8, r8, #0xe
    blt .L_50
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov006_0224f2e0
_LIT1: .word data_ov006_0224f2c8
