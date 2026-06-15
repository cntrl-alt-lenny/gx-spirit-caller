; func_020a3d34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a98f0
        .extern data_021a98f4
        .extern data_021a98f8
        .extern data_021a98fc
        .extern func_0209e8d0
        .extern func_0209f070
        .extern func_020a3830
        .extern func_020a53e4
        .global func_020a3d34
        .arm
func_020a3d34:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r3, #0x0
    ldr r1, [r2]
    mov r0, #0xa
    add r1, r1, #0x500
    strh r3, [r1, #0x28]
    ldr r1, [r2]
    add r1, r1, #0x500
    strh r3, [r1, #0x2a]
    ldr r1, [r2]
    add r1, r1, #0x500
    strh r3, [r1, #0x26]
    ldr r1, [r2]
    add r1, r1, #0x500
    strh r3, [r1, #0x48]
    bl func_020a3830
    ldr r0, _LIT1
    ldr r0, [r0]
    add r0, r0, #0x1000
    ldr r0, [r0, #0x320]
    cmp r0, #0x0
    bne .L_334
    ldr r6, _LIT2
    ldr r5, _LIT0
    ldr r4, _LIT3
.L_2dc:
    ldr r1, [r5]
    ldrh r2, [r4]
    ldr r0, [r6]
    ldr r1, [r1, #0x508]
    bl func_0209f070
    cmp r0, #0x4
    beq .L_2dc
    cmp r0, #0x2
    movne r0, #0x8
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x508]
    bl func_0209e8d0
    ldr r0, _LIT0
    mov r2, #0x1
    ldr r1, [r0]
    mov r0, #0x0
    strb r2, [r1, #0x50d]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_334:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x508]
    bl func_0209e8d0
    ldr r0, _LIT0
    mov r1, #0x1
    ldr r0, [r0]
    strb r1, [r0, #0x50d]
    bl func_020a53e4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a98f8
_LIT1: .word data_021a98fc
_LIT2: .word data_021a98f4
_LIT3: .word data_021a98f0
