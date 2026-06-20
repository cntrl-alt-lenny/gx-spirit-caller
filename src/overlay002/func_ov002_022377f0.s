; func_ov002_022377f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d0e6c
        .extern func_0202b890
        .extern func_ov002_021c3bdc
        .extern func_ov002_021d7b44
        .extern func_ov002_021d90c0
        .extern func_ov002_021e27c0
        .extern func_ov002_0226afb4
        .extern func_ov002_0226b094
        .global func_ov002_022377f0
        .arm
func_ov002_022377f0:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r6, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7f
    bgt .L_128
    bge .L_17c
    cmp r0, #0x78
    bgt .L_244
    cmp r0, #0x77
    blt .L_244
    beq .L_228
    cmp r0, #0x78
    beq .L_208
    b .L_244
.L_128:
    cmp r0, #0x80
    bne .L_244
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3bdc
    cmp r0, #0x0
    ldrh r0, [r6, #0x2]
    bne .L_164
    mov r0, r0, lsl #0x1f
    mov r1, #0x1
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e27c0
    mov r0, #0x78
    ldmia sp!, {r4, r5, r6, pc}
.L_164:
    ldrh r1, [r6]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226afb4
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_17c:
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
    bl func_0202b890
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
    bl func_ov002_021d7b44
    ldrh r0, [r6, #0x2]
    mov r2, r4
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d90c0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_208:
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b094
    mov r0, #0x77
    ldmia sp!, {r4, r5, r6, pc}
.L_228:
    ldrh r0, [r6, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e27c0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_244:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf16c
