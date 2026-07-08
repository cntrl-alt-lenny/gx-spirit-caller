; func_ov002_0228ae50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202b86c
        .extern func_0202e1e0
        .global func_ov002_0228ae50
        .arm
func_ov002_0228ae50:
    stmdb sp!, {r4, lr}
    movs r4, r1
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    ldrh r0, [r0, #0x2]
    mov r2, r1, lsl #0x1f
    mov ip, r2, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp ip, r0, lsr #0x1f
    bne .L_128
    mov r0, r1, lsl #0x1a
    mov r3, r0, lsr #0x1b
    cmp r3, #0x5
    bcc .L_128
    cmp r3, #0xa
    bcs .L_128
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, ip, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mul r0, r3, r0
    add r1, r2, #0x30
    ldr r1, [r1, r0]
    ldrh r2, [r4, #0x4]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r2, lsl #0x11
    add r0, r0, r1, lsr #0x1f
    cmp r0, r2, lsr #0x17
    bne .L_128
    ldrh r0, [r4]
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_128
    ldrh r0, [r4]
    bl func_0202b86c
    cmp r0, #0x3
    beq .L_128
    ldrh r0, [r4]
    bl func_0202b86c
    cmp r0, #0x4
    beq .L_128
    ldrh r2, [r4]
    ldr r1, _LIT2
    cmp r2, r1
    bgt .L_f0
    bge .L_118
    ldr r0, _LIT3
    cmp r2, r0
    bgt .L_e0
    beq .L_118
    b .L_120
.L_e0:
    sub r0, r1, #0x7
    cmp r2, r0
    beq .L_118
    b .L_120
.L_f0:
    add r0, r1, #0x2dc
    cmp r2, r0
    bgt .L_10c
    bge .L_118
    cmp r2, #0x1400
    beq .L_118
    b .L_120
.L_10c:
    add r0, r1, #0x364
    cmp r2, r0
    bne .L_120
.L_118:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_120:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_128:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word 0x00001238
_LIT3: .word 0x00001102
