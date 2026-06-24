; func_0203e4f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203e204
        .extern func_0203e3b0
        .extern func_0203e820
        .extern func_0203e95c
        .global func_0203e4f0
        .arm
func_0203e4f0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r1
    mov r5, r0
    cmp r4, #0x3
    beq .L_10c
    cmp r4, #0x4
    beq .L_170
    cmp r4, #0x5
    beq .L_17c
    b .L_19c
.L_10c:
    ldrb r1, [r5, #0xd12]
    cmp r1, #0x0
    bne .L_128
    add r1, r5, #0xd00
    ldrh r1, [r1, #0x16]
    cmp r1, #0x0
    beq .L_14c
.L_128:
    mov r0, #0x1
    bl func_0203e204
    cmp r0, #0x0
    movne r4, #0x4
    bne .L_19c
    mov r0, r5
    bl func_0203e3b0
    mov r4, r0
    b .L_19c
.L_14c:
    ldrb r1, [r5, #0xd0b]
    mov r1, r1, lsl #0x18
    mov r1, r1, lsr #0x1c
    cmp r1, #0x1
    movcs r4, #0x6
    bcs .L_19c
    bl func_0203e820
    mov r4, r0
    b .L_19c
.L_170:
    bl func_0203e3b0
    mov r4, r0
    b .L_19c
.L_17c:
    ldrb r1, [r5, #0xd0b]
    mov r1, r1, lsl #0x18
    mov r1, r1, lsr #0x1c
    cmp r1, #0x1
    movcs r4, #0x6
    bcs .L_19c
    bl func_0203e820
    mov r4, r0
.L_19c:
    mov r0, r4
    bl func_0203e95c
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
