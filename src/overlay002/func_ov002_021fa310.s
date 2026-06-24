; func_ov002_021fa310 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022be120
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_0202b100
        .extern func_ov002_021ae400
        .extern func_ov002_021ded30
        .extern func_ov002_022575c8
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_0229ce5c
        .global func_ov002_021fa310
        .arm
func_ov002_021fa310:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x100
    ldr r1, _LIT0
    mov r4, r0
    ldr r2, [r1, #0x5b4]
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_390
    b .L_218
    b .L_238
    b .L_2a8
    b .L_358
.L_218:
    ldrh r2, [r4, #0x6]
    mov r0, #0x0
    bic r2, r2, #0xff00
    strh r2, [r4, #0x6]
    strh r0, [r4, #0x8]
    ldr r0, [r1, #0x5b4]
    add r0, r0, #0x1
    str r0, [r1, #0x5b4]
.L_238:
    ldrh r1, [r4, #0x6]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x18
    ldr r0, [r0, r1, lsl #0x2]
    bl func_0202b100
    mov r2, r0
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_ov002_0229ce5c
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_2a8:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_344
    ldr r0, _LIT4
    ldrh r3, [r4, #0x8]
    ldr r1, [r0, #0xd74]
    ldr r0, [r0, #0xd78]
    mov r2, #0x1
    add r0, r1, r0
    orr r0, r3, r2, lsl r0
    strh r0, [r4, #0x8]
    ldrh r1, [r4, #0x6]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
    strh r0, [r4, #0x6]
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    cmp r0, #0x3
    mov r0, #0x0
    bcs .L_32c
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_32c:
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_344:
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1, #0x5b4]
    add sp, sp, #0x100
    ldmia sp!, {r4, pc}
.L_358:
    ldrh r1, [r4, #0x2]
    ldrh r2, [r4, #0x8]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x4
    mov r1, r2, lsl r1
    bl func_ov002_021ded30
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_390:
    mov r0, #0x1
    add sp, sp, #0x100
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022be120
_LIT2: .word 0x00000143
_LIT3: .word func_ov002_022575c8
_LIT4: .word data_ov002_022d016c
