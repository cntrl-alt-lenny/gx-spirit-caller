; func_ov014_021b280c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_02105989
        .extern data_ov014_022350f4
        .extern func_02009758
        .extern func_0201ef3c
        .extern func_020aadf8
        .extern func_ov014_021b4248
        .global func_ov014_021b280c
        .arm
func_ov014_021b280c:
    stmdb sp!, {r4, lr}
    mov r3, #0x4000000
    ldr r1, [r3]
    add r2, r3, #0x1000
    bic r1, r1, #0x1f00
    str r1, [r3]
    ldr r1, [r2]
    mov r4, r0
    bic r0, r1, #0x1f00
    str r0, [r2]
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq .L_50
    ldr r0, [r4, #0x38]
    add r1, r4, #0x40
    add r2, r4, #0x44
    bl func_0201ef3c
    mov r0, #0x0
    str r0, [r4, #0x48]
    str r0, [r4, #0x44]
.L_50:
    ldr r0, [r4, #0x2c]
    cmp r0, #0x0
    bne .L_e8
    ldr r0, _LIT0
    bl func_ov014_021b4248
    orr r3, r0, #0x52000000
    ldr r2, _LIT1
    ldr r0, _LIT2
    add r1, r4, #0xc
    str r3, [r2, #0xa64]
    bl func_020aadf8
    ldr r1, _LIT1
    mov r0, #0x26
    ldr r2, [r1, #0x4]
    ldrb r3, [r1, #0xa3c]
    mov r2, r2, lsl #0x1d
    mov r2, r2, lsr #0x1d
    and r2, r2, #0xff
    bic r3, r3, #0x7
    and r2, r2, #0x7
    orr r2, r3, r2
    strb r2, [r1, #0xa3c]
    bl func_02009758
    mov r0, #0x27
    bl func_02009758
    mov r0, #0x28
    bl func_02009758
    mov r0, #0x29
    bl func_02009758
    mov r0, #0x2a
    bl func_02009758
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0xa78]
    ldr r1, [r0, #0xa68]
    orr r1, r1, #0x10000
    orr r1, r1, #0x1
    str r1, [r0, #0xa68]
.L_e8:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov014_022350f4
_LIT1: .word data_02104f4c
_LIT2: .word data_02105989
