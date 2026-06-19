; func_ov002_022aead0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d1910
        .extern func_02037208
        .extern func_ov002_02259774
        .extern func_ov002_0229a414
        .extern func_ov002_022ae718
        .extern func_ov002_022ae9c0
        .global func_ov002_022aead0
        .arm
func_ov002_022aead0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_ov002_022ae718
    movs r4, r0
    ldr r1, _LIT0
    movne r3, #0xc
    ldrh r0, [r1, #0x90]
    moveq r3, #0xb
    strh r0, [sp]
    ldrh r0, [sp]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov ip, r0, lsl #0x1f
    mov r0, ip, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_02259774
    ldr r0, _LIT1
    ldr r0, [r0, #0xc8]
    cmp r0, #0x0
    beq .L_3e8
    mov r0, #0x0
    bl func_ov002_0229a414
.L_3e8:
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_022ae9c0
    cmp r4, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d1910
_LIT1: .word data_ov002_022d0f2c
