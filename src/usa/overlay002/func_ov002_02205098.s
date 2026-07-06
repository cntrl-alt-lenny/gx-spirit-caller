; func_ov002_02205098 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern func_ov002_021c2250
        .extern func_ov002_021ff1d8
        .global func_ov002_02205098
        .arm
func_ov002_02205098:
    stmdb sp!, {r4, r5, r6, lr}
    ldrh r5, [r0, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r3, r5, lsl #0x1f
    mov lr, r3, lsr #0x1f
    and r3, lr, #0x1
    mul r4, r3, r1
    ldr r1, [r2, r4]
    cmp r1, #0x2
    movcc r0, #0x0
    ldmccia sp!, {r4, r5, r6, pc}
    mov r1, r5, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_1e4
    ldr r2, _LIT2
    mov r1, #0x0
    add r2, r2, r4
    add r3, r2, #0x30
    mov ip, r1
    mov r2, r3
.L_160:
    ldr r4, [r3]
    mov r4, r4, lsl #0x13
    movs r4, r4, lsr #0x13
    beq .L_1b8
    ldr r5, [r2, ip]
    ldrh r6, [r0, #0x4]
    mov r4, r5, lsl #0x2
    mov r4, r4, lsr #0x18
    mov r6, r6, lsl #0x11
    mov r5, r5, lsl #0x12
    mov r4, r4, lsl #0x1
    mov r6, r6, lsr #0x17
    add r4, r4, r5, lsr #0x1f
    cmp r6, r4
    beq .L_1b8
    mov r0, lr
    mov r2, #0x0
    bl func_ov002_021c2250
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_1b8:
    add r1, r1, #0x1
    cmp r1, #0xa
    add r3, r3, #0x14
    add ip, ip, #0x14
    ble .L_160
    mov r1, lr
    bl func_ov002_021ff1d8
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_1e4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf08c
