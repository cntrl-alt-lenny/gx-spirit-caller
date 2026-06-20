; func_ov002_02240f88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_0202b100
        .extern func_ov002_021ae400
        .extern func_ov002_0223dcc0
        .extern func_ov002_02240ee4
        .extern func_ov002_02240efc
        .extern func_ov002_02240f44
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_0229ce5c
        .global func_ov002_02240f88
        .arm
func_ov002_02240f88:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x100
    mov r6, r0
    ldrh r3, [r6]
    ldr r2, _LIT0
    mov r5, r1
    cmp r3, r2
    beq .L_3c
    add r0, r2, #0xe3
    cmp r3, r0
    beq .L_44
    rsb r0, r2, #0x2a40
    cmp r3, r0
    ldreq r4, _LIT1
    b .L_48
.L_3c:
    ldr r4, _LIT2
    b .L_48
.L_44:
    ldr r4, _LIT3
.L_48:
    ldr r0, _LIT4
    ldr r1, [r0, #0x5b8]
    cmp r1, #0x0
    beq .L_6c
    cmp r1, #0x1
    beq .L_d4
    cmp r1, #0x2
    beq .L_134
    b .L_144
.L_6c:
    ldrh r0, [r5]
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0x8a
    bl func_ov002_0229ce5c
    ldrh r0, [r6, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r0, _LIT4
    mov r2, r4
    str r5, [r0, #0x48c]
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT4
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_d4:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_118
    ldr r1, _LIT5
    mov r0, r6
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dcc0
    ldr r1, _LIT4
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_118:
    ldr r1, _LIT4
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    sub r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, pc}
.L_134:
    add sp, sp, #0x100
    str r6, [r0, #0x48c]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_144:
    mov r0, #0x0
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00001327
_LIT1: .word func_ov002_02240f44
_LIT2: .word func_ov002_02240ee4
_LIT3: .word func_ov002_02240efc
_LIT4: .word data_ov002_022ce288
_LIT5: .word data_ov002_022d016c
