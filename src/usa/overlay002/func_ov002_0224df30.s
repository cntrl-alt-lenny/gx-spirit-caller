; func_ov002_0224df30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_0202b854
        .extern func_0202de48
        .extern func_0202e1e0
        .extern func_ov002_021c3304
        .extern func_ov002_02253370
        .global func_ov002_0224df30
        .arm
func_ov002_0224df30:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    ldr r0, _LIT0
    and r2, r7, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT2
    mov r8, #0xe
    add r6, r0, r1
    add r0, r6, #0x18
    add r5, r0, #0x400
.L_3c:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r9, r0, lsr #0x13
    mov r0, r9
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_a0
    mov r0, r9
    bl func_0202de48
    cmp r0, #0x0
    bne .L_a0
    mov r0, r9
    bl func_0202b854
    cmp r0, #0x3
    bgt .L_a0
    mov r0, r7
    mov r1, r7
    mov r2, r4
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_a0
    mov r0, r7
    mov r1, r8
    mov r2, r4
    bl func_ov002_02253370
.L_a0:
    ldr r0, [r6, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_3c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
