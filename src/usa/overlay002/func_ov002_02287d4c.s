; func_ov002_02287d4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf09c
        .extern data_ov002_022cf0a0
        .extern func_ov002_021bbc34
        .extern func_ov002_021c3a04
        .global func_ov002_02287d4c
        .arm
func_ov002_02287d4c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT0
    ldr ip, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    rsb lr, r0, #0x1
    mul r1, r3, r2
    and lr, lr, #0x1
    ldr r3, [ip, r1]
    mul r5, lr, r2
    ldr r2, _LIT2
    cmp r3, #0x5
    ldr lr, [r2, r5]
    bcs .L_54
    ldr r2, [ip, r5]
    cmp r2, r3
    movhi r0, #0x1
    ldmhiia sp!, {r3, r4, r5, pc}
.L_54:
    ldr r2, _LIT1
    ldr r2, [r2, r5]
    cmp lr, r2
    movcs r0, #0x0
    ldmcsia sp!, {r3, r4, r5, pc}
    ldr r2, _LIT2
    ldr r1, [r2, r1]
    cmp lr, r1
    movcs r0, #0x0
    ldmcsia sp!, {r3, r4, r5, pc}
    cmp lr, #0x0
    beq .L_b8
    ldr r1, _LIT3
    bl func_ov002_021c3a04
    cmp r0, #0x0
    bne .L_b0
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbc34
    cmp r0, #0x0
    beq .L_b8
.L_b0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_b8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf0a0
_LIT3: .word 0x000012f9
