; func_ov002_02217934 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf098
        .extern data_ov002_022d0d8c
        .extern func_ov002_021c9310
        .extern func_ov002_021d70f0
        .extern func_ov002_021e277c
        .extern func_ov002_0226aea4
        .extern func_ov002_0226aec4
        .global func_ov002_02217934
        .arm
func_ov002_02217934:
    stmdb sp!, {r3, r4, r5, lr}
    mov r1, r0
    ldrh r0, [r1, #0x4]
    ldrh r2, [r1, #0x8]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    and r4, r2, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7f
    beq .L_1d8
    cmp r0, #0x80
    bne .L_21c
    ldrh r0, [r1, #0x2]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    mov r0, r0, lsr #0x1f
    bne .L_1a4
    and r3, r0, #0x1
    mul r4, r3, r2
    ldr r2, _LIT2
    ldr r2, [r2, r4]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r1]
    bl func_ov002_0226aec4
    b .L_1d0
.L_1a4:
    rsb r3, r0, #0x1
    and r3, r3, #0x1
    mul r4, r3, r2
    ldr r2, _LIT2
    ldr r2, [r2, r4]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r1]
    mov r2, #0x1
    bl func_ov002_0226aea4
.L_1d0:
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_1d8:
    ldr r1, _LIT3
    mov r0, r4
    ldrh r5, [r1, #0xb0]
    mov r1, #0xb
    mov r2, r5
    bl func_ov002_021c9310
    ldr r1, [r0]
    mov r0, r4
    mov r2, r1, lsl #0x12
    mov r4, r2, lsr #0x1f
    mov r1, r5
    mov r2, #0x1
    bl func_ov002_021d70f0
    mov r0, r4
    bl func_ov002_021e277c
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, pc}
.L_21c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022d0d8c
