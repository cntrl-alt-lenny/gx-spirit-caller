; func_ov002_02204840 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern IsValue12D3Or147E
        .extern func_ov002_021b87f8
        .global func_ov002_02204840
        .arm
func_ov002_02204840:
    stmdb sp!, {r3, r4, r5, lr}
    movs r5, r1
    mov r4, r0
    beq .L_68
    ldrh r0, [r5]
    bl IsValue12D3Or147E
    cmp r0, #0x0
    bne .L_100
    mov r0, r5
    bl func_ov002_021b87f8
    cmp r0, #0x0
    beq .L_100
    ldrh r3, [r4, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r3, lsl #0x11
    mov r3, r3, lsl #0x1f
    mov r2, r2, lsr #0x1f
    eor r2, r2, r3, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x320
    ble .L_100
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, pc}
.L_68:
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x1f
    cmpne r0, #0x20
    beq .L_8c
    cmp r0, #0x21
    beq .L_94
    b .L_100
.L_8c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_94:
    ldr r3, [r4, #0x14]
    ldr r2, _LIT0
    mov r0, r3, lsl #0x16
    mov r4, r0, lsr #0x1f
    ldr r0, _LIT1
    and r4, r4, #0x1
    mla ip, r4, r2, r0
    mov r3, r3, lsl #0x12
    mov r4, r3, lsr #0x1c
    mov r3, #0x14
    mla r3, r4, r3, ip
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    beq .L_f8
    mov r3, r1, lsl #0x11
    mov r4, r1, lsl #0x1f
    mov r1, r3, lsr #0x1f
    eor r1, r1, r4, lsr #0x1f
    and r1, r1, #0x1
    mul r2, r1, r2
    ldr r0, [r0, r2]
    cmp r0, #0x320
    movgt r0, #0x2
    ldmgtia sp!, {r3, r4, r5, pc}
.L_f8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_100:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
