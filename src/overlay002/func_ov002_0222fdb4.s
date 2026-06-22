; func_ov002_0222fdb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf178
        .extern data_ov002_022d0250
        .extern data_ov002_022d0e6c
        .extern func_0202b8a8
        .extern func_0202e234
        .extern func_ov002_021ca5bc
        .extern func_ov002_021df818
        .extern func_ov002_0226af38
        .global func_ov002_0222fdb4
        .arm
func_ov002_0222fdb4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7f
    beq .L_664
    cmp r0, #0x80
    bne .L_6d4
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r1, #0x1
    mov r2, r1
    bl func_ov002_0226af38
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_664:
    ldr r0, _LIT3
    ldrh r0, [r0, #0xb0]
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    beq .L_6cc
    ldr r0, _LIT3
    ldr r1, _LIT4
    ldrh r0, [r0, #0xb0]
    mov r0, r0, lsl #0x2
    ldrh r0, [r1, r0]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202e234
    cmp r0, #0x0
    beq .L_6cc
    mov r0, r5
    bl func_0202b8a8
    mov r1, #0x64
    ldrh r3, [r4, #0x2]
    mul r2, r0, r1
    mov r0, r3, lsl #0x1f
    mov r1, r0, lsr #0x1f
    mov r0, r4
    rsb r1, r1, #0x1
    bl func_ov002_021df818
.L_6cc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_6d4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022d0e6c
_LIT4: .word data_ov002_022d0250
