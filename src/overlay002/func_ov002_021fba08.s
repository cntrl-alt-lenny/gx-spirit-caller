; func_ov002_021fba08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021ae70c
        .extern func_ov002_021df780
        .extern func_ov002_0226eb5c
        .global func_ov002_021fba08
        .arm
func_ov002_021fba08:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r3, r0
    ldrh r2, [r3, #0x2]
    ldr r0, _LIT0
    mov r1, r2, lsl #0x11
    ldr r0, [r0, #0x5b4]
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    cmp r0, #0x0
    eor r4, r1, r2, lsr #0x1f
    beq .L_8c8
    cmp r0, #0x1
    beq .L_9ec
    b .L_a0c
.L_8c8:
    mov r0, #0x3e8
    str r0, [sp, #0x4]
    ldr r2, _LIT1
    and r1, r4, #0x1
    add r0, r0, #0x480
    mla r9, r1, r0, r2
    mov r7, #0x0
    mov r8, r7
    mov fp, r7
    mov r6, #0x1
.L_8f0:
    ldr r1, [r9]
    ldr r0, [sp, #0x4]
    cmp r1, r0
    ble .L_984
    ldr r0, [r9, #0xc]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_96c
    add sl, r9, #0x120
.L_914:
    ldr r2, [sl]
    mov r0, r4
    mov r1, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r1, r2, r1, lsr #0x1f
    mov r2, #0x1
    mov r3, r6
    bl func_ov002_0226eb5c
    cmp r0, #0x0
    beq .L_958
    mov r0, #0x1
    orr r7, r7, r0, lsl r6
    cmp r8, #0x0
    moveq r8, r6
    mov fp, r6
.L_958:
    ldr r0, [r9, #0xc]
    add r5, r5, #0x1
    cmp r5, r0
    add sl, sl, #0x4
    bcc .L_914
.L_96c:
    ldr r0, [sp, #0x4]
    add r6, r6, #0x1
    add r0, r0, #0x3e8
    cmp r6, #0x3
    str r0, [sp, #0x4]
    ble .L_8f0
.L_984:
    cmp r7, #0x0
    beq .L_a0c
    cmp fp, r8
    ldrne r0, _LIT2
    ldrne r0, [r0, r4, lsl #0x2]
    cmpne r0, #0x1
    ldreq r0, _LIT3
    streq fp, [r0, #0xd44]
    beq .L_9d0
    cmp r7, #0xa
    moveq r1, #0x1
    movne r1, #0x0
    add r4, r1, #0x1
    ldr r0, _LIT4
    mov r2, r8
    mov r3, fp
    add r1, r0, #0x1
    str r4, [sp]
    bl func_ov002_021ae70c
.L_9d0:
    ldr r1, _LIT0
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_9ec:
    ldr r0, _LIT3
    mov r1, #0x3e8
    ldr r2, [r0, #0xd44]
    mov r0, r4
    strh r2, [r3, #0x8]
    ldrh r2, [r3, #0x8]
    mul r1, r2, r1
    bl func_ov002_021df780
.L_a0c:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cd744
_LIT3: .word data_ov002_022d016c
_LIT4: .word 0x0000012d
