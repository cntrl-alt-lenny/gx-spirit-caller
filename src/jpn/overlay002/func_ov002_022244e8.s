; func_ov002_022244e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bc538
        .extern func_ov002_021c9ff4
        .extern func_ov002_021ca310
        .extern func_ov002_0227ab74
        .global func_ov002_022244e8
        .arm
func_ov002_022244e8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c9ff4
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    add r0, sp, #0x4
    mov r1, #0x0
    str r1, [r0]
    ldrh ip, [r5]
    ldr r0, _LIT0
    mov r4, #0x2
    cmp ip, r0
    bgt .L_b8
    bge .L_160
    ldr r3, _LIT1
    cmp ip, r3
    bgt .L_94
    bge .L_114
    sub r0, r0, #0x31c
    cmp ip, r0
    beq .L_f8
    b .L_1d8
.L_94:
    add r2, r3, #0x144
    cmp ip, r2
    bgt .L_a8
    beq .L_130
    b .L_1d8
.L_a8:
    sub r2, r0, #0x27
    cmp ip, r2
    beq .L_148
    b .L_1d8
.L_b8:
    cmp ip, #0x1600
    bgt .L_d4
    bge .L_194
    add r2, r0, #0x19
    cmp ip, r2
    beq .L_17c
    b .L_1d8
.L_d4:
    ldr r2, _LIT2
    cmp ip, r2
    bgt .L_e8
    beq .L_1ac
    b .L_1d8
.L_e8:
    add r0, r2, #0x92
    cmp ip, r0
    beq .L_1c4
    b .L_1d8
.L_f8:
    sub r0, r1, #0x2000
    and r2, r1, r0
    sub r0, r3, #0x4
    orr r0, r2, r0
    mov r4, r1
    str r0, [sp, #0x4]
    b .L_1d8
.L_114:
    sub r0, r1, #0x2000
    and r2, r1, r0
    add r0, r3, #0xfb
    orr r0, r2, r0
    mov r4, r1
    str r0, [sp, #0x4]
    b .L_1d8
.L_130:
    sub r2, r1, #0x2000
    and r1, r1, r2
    sub r0, r0, #0x6e
    orr r0, r1, r0
    str r0, [sp, #0x4]
    b .L_1d8
.L_148:
    sub r2, r1, #0x2000
    and r1, r1, r2
    add r0, r0, #0x1
    orr r0, r1, r0
    str r0, [sp, #0x4]
    b .L_1d8
.L_160:
    sub r2, r1, #0x2000
    and r2, r1, r2
    add r0, r0, #0x2
    orr r0, r2, r0
    mov r4, r1
    str r0, [sp, #0x4]
    b .L_1d8
.L_17c:
    sub r2, r1, #0x2000
    and r1, r1, r2
    add r0, r0, #0x47
    orr r0, r1, r0
    str r0, [sp, #0x4]
    b .L_1d8
.L_194:
    sub r2, r1, #0x2000
    and r1, r1, r2
    add r0, r0, #0x7d
    orr r0, r1, r0
    str r0, [sp, #0x4]
    b .L_1d8
.L_1ac:
    sub r0, r1, #0x2000
    and r1, r1, r0
    sub r0, r2, #0x4b
    orr r0, r1, r0
    str r0, [sp, #0x4]
    b .L_1d8
.L_1c4:
    sub r0, r1, #0x2000
    and r1, r1, r0
    rsb r0, r2, #0x3240
    orr r0, r1, r0
    str r0, [sp, #0x4]
.L_1d8:
    ldrh r0, [r5, #0x2]
    ldr r1, [sp, #0x4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bic r1, r1, #0x2000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x12
    str r0, [sp, #0x4]
    ldrh r2, [r5, #0x2]
    mov r0, r0, lsl #0x13
    mov r1, r0, lsr #0x13
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca310
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5]
    add r1, sp, #0x4
    mov r3, r4
    mov r0, r0, lsl #0x10
    orr r0, r0, #0x1
    str r0, [sp]
    ldrh r0, [r5, #0x2]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0227ab74
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000015bc
_LIT1: .word 0x000013ff
_LIT2: .word 0x000019a5
