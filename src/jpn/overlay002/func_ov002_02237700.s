; func_ov002_02237700 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0d8c
        .extern func_0202b83c
        .extern func_ov002_021c3afc
        .extern func_ov002_021d7a54
        .extern func_ov002_021d8fd0
        .extern func_ov002_021e26d0
        .extern func_ov002_0226aec4
        .extern func_ov002_0226afa4
        .global func_ov002_02237700
        .arm
func_ov002_02237700:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r6, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7f
    bgt .L_3c
    bge .L_90
    cmp r0, #0x78
    bgt .L_158
    cmp r0, #0x77
    blt .L_158
    beq .L_13c
    cmp r0, #0x78
    beq .L_11c
    b .L_158
.L_3c:
    cmp r0, #0x80
    bne .L_158
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3afc
    cmp r0, #0x0
    ldrh r0, [r6, #0x2]
    bne .L_78
    mov r0, r0, lsl #0x1f
    mov r1, #0x1
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e26d0
    mov r0, #0x78
    ldmia sp!, {r4, r5, r6, pc}
.L_78:
    ldrh r1, [r6]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226aec4
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_90:
    ldrh r2, [r6, #0x2]
    ldr r1, _LIT1
    ldr r0, _LIT2
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r2, _LIT3
    and r3, r3, #0x1
    mla r0, r3, r0, r2
    ldrh r5, [r1, #0xb0]
    add r0, r0, r5, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b83c
    ldrh r1, [r6, #0x2]
    mov r4, r0
    ldr r3, _LIT3
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT2
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x120
    add r1, r1, r5, lsl #0x2
    mov r2, #0x0
    bl func_ov002_021d7a54
    ldrh r0, [r6, #0x2]
    mov r2, r4
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8fd0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_11c:
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226afa4
    mov r0, #0x77
    ldmia sp!, {r4, r5, r6, pc}
.L_13c:
    ldrh r0, [r6, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e26d0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_158:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d0d8c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf08c
