; func_ov002_02258500 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_02259ee8
        .global func_ov002_02258500
        .arm
func_ov002_02258500:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    mov r4, r1
    ldr r0, [r0, #0xd68]
    mov r7, r2
    cmp r0, #0x0
    beq .L_30
    cmp r0, #0x1
    beq .L_50
    cmp r0, #0x2
    beq .L_78
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_30:
    mov r0, r4
    mov r1, #0x114
    bl func_ov002_021ae400
    ldr r0, _LIT0
    ldr r1, [r0, #0xd68]
    add r1, r1, #0x1
    str r1, [r0, #0xd68]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_50:
    ldr r2, _LIT1
    mov r0, r4
    mov r3, r7
    mov r1, #0x6
    bl func_ov002_021af9d0
    ldr r0, _LIT0
    ldr r1, [r0, #0xd68]
    add r1, r1, #0x1
    str r1, [r0, #0xd68]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_78:
    bl func_ov002_021afb74
    mov r6, r0
    bl func_ov002_021afb74
    mov r5, r0
    bl func_ov002_021afb74
    mov r1, r7
    ldr r2, [r6]
    ldr r3, [r5]
    mov r2, r2, lsl #0x13
    mov r2, r2, lsr #0x13
    mov ip, r3, lsl #0x12
    mov r3, r0
    mov r0, r4
    ldr r3, [r3]
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r3, r3, ip, lsr #0x1f
    bl func_ov002_02259ee8
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xd50]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x0000fffe
