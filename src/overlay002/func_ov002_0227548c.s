; func_ov002_0227548c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern func_0202b890
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bc288
        .extern func_ov002_021bc618
        .extern func_ov002_021c23ac
        .extern func_ov002_021c93cc
        .global func_ov002_0227548c
        .arm
func_ov002_0227548c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    add r6, r1, r2
    mov r7, r0
    cmp r6, #0xa
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT0
    ldr r1, [r1]
    mov r1, r1, lsl #0x1f
    cmp r7, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r1, r6
    bl func_ov002_021b9ecc
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c23ac
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT0
    ldrb r0, [r1, #0x8]
    cmp r0, #0x0
    bne .L_a10
    ldr r1, [r1]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x9
    rsb r1, r0, r1, lsr #0x11
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_980
    b .L_964
    b .L_96c
    b .L_974
    b .L_97c
.L_964:
    sub r5, r0, #0xac
    b .L_980
.L_96c:
    mov r5, #0x18c0
    b .L_980
.L_974:
    sub r5, r0, #0xaa
    b .L_980
.L_97c:
    sub r5, r0, #0xa9
.L_980:
    cmp r4, r5
    bne .L_aa0
    ldr r4, _LIT0
    mov r5, #0x0
.L_990:
    cmp r5, r6
    beq .L_a00
    ldr r0, [r4]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202b890
    mov r2, r0
    mov r0, r7
    mov r1, r5
    bl func_ov002_021c93cc
    cmp r0, #0x0
    beq .L_a00
    mov r0, r7
    bl func_ov002_021bc618
    cmp r0, #0x0
    bne .L_9f8
    mov r0, r7
    mov r1, r6
    bl func_ov002_021bc288
    cmp r0, #0x0
    bne .L_9f8
    mov r0, r7
    mov r1, r5
    bl func_ov002_021bc288
    cmp r0, #0x0
    beq .L_a00
.L_9f8:
    mov r0, #0x800
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_a00:
    add r5, r5, #0x1
    cmp r5, #0x4
    ble .L_990
    b .L_aa0
.L_a10:
    and r2, r7, #0xff
    and r0, r6, #0xff
    orr r0, r2, r0, lsl #0x8
    ldrh r2, [r1, #0x10]
    mov r0, r0, lsl #0x10
    cmp r2, r0, lsr #0x10
    beq .L_aa0
    ldr r0, [r1]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202b890
    mov r2, r0
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c93cc
    cmp r0, #0x0
    beq .L_aa0
    mov r0, r7
    bl func_ov002_021bc618
    cmp r0, #0x0
    bne .L_a98
    mov r0, r7
    mov r1, r6
    bl func_ov002_021bc288
    cmp r0, #0x0
    bne .L_a98
    ldr r1, _LIT0
    mov r0, r7
    ldrh r1, [r1, #0x10]
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    bl func_ov002_021bc288
    cmp r0, #0x0
    beq .L_aa0
.L_a98:
    mov r0, #0x800
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_aa0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word 0x0000196b
