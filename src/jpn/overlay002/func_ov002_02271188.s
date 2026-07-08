; func_ov002_02271188 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern func_0202b824
        .extern func_0202b83c
        .extern func_ov002_021c8860
        .extern func_ov002_021c92ec
        .global func_ov002_02271188
        .arm
func_ov002_02271188:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    mov r6, r0
    ldr r0, [r3]
    mov r3, r0, lsl #0x1f
    cmp r6, r3, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r5, r1, r2
    cmp r5, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT1
    mov r0, r0, lsl #0x9
    cmp r1, r0, lsr #0x11
    mov r4, r0, lsr #0x11
    bcc .L_658
    cmp r4, r1
    bcs .L_6a0
    ldr r0, _LIT2
    cmp r4, r0
    bhi .L_630
    beq .L_678
    b .L_6c8
.L_630:
    sub r0, r1, #0x19
    cmp r4, r0
    bhi .L_6c8
    sub r0, r1, #0x1b
    cmp r4, r0
    bcc .L_6c8
    subne r0, r1, #0x19
    cmpne r4, r0
    beq .L_6a0
    b .L_6c8
.L_658:
    add r0, r1, #0x1d0
    cmp r4, r0
    bhi .L_66c
    beq .L_678
    b .L_6c8
.L_66c:
    ldr r0, _LIT3
    cmp r4, r0
    bne .L_6c8
.L_678:
    mov r0, r6
    mov r1, r5
    bl func_ov002_021c8860
    mov r5, r0
    mov r0, r4
    bl func_0202b824
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    b .L_6e0
.L_6a0:
    ldr r0, _LIT0
    mov r1, r5
    ldr r0, [r0, #0x18]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x18
    movne r2, #0x2
    moveq r2, #0x1
    mov r0, r6
    bl func_ov002_021c92ec
    b .L_6e0
.L_6c8:
    mov r0, r4
    bl func_0202b83c
    mov r2, r0
    mov r0, r6
    mov r1, r5
    bl func_ov002_021c92ec
.L_6e0:
    cmp r0, #0x0
    movne r0, #0x800
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word 0x000016e4
_LIT2: .word 0x00001466
_LIT3: .word 0x000019ca
