; func_ov002_022426a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_0223dcc0
        .extern func_ov002_0223e21c
        .extern func_ov002_022575c8
        .extern func_ov002_022577dc
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_0228df3c
        .global func_ov002_022426a4
        .arm
func_ov002_022426a4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r2, [r2, #0x5b8]
    mov r4, r1
    cmp r2, #0x0
    beq .L_128
    cmp r2, #0x1
    beq .L_180
    cmp r2, #0x2
    beq .L_1cc
    b .L_224
.L_128:
    ldr r2, _LIT1
    ldr r1, [r2]
    ldr r2, [r2, #0x1c]
    bl func_ov002_0223dcc0
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_168
    ldrh r2, [r5]
    mov r0, r5
    mov r1, r4
    bl func_ov002_0228df3c
    ldmia sp!, {r3, r4, r5, pc}
.L_168:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_180:
    bl func_ov002_022577dc
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_0223e21c
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_1cc:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_20c
    ldr r1, _LIT4
    mov r0, r5
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dcc0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_20c:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_224:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd3f4
_LIT2: .word data_ov002_022cd744
_LIT3: .word func_ov002_022575c8
_LIT4: .word data_ov002_022d016c
