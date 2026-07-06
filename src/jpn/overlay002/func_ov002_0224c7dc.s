; func_ov002_0224c7dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern func_0202b824
        .extern func_0202b854
        .extern func_0202e1e0
        .extern func_ov002_021ca360
        .extern func_ov002_02253370
        .global func_ov002_0224c7dc
        .arm
func_ov002_0224c7dc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    ldr r0, _LIT0
    and r2, r7, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT2
    mov r8, #0xd
    add r6, r0, r1
    add r5, r6, #0x260
.L_260:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r9, r0, lsr #0x13
    mov r0, r9
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_2c0
    mov r0, r9
    bl func_0202b854
    cmp r0, #0x2
    bgt .L_2c0
    mov r0, r9
    bl func_0202b824
    cmp r0, #0x12
    bne .L_2c0
    mov r0, r7
    mov r1, r9
    bl func_ov002_021ca360
    cmp r0, #0x0
    beq .L_2c0
    mov r0, r7
    mov r1, r8
    mov r2, r4
    bl func_ov002_02253370
.L_2c0:
    ldr r0, [r6, #0x10]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_260
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf08c
