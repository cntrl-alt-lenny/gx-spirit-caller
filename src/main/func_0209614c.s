; func_0209614c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020928e8
        .extern func_020952d0
        .extern func_020952e4
        .global func_0209614c
        .arm
func_0209614c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_020952e4
    add r3, r6, r5, lsl #0x3
    ldr r2, [r3, #0x18]
    mov ip, r5, lsl #0x3
    cmp r2, #0x0
    beq .L_188
    cmp r4, r2
    bne .L_128
    bl func_020952d0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_128:
    add r1, r6, #0x18
    ldr r0, [r2, #0x18]
    add ip, r1, ip
    cmp ip, r0
    bne .L_154
    ldr r0, [r3, #0x1c]
    mov r1, #0x3c
    str r0, [r2, #0x18]
    ldr r0, [r3, #0x18]
    bl func_020928e8
    b .L_188
.L_154:
    cmp r0, #0x0
    beq .L_174
.L_15c:
    ldr r1, [r0, #0x4]
    cmp ip, r1
    beq .L_174
    mov r0, r1
    cmp r1, #0x0
    bne .L_15c
.L_174:
    add r1, r6, r5, lsl #0x3
    ldr r2, [r1, #0x1c]
    mov r1, #0x8
    str r2, [r0, #0x4]
    bl func_020928e8
.L_188:
    add r0, r6, #0x18
    ldr r1, [r4, #0x18]
    add r0, r0, r5, lsl #0x3
    str r0, [r4, #0x18]
    add r0, r6, r5, lsl #0x3
    str r1, [r0, #0x1c]
    str r4, [r0, #0x18]
    bl func_020952d0
    mov r0, r6
    mov r1, #0x3c
    bl func_020928e8
    mov r0, r4
    mov r1, #0x3c
    bl func_020928e8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
