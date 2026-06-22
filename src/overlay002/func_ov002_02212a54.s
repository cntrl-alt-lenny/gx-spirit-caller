; func_ov002_02212a54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf184
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021e16a4
        .global func_ov002_02212a54
        .arm
func_ov002_02212a54:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7e
    beq .L_19c
    cmp r0, #0x7f
    beq .L_178
    cmp r0, #0x80
    bne .L_1cc
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r1, #0x1b
    bl func_ov002_021ae400
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_178:
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_19c:
    bl func_ov002_021afb74
    ldr r0, [r0]
    mov r2, #0x0
    ldrh r1, [r4, #0x2]
    mov ip, r0, lsl #0x13
    mov r3, r2
    mov r0, r1, lsl #0x1f
    mov r1, ip, lsr #0x13
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e16a4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1cc:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf184
