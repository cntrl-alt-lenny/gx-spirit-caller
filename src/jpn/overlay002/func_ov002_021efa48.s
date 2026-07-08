; func_ov002_021efa48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce7a4
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021b3ef8
        .extern func_ov002_021c8390
        .global func_ov002_021efa48
        .arm
func_ov002_021efa48:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    ldr r1, _LIT0
    and r3, r5, #0x1
    mov r4, r2
    mov r2, #0x14
    mul r1, r3, r1
    ldr r3, _LIT1
    mul r2, r4, r2
    add r3, r3, r1
    add r3, r3, r2
    ldr r3, [r3, #0x30]
    mov r6, r0
    mov r0, r3, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r4, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT2
    add r0, r0, r1
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8390
    cmp r0, #0x3e8
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x8]
    cmp r0, #0x0
    bne .L_ec
    ldr r3, _LIT3
    mov r2, #0x0
    ldr ip, [r3, #0x5d4]
    cmp ip, #0x0
    bls .L_10c
    ldr r6, _LIT4
.L_a4:
    ldrb r0, [r3, #0x5dc]
    cmp r0, #0x6
    cmpne r0, #0x7
    cmpne r0, #0x8
    bne .L_d4
    ldr r0, [r6]
    mov r1, r0, lsl #0x16
    cmp r5, r1, lsr #0x1f
    moveq r0, r0, lsl #0x12
    cmpeq r4, r0, lsr #0x1c
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
.L_d4:
    add r2, r2, #0x1
    cmp r2, ip
    add r3, r3, #0x1
    add r6, r6, #0x4
    bcc .L_a4
    b .L_10c
.L_ec:
    ldrh r1, [r6, #0x4]
    ldr r2, _LIT5
    mov r0, r5
    mov r3, r1, lsl #0x11
    mov r1, r4
    mov r3, r3, lsr #0x17
    bl func_ov002_021b3ef8
    ldmia sp!, {r4, r5, r6, pc}
.L_10c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022ce1a8
_LIT4: .word data_ov002_022ce7a4
_LIT5: .word 0x00001518
