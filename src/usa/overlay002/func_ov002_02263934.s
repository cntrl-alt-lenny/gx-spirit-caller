; func_ov002_02263934 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202e2d4
        .extern func_ov002_021b9dec
        .extern func_ov002_021baf88
        .extern func_ov002_021e2fc4
        .global func_ov002_02263934
        .arm
func_ov002_02263934:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r5, r0
    ldr r0, _LIT0
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r6, #0x0
.L_20:
    eor r7, r5, r6
    ldr r0, _LIT1
    ldr r1, _LIT2
    and r2, r7, #0x1
    mla r4, r2, r0, r1
    mov sl, r4
    mov r8, #0x0
.L_3c:
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9dec
    mov r9, r0
    bl func_0202e2d4
    cmp r0, #0x0
    beq .L_108
    ldr r0, [sl, #0x40]
    mov r1, r0, lsr #0x10
    tst r1, #0x1
    bne .L_80
    mov r1, r0, lsr #0x11
    tst r1, #0x1
    bne .L_80
    mov r1, r0, lsr #0x13
    tst r1, #0x1
    beq .L_108
.L_80:
    mov r2, r0, lsr #0x6
    mov r1, r0, lsr #0x2
    and r2, r2, #0x1
    orr r0, r1, r0, lsr #0x1
    and r0, r0, #0x1
    ldrh r3, [sl, #0x38]
    mvn r1, r2
    mvn r0, r0
    and r1, r3, r1
    tst r1, r0
    beq .L_108
    mov r0, #0x14
    mul r0, r8, r0
    add r1, r4, #0x30
    ldr r1, [r1, r0]
    mov r2, r7, lsl #0x1f
    mov r0, r1, lsl #0x2
    and r3, r2, #-2147483648
    mov r0, r0, lsr #0x18
    mov r2, r8, lsl #0x10
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r1, r0, lsl #0x10
    orr r3, r3, #0xa200000
    and r2, r2, #0x1f0000
    mov r0, r9, lsl #0x10
    orr r2, r3, r2
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e2fc4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_108:
    add r8, r8, #0x1
    cmp r8, #0x4
    add sl, sl, #0x14
    ble .L_3c
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_20
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x0000150e
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
