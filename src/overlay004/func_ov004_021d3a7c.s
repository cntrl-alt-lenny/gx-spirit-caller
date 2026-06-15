; func_ov004_021d3a7c - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_02209f74
        .extern data_ov004_02209f80
        .extern func_0202c0c0
        .extern func_0209150c
        .extern func_ov004_021c9d60
        .global func_ov004_021d3a7c
        .arm
func_ov004_021d3a7c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r1
    mov r4, r0
    ldr r1, [sp, #0x18]
    mov r0, r3
    mov r6, r2
    ldr r5, [sp, #0x1c]
    bl func_ov004_021c9d60
    cmp r6, #0x0
    mov r3, r0
    rsblt r6, r6, #0x0
    cmp r3, #0x0
    beq .L_7c
    ldr r0, _LIT0
    cmp r6, r0
    blt .L_60
    ldr r2, _LIT1
    mov r0, r4
    sub r1, r7, #0x1
    str r6, [sp]
    bl func_0209150c
    mov r1, #0x0
    strb r1, [r4, r0]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_60:
    ldr r2, _LIT2
    mov r0, r4
    sub r1, r7, #0x1
    bl func_0209150c
    mov r1, #0x0
    strb r1, [r4, r0]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_7c:
    cmp r5, #0x0
    bne .L_90
    ldr r0, _LIT3
    bl func_0202c0c0
    mov r5, r0
.L_90:
    cmp r5, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    cmp r6, r0
    blt .L_c8
    ldr r2, _LIT1
    mov r0, r4
    mov r3, r5
    sub r1, r7, #0x1
    str r6, [sp]
    bl func_0209150c
    mov r1, #0x0
    strb r1, [r4, r0]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_c8:
    ldr r2, _LIT2
    mov r0, r4
    mov r3, r5
    sub r1, r7, #0x1
    bl func_0209150c
    mov r1, #0x0
    strb r1, [r4, r0]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00002710
_LIT1: .word data_ov004_02209f74
_LIT2: .word data_ov004_02209f80
_LIT3: .word 0x0000064d
