; func_0203e540 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203e254
        .extern func_0203e400
        .extern func_0203e870
        .extern func_0203e9ac
        .global func_0203e540
        .arm
func_0203e540:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r1
    mov r5, r0
    cmp r4, #0x3
    beq .L_16c
    cmp r4, #0x4
    beq .L_1d0
    cmp r4, #0x5
    beq .L_1dc
    b .L_1fc
.L_16c:
    ldrb r1, [r5, #0xd12]
    cmp r1, #0x0
    bne .L_188
    add r1, r5, #0xd00
    ldrh r1, [r1, #0x16]
    cmp r1, #0x0
    beq .L_1ac
.L_188:
    mov r0, #0x1
    bl func_0203e254
    cmp r0, #0x0
    movne r4, #0x4
    bne .L_1fc
    mov r0, r5
    bl func_0203e400
    mov r4, r0
    b .L_1fc
.L_1ac:
    ldrb r1, [r5, #0xd0b]
    mov r1, r1, lsl #0x18
    mov r1, r1, lsr #0x1c
    cmp r1, #0x1
    movcs r4, #0x6
    bcs .L_1fc
    bl func_0203e870
    mov r4, r0
    b .L_1fc
.L_1d0:
    bl func_0203e400
    mov r4, r0
    b .L_1fc
.L_1dc:
    ldrb r1, [r5, #0xd0b]
    mov r1, r1, lsl #0x18
    mov r1, r1, lsr #0x1c
    cmp r1, #0x1
    movcs r4, #0x6
    bcs .L_1fc
    bl func_0203e870
    mov r4, r0
.L_1fc:
    mov r0, r4
    bl func_0203e9ac
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
