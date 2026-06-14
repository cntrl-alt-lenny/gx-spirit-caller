; func_ov011_021cabbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3060
        .extern data_ov011_021d3177
        .extern data_ov011_021d403c
        .extern func_020139b4
        .extern func_0201a3ec
        .extern func_0201a498
        .extern func_0201b6e4
        .extern func_ov000_021af4d8
        .extern func_ov000_021af560
        .extern func_ov011_021cd1fc
        .global func_ov011_021cabbc
        .arm
func_ov011_021cabbc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r6, _LIT0
    mov r7, r0
    mov r5, r1
    bl func_020139b4
    mov r4, r0
    ldr r0, [r6, #0x270]
    mvn r1, #0x0
    cmp r7, r1
    mov r0, r0, lsl #0x18
    movne r4, r7
    movs r0, r0, lsr #0x18
    beq .L_94
    cmp r5, #0x0
    beq .L_68
    bl func_ov011_021cd1fc
    ldr r1, [r6, #0x268]
    mov r2, r1, lsl #0x17
    ldr r1, _LIT1
    mov r2, r2, lsr #0x1c
    add r1, r1, r2, lsl #0x3
    ldrb r1, [r0, r1]
    mov r2, r4
    mov r0, #0x1
    bl func_ov000_021af560
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_68:
    bl func_ov011_021cd1fc
    ldr r1, [r6, #0x268]
    mov r2, r1, lsl #0x17
    ldr r1, _LIT1
    mov r2, r2, lsr #0x1c
    add r1, r1, r2, lsl #0x3
    ldrb r1, [r0, r1]
    mov r2, r4
    mov r0, #0x1
    bl func_ov000_021af4d8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_94:
    ldr r1, [r6, #0x268]
    ldr r0, [r6, #0x280]
    mov r1, r1, lsl #0x17
    ldr r2, _LIT2
    mov r3, r1, lsr #0x1c
    mov r1, r0, lsl #0x18
    add r0, r2, r3, lsl #0x4
    ldrb r6, [r0, r1, lsr #0x18]
    cmp r6, #0x32
    bne .L_100
    bl func_0201a3ec
    cmp r0, #0x0
    bne .L_d8
    mov r0, #0x73
    bl func_0201b6e4
    cmp r0, #0x0
    beq .L_e0
.L_d8:
    mov r6, #0x41
    b .L_100
.L_e0:
    bl func_0201a498
    cmp r0, #0x0
    bne .L_fc
    mov r0, #0x74
    bl func_0201b6e4
    cmp r0, #0x0
    beq .L_100
.L_fc:
    mov r6, #0x39
.L_100:
    cmp r5, #0x0
    mov r1, r6
    mov r0, #0x1
    mov r2, r4
    beq .L_11c
    bl func_ov000_021af560
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_11c:
    bl func_ov000_021af4d8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov011_021d403c
_LIT1: .word data_ov011_021d3060
_LIT2: .word data_ov011_021d3177
