; func_ov002_0222a178 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_ov002_021d7b2c
        .extern func_ov002_021e15b4
        .extern func_ov002_021e26d0
        .extern func_ov002_021e277c
        .extern func_ov002_022100d4
        .extern func_ov002_0226af64
        .global func_ov002_0222a178
        .arm
func_ov002_0222a178:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    ldr r2, [r2, #0x5a8]
    sub r2, r2, #0x7a
    cmp r2, #0x6
    addls pc, pc, r2, lsl #0x2
    b .L_160
    b .L_144
    b .L_124
    b .L_10c
    b .L_e4
    b .L_64
    b .L_44
    b .L_38
.L_38:
    bl func_ov002_022100d4
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_44:
    ldrh r0, [r0, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_64:
    ldrh r0, [r0, #0x2]
    ldr r2, _LIT1
    ldr r3, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and ip, r0, #0x1
    mul lr, ip, r2
    ldr r4, [r3, lr]
    mov r3, #0x0
    cmp r4, #0x0
    bls .L_dc
    ldr r2, _LIT3
    ldrh ip, [r1]
    add lr, r2, lr
    add r2, lr, #0x120
.L_a4:
    ldr r1, [r2]
    mov r1, r1, lsl #0x13
    cmp ip, r1, lsr #0x13
    bne .L_cc
    add r1, lr, #0x120
    add r1, r1, r3, lsl #0x2
    mov r2, #0x1
    bl func_ov002_021d7b2c
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_cc:
    add r3, r3, #0x1
    cmp r3, r4
    add r2, r2, #0x4
    bcc .L_a4
.L_dc:
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_e4:
    ldrh r0, [r0, #0x2]
    mov r2, #0x1
    ldrh r1, [r1]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, r2
    rsb r0, r0, #0x1
    bl func_ov002_021e15b4
    mov r0, #0x7c
    ldmia sp!, {r4, pc}
.L_10c:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226af64
    mov r0, #0x7b
    ldmia sp!, {r4, pc}
.L_124:
    ldrh r0, [r0, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x7a
    ldmia sp!, {r4, pc}
.L_144:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_160:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022cf08c
