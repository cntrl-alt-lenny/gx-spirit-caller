; func_ov002_022406c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021ae514
        .extern func_ov002_021e8a18
        .extern func_ov002_0223dad0
        .extern func_ov002_0223dcc0
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_0226b0d0
        .extern func_ov002_0228df3c
        .global func_ov002_022406c4
        .arm
func_ov002_022406c4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrh r3, [r4, #0x2]
    ldr r2, _LIT0
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    ldr r2, [r2, r3, lsl #0x2]
    cmp r2, #0x1
    bne .L_48
    ldr r2, _LIT1
    bl func_ov002_0228df3c
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_0223dad0
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_48:
    ldr r1, _LIT2
    ldr r1, [r1, #0x5b8]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_18c
    b .L_6c
    b .L_ac
    b .L_10c
    b .L_148
.L_6c:
    mov r0, r3
    mov r1, #0x65
    bl func_ov002_021ae400
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT2
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_ac:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_f0
    ldr r1, _LIT4
    mov r0, r4
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dcc0
    ldr r1, _LIT2
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_f0:
    ldr r1, _LIT2
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    sub r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_10c:
    mov r3, #0x0
    mov r1, #0x198
    str r3, [sp]
    mov r4, #0xf
    add r2, r1, #0x1
    mov r0, #0x7f
    str r4, [sp, #0x4]
    bl func_ov002_021ae514
    ldr r1, _LIT2
    add sp, sp, #0x8
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_148:
    ldr r1, _LIT4
    ldr r1, [r1, #0xd44]
    add r1, r1, #0x1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_0223dad0
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT4
    ldrh r1, [r4]
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r2, [r0, #0xd44]
    rsb r0, r3, #0x1
    bl func_ov002_0226b0d0
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_18c:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd744
_LIT1: .word 0x000010d3
_LIT2: .word data_ov002_022ce288
_LIT3: .word func_ov002_021e8a18
_LIT4: .word data_ov002_022d016c
