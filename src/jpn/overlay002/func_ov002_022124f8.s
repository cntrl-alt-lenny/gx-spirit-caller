; func_ov002_022124f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021ae3dc
        .extern func_ov002_021ba1b4
        .extern func_ov002_021d8198
        .extern func_ov002_021e277c
        .extern func_ov002_022535a4
        .extern func_ov002_0226af64
        .global func_ov002_022124f8
        .arm
func_ov002_022124f8:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x6f
    bgt .L_28
    bge .L_178
    cmp r0, #0x64
    beq .L_194
    b .L_1ac
.L_28:
    sub r0, r0, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_1ac
    b .L_160
    b .L_f0
    b .L_68
    b .L_48
.L_48:
    ldrh r2, [r4]
    ldr r0, _LIT1
    cmp r2, r0
    moveq r0, #0x9
    movne r0, #0x2
    str r0, [r1, #0x5ac]
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_68:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ba1b4
    movs ip, r0
    bmi .L_d4
    ldrh r0, [r4, #0x2]
    ldr r3, _LIT2
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x260
    add r1, r1, ip, lsl #0x2
    bl func_ov002_021d8198
    cmp r0, #0x0
    beq .L_d4
    ldr r0, _LIT0
    ldr r1, [r0, #0x5ac]
    sub r1, r1, #0x1
    str r1, [r0, #0x5ac]
    cmp r1, #0x0
    movgt r0, #0x7e
    movle r0, #0x64
    ldmia sp!, {r4, pc}
.L_d4:
    ldrh r0, [r4, #0x2]
    mov r1, #0x15
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x6f
    ldmia sp!, {r4, pc}
.L_f0:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    cmp r0, #0x0
    movle r0, #0x64
    ldmleia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_144
    ldr r0, _LIT5
    mov r1, #0x1
    str r1, [r0, #0xd44]
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_144:
    ldrh r1, [r4, #0x4]
    mov r0, #0x1c
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021ae3dc
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_160:
    ldr r0, _LIT5
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    movne r0, #0x7f
    moveq r0, #0x64
    ldmia sp!, {r4, pc}
.L_178:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226af64
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_194:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1ac:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00001919
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cd664
_LIT5: .word data_ov002_022d008c
