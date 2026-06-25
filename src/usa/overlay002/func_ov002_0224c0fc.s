; func_ov002_0224c0fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a4
        .extern func_0202b854
        .extern func_020307b4
        .extern func_02030b30
        .extern func_ov002_021ca310
        .extern func_ov002_02253370
        .global func_ov002_0224c0fc
        .arm
func_ov002_0224c0fc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r8, r0
    ldr r0, _LIT0
    and r3, r8, #0x1
    mul r1, r3, r0
    ldr r0, _LIT1
    mov r7, r2
    ldr r0, [r0, r1]
    mov r4, #0x0
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    mov r9, #0xc
    add r6, r0, r1
    add r5, r6, #0x3a0
.L_3c:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_0202b854
    cmp r7, r0
    bne .L_9c
    mov r0, sl
    bl func_020307b4
    cmp r0, #0x0
    beq .L_9c
    mov r0, sl
    bl func_02030b30
    cmp r0, #0x0
    beq .L_9c
    mov r0, r8
    mov r1, sl
    bl func_ov002_021ca310
    cmp r0, #0x0
    beq .L_9c
    mov r0, r8
    mov r1, r9
    mov r2, r4
    bl func_ov002_02253370
.L_9c:
    ldr r0, [r6, #0x18]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a4
_LIT2: .word data_ov002_022cf08c
