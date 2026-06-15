; func_ov017_021b6f40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_02104f4c
        .extern data_ov017_021b877c
        .extern func_020058b4
        .extern func_0201ef3c
        .global func_ov017_021b6f40
        .arm
func_ov017_021b6f40:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldrb r0, [r4, #0x1cc]
    ldrb r5, [r4, #0x1cd]
    ldrb r3, [r4, #0x1ce]
    and ip, r0, #0x1f
    add r0, r4, #0x100
    ldrh r1, [r0, #0xd0]
    ldrb r2, [r4, #0x1cf]
    orr ip, ip, #0x0
    mov r5, r5, lsl #0x1b
    orr r5, ip, r5, lsr #0x16
    mov r3, r3, lsl #0x1b
    ldr r0, [r4, #0x1d4]
    orr r3, r5, r3, lsr #0x11
    mov r2, r2, lsl #0x1b
    mov r6, #0x0
    orr r2, r3, r2, lsr #0xc
    mov r1, r1, lsl #0x1b
    orr r2, r2, r1, lsr #0x7
    mov r1, r0, lsl #0x1a
    ldr r0, _LIT0
    orr r1, r2, r1, lsr #0x1
    str r1, [r0, #0xa64]
    mov r5, r6
.L_64:
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq .L_88
    ldr r0, [r4]
    add r1, r4, #0x8
    add r2, r4, #0x54
    bl func_0201ef3c
    str r5, [r4, #0x58]
    str r5, [r4, #0x54]
.L_88:
    add r6, r6, #0x1
    cmp r6, #0x5
    add r4, r4, #0x5c
    blt .L_64
    bl func_020058b4
    ldr r4, _LIT1
    mov r5, #0x0
.L_a4:
    ldr r0, [r4, r5, lsl #0x2]
    cmp r0, #0x0
    beq .L_b4
    bl Task_InvokeLocked
.L_b4:
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_a4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov017_021b877c
