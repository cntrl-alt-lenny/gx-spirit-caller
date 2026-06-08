; func_ov020_021ab0d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov020_021ae060
        .extern data_ov020_021ae0a8
        .extern func_0208e200
        .extern func_0209448c
        .extern func_020b3870
        .global func_ov020_021ab0d8
        .arm
func_ov020_021ab0d8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldr r4, _LIT0
    bl func_0208e200
    ldr r1, _LIT1
    ldr r5, _LIT2
    ldr r7, [r1, #0x8d8]
    mov r3, #0x11
    smull r2, r6, r5, r7
    mov r1, r7, lsr #0x1f
    add r6, r1, r6, asr #0x3
    add r2, r0, #0x6
    smull r0, r1, r3, r6
    sub r6, r7, r0
    sub r1, r7, r6
    mov r0, r1, lsr #0x1f
    smull r1, r3, r5, r1
    add r3, r0, r3, asr #0x3
    mov r0, r8
    add r1, r3, #0x1
    add r5, r2, #0x100
    mov r6, #0x55
    bl func_020b3870
    mov r8, r1
    ldr r0, _LIT3
    add r1, r8, r8, lsl #0x4
    mla r6, r8, r0, r6
    sub r0, r7, r1
    cmp r0, #0x12
    ldrlt r0, [r4, #0x890]
    mov r4, #0x0
    sublt r3, r0, r1
    movge r3, #0x12
    cmp r3, #0x0
    ble .L_bc
    mov r1, r4
.L_90:
    mov r2, r1
.L_94:
    orr r0, r6, #0xf000
    add r2, r2, #0x1
    cmp r2, #0x1b
    strh r0, [r5], #0x2
    add r6, r6, #0x1
    blt .L_94
    add r4, r4, #0x1
    cmp r4, r3
    add r5, r5, #0xa
    blt .L_90
.L_bc:
    cmp r4, #0x12
    bge .L_ec
    mov r7, #0x0
    mov r6, #0x36
.L_cc:
    mov r0, r7
    mov r1, r5
    mov r2, r6
    bl func_0209448c
    add r4, r4, #0x1
    cmp r4, #0x12
    add r5, r5, #0x40
    blt .L_cc
.L_ec:
    mov r0, r8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov020_021ae0a8
_LIT1: .word data_ov020_021ae060
_LIT2: .word 0x78787879
_LIT3: .word 0x000001cb
