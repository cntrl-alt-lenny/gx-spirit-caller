; func_ov002_021f8d10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021d7c40
        .extern func_ov002_022107b4
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_02290500
        .global func_ov002_021f8d10
        .arm
func_ov002_021f8d10:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x0
    beq .L_24
    cmp r0, #0x1
    beq .L_84
    b .L_c0
.L_24:
    ldrh r0, [r4, #0x2]
    mov r1, #0x3a
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_64
    ldr r2, _LIT2
    mov r1, #0x2
    bl func_ov002_02290500
    b .L_6c
.L_64:
    ldr r0, _LIT2
    bl func_ov002_022592ec
.L_6c:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_84:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_a8
    ldr r1, _LIT3
    ldr r0, [r1, #0xd70]
    ldr r1, [r1, #0xd78]
    bl func_ov002_021d7c40
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_a8:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_c0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word func_ov002_022107b4
_LIT3: .word data_ov002_022d016c
