; func_ov002_0228d9ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern func_ov002_021c8390
        .extern func_ov002_0227afa0
        .global func_ov002_0228d9ac
        .arm
func_ov002_0228d9ac:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x2c
    ldr r2, _LIT0
    mov r6, r0
    mov r5, r1
    ldr r0, [r2]
    ldr r1, [r2, #0x1c]
    bl func_ov002_021c8390
    mov r4, r0
    add r2, sp, #0x0
    mov r0, r6
    mov r1, r5
    bl func_ov002_0227afa0
    ldr r1, _LIT1
    and r2, r6, #0x1
    mul r3, r2, r1
    mov r0, #0x14
    mul r2, r5, r0
    ldr r1, _LIT2
    add r0, r1, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    beq .L_a8
    ldr r0, _LIT3
    ldr r1, [sp, #0x18]
    add r0, r0, r3
    add r0, r0, r2
    ldr r0, [r0, #0x30]
    add r2, r1, #0x1
    mov r1, r0, lsl #0x13
    ldr r0, _LIT4
    mov r1, r1, lsr #0x13
    cmp r1, r0
    movne r1, #0x1
    sub r0, r2, r4
    moveq r1, #0x0
    cmp r0, #0x0
    movgt r0, #0x0
    add r0, r0, #0x1
    add sp, sp, #0x2c
    add r0, r1, r0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_a8:
    ldr r0, [sp, #0x14]
    sub r0, r0, r4
    mov r0, r0, lsl #0x1
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0c2
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x0000139c
