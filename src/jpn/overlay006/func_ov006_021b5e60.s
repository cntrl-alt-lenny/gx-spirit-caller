; func_ov006_021b5e60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f2c8
        .extern data_ov006_0224f2e0
        .extern func_ov006_021b7f5c
        .global func_ov006_021b5e60
        .arm
func_ov006_021b5e60:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    bl func_ov006_021b7f5c
    mov r5, #0x0
    ldr r0, _LIT0
    ldr lr, _LIT1
    mov r1, r4
    mov ip, r5
.L_20:
    cmp r5, #0x0
    beq .L_60
    mov r2, r5, lsl #0x1
    ldrsh r3, [lr, r2]
    add r2, r4, r5, lsl #0x1
    add r2, r2, #0x6200
    mov r6, ip
    strh r3, [r2, #0x44]
.L_40:
    mov r2, r6, lsl #0x1
    ldrsh r3, [r0, r2]
    add r2, r1, r6, lsl #0x1
    add r2, r2, #0x6200
    add r6, r6, #0x1
    strh r3, [r2, #0x4e]
    cmp r6, #0x7
    blt .L_40
.L_60:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r0, r0, #0xe
    add r1, r1, #0xe
    blt .L_20
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov006_0224f2e0
_LIT1: .word data_ov006_0224f2c8
