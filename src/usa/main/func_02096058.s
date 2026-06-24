; func_02096058 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02092800
        .extern func_020951dc
        .extern func_020951f0
        .global func_02096058
        .arm
func_02096058:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_020951f0
    add r3, r6, r5, lsl #0x3
    ldr r2, [r3, #0x18]
    mov ip, r5, lsl #0x3
    cmp r2, #0x0
    beq .L_9c
    cmp r4, r2
    bne .L_3c
    bl func_020951dc
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_3c:
    add r1, r6, #0x18
    ldr r0, [r2, #0x18]
    add ip, r1, ip
    cmp ip, r0
    bne .L_68
    ldr r0, [r3, #0x1c]
    mov r1, #0x3c
    str r0, [r2, #0x18]
    ldr r0, [r3, #0x18]
    bl func_02092800
    b .L_9c
.L_68:
    cmp r0, #0x0
    beq .L_88
.L_70:
    ldr r1, [r0, #0x4]
    cmp ip, r1
    beq .L_88
    mov r0, r1
    cmp r1, #0x0
    bne .L_70
.L_88:
    add r1, r6, r5, lsl #0x3
    ldr r2, [r1, #0x1c]
    mov r1, #0x8
    str r2, [r0, #0x4]
    bl func_02092800
.L_9c:
    add r0, r6, #0x18
    ldr r1, [r4, #0x18]
    add r0, r0, r5, lsl #0x3
    str r0, [r4, #0x18]
    add r0, r6, r5, lsl #0x3
    str r1, [r0, #0x1c]
    str r4, [r0, #0x18]
    bl func_020951dc
    mov r0, r6
    mov r1, #0x3c
    bl func_02092800
    mov r0, r4
    mov r1, #0x3c
    bl func_02092800
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
