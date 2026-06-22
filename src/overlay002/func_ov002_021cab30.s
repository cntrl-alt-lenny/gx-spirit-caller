; func_ov002_021cab30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022ce950
        .extern data_ov002_022cf16c
        .extern func_ov002_021b9ecc
        .extern func_ov002_021c9af0
        .extern func_ov002_021c9b2c
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021cab30
        .arm
func_ov002_021cab30:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r8, #0x1
    ldr r1, [r0, #0x810]
    moveq r8, #0x0
    ldrh r5, [r0, #0x2]
    cmp r1, #0x0
    bne .L_3f4
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, r8, #0x1
    mla r6, r1, r0, r2
    mov r0, #0x14
    mul r0, r5, r0
    add r1, r6, #0x30
    ldr r2, [r1, r0]
    mov r4, #0x0
    ldr r0, _LIT3
    mov r1, #0x1
    str r1, [r0, #0x8]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    str r8, [r0]
    rsb r7, r8, #0x1
    str r7, [r0, #0x4]
    str r5, [r0, #0x1c]
    mov r3, #0x5
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    str r3, [r0, #0x20]
    add r1, r1, r2, lsr #0x1f
    str r1, [r0, #0x28]
    ldr r9, _LIT4
    str r4, [r0, #0x24]
    mov sl, r4
.L_388:
    cmp r4, r5
    beq .L_3a4
    mov r0, r8
    mov r1, r4
    bl func_ov002_021b9ecc
    cmp r0, r9
    streq sl, [r6, #0x3c]
.L_3a4:
    add r4, r4, #0x1
    cmp r4, #0x4
    add r6, r6, #0x14
    ble .L_388
    mov r0, r8
    mov r1, #0x12
    mov r2, #0x1
    bl func_ov002_021c9b2c
    mov r0, #0x1
    mov r1, r0
    bl func_ov002_021c9af0
    mov r1, r5
    mov r2, r7
    mov r0, #0xb
    mov r3, #0x5
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
.L_3f4:
    mov r0, #0xb
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cd3f4
_LIT4: .word 0x00001a79
