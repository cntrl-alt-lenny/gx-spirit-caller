; func_ov002_0220be14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf1a4
        .extern func_0202e2f8
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bc0d4
        .extern func_ov002_021c8470
        .extern func_ov002_021ff3bc
        .extern func_ov002_0223f6c4
        .extern func_ov002_022536e8
        .global func_ov002_0220be14
        .arm
func_ov002_0220be14:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldrh r0, [r7, #0x2]
    mov r4, r1
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    mov r2, #0x0
    bl func_ov002_021bc0d4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r4
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r3, _LIT0
    mov r2, #0x0
    ldr r4, [r3, #0x5d4]
    mov r1, r2
    cmp r4, #0x0
    bls .L_80
.L_64:
    ldrb r0, [r3, #0x5dc]
    add r1, r1, #0x1
    add r3, r3, #0x1
    cmp r0, #0x8
    addeq r2, r2, #0x1
    cmp r1, r4
    bcc .L_64
.L_80:
    cmp r2, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x8
    bne .L_1dc
    ldr r0, [r7, #0x14]
    mov r1, r0, lsl #0x16
    mov r0, r0, lsl #0x12
    mov r5, r1, lsr #0x1f
    mov r6, r0, lsr #0x1c
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b9ecc
    ldrh r1, [r7, #0x2]
    mov r4, r0
    mov r1, r1, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r3, [r7, #0x14]
    mov r1, r3, lsl #0x10
    movs r1, r1, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT1
    and ip, r5, #0x1
    mov r2, #0x14
    mul r1, ip, r1
    ldr ip, _LIT2
    mul r2, r6, r2
    add ip, ip, r1
    ldrh ip, [r2, ip]
    cmp ip, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr ip, _LIT3
    mov r3, r3, lsl #0x17
    add r1, ip, r1
    add r1, r1, #0x30
    ldr r2, [r1, r2]
    mov r3, r3, lsr #0x17
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    cmp r3, r1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_0202e2f8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c8470
    ldr r1, _LIT4
    cmp r0, r1
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    strh r4, [r7, #0xa]
    ldrh r2, [r7, #0x2]
    add r0, r1, #0x28c
    ldr r1, _LIT5
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    bne .L_1d4
    mov r0, r7
    bl func_ov002_0223f6c4
    ldrh r3, [r7, #0x2]
    mov r2, r0
    ldrh r1, [r7]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_1d4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1dc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf16c
_LIT4: .word 0x000005dc
_LIT5: .word data_ov002_022cf17c
