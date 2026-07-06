; func_ov002_022187c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf098
        .extern data_ov002_022cf0c8
        .extern func_ov002_021e2ca4
        .extern func_ov002_0226ac6c
        .global func_ov002_022187c4
        .arm
func_ov002_022187c4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_174
    cmp r1, #0x80
    bne .L_1d8
    ldrh r0, [r0, #0x2]
    mov r2, #0x5
    mov r3, #0x0
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021e2ca4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_174:
    ldrh r0, [r0, #0x2]
    ldr r1, _LIT1
    ldr lr, _LIT2
    mov r2, r0, lsl #0x1f
    mov r3, r2, lsr #0x1f
    mov r2, r0, lsl #0x1a
    rsb r0, r3, #0x1
    and r4, r3, #0x1
    mov r3, r2, lsr #0x1b
    mov r2, #0x14
    mul ip, r3, r2
    mla r2, r4, r1, lr
    and r5, r0, #0x1
    mul r4, r5, r1
    ldr r2, [ip, r2]
    ldr r3, _LIT3
    add r1, r2, #0x1
    ldr r2, [r3, r4]
    mov r3, #0x1
    cmp r1, r2
    movcs r1, r2
    mov r2, #0x0
    bl func_ov002_0226ac6c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_1d8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0c8
_LIT3: .word data_ov002_022cf098
