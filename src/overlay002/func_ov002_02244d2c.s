; func_ov002_02244d2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021d8770
        .extern func_ov002_0223dad0
        .extern func_ov002_02244cd8
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .global func_ov002_02244d2c
        .arm
func_ov002_02244d2c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b8]
    cmp r0, #0x0
    beq .L_24
    cmp r0, #0x1
    beq .L_68
    b .L_e0
.L_24:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_68:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_c8
    ldr r0, _LIT3
    ldr r2, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr r5, [r0, #0xd70]
    add r6, r2, r1
    mov r0, r5
    mov r1, r6
    bl func_ov002_021d8770
    and r1, r5, #0xff
    and r0, r6, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r1, r0, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    bl func_ov002_0223dad0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_c8:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_e0:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000145
_LIT2: .word func_ov002_02244cd8
_LIT3: .word data_ov002_022d016c
