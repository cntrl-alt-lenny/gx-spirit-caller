; func_ov017_021b5ce8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_021058e6
        .extern data_021058ee
        .extern func_020371b8
        .extern func_020a9828
        .extern func_020a985c
        .extern func_ov017_021b636c
        .extern func_ov017_021b6510
        .global func_ov017_021b5ce8
        .arm
func_ov017_021b5ce8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x68]
    cmp r1, #0x0
    beq .L_1010
    cmp r1, #0x1
    beq .L_10d4
    b .L_1118
.L_1010:
    bl func_ov017_021b636c
    ldr r0, [r4, #0x4]
    cmp r0, #0x2
    bne .L_10b0
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x10]
    add r1, r4, r1
    add r0, r1, r0
    ldrb r1, [r0, #0x20]
    ldr r0, [r4, #0x60]
    cmp r0, r1
    beq .L_10b0
    cmp r0, #0x0
    ble .L_10b0
    sub r1, r1, #0x1
    ldr r0, _LIT0
    mov r1, r1, lsl #0x3
    ldrh r0, [r0, r1]
    cmp r0, #0x0
    bne .L_1094
    ldr r0, _LIT1
    ldr r0, [r0, #0x38]
    bl func_020a985c
    bl func_020a9828
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1d
    ldr r2, [r4, #0x60]
    add r1, r1, r0, ror #0x1d
    ldr r0, _LIT2
    add r3, r1, #0xe
    mov r1, r2, lsl #0x3
    strh r3, [r0, r1]
    b .L_10b0
.L_1094:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_10b0:
    mov r1, #0x2
    mov r0, #0x3a
    str r1, [r4]
    mov r2, #0x0
    sub r1, r0, #0x3b
    mov r3, #0x1
    str r2, [r4, #0x8]
    bl func_020371b8
    b .L_1118
.L_10d4:
    ldr r2, [r4, #0xc]
    ldr r1, [r4, #0x10]
    add r2, r4, r2
    add r1, r2, r1
    ldrb r1, [r1, #0x20]
    ldr r2, [r4, #0x60]
    cmp r2, r1
    beq .L_10f8
    bl func_ov017_021b6510
.L_10f8:
    mov r1, #0x2
    mov r0, #0x42
    str r1, [r4]
    mov r2, #0x0
    sub r1, r0, #0x43
    mov r3, #0x1
    str r2, [r4, #0x8]
    bl func_020371b8
.L_1118:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_021058ee
_LIT1: .word data_02103fcc
_LIT2: .word data_021058e6
