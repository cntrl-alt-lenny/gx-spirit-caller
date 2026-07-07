; func_ov002_02238488 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_ov002_021b99c8
        .extern func_ov002_021e26d0
        .extern func_ov002_0226afa4
        .extern func_ov002_0227acc8
        .global func_ov002_02238488
        .arm
func_ov002_02238488:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    ldr r0, [r4, #0x14]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x17
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021b99c8
    ldr r2, _LIT0
    mov r1, r0
    ldr r0, [r2, #0x5a8]
    cmp r0, #0x64
    beq .L_d8
    cmp r0, #0x6e
    beq .L_b8
    cmp r0, #0x80
    bne .L_f4
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT1
    ldr r3, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r4, r0, #0x1
    and r4, r4, #0x1
    mul ip, r4, r2
    ldr r3, [r3, ip]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r1, #0x0
    bge .L_90
    mov r1, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x6e
    ldmia sp!, {r4, pc}
.L_90:
    ldr r4, _LIT3
    and r3, r0, #0x1
    mla r2, r3, r2, r4
    add r2, r2, #0x120
    add r1, r2, r1, lsl #0x2
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_0227acc8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_b8:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226afa4
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_d8:
    ldrh r0, [r4, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e26d0
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_f4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022cf08c
