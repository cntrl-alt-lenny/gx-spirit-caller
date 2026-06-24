; func_02063f70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045364
        .extern func_02060f68
        .extern func_02060fa4
        .extern func_02062c00
        .extern func_02064364
        .global func_02063f70
        .arm
func_02063f70:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x24
    mov r5, r0
    ldr r3, [r5, #0xc]
    mov r4, r1
    cmp r3, #0x0
    beq .L_148
    bl func_02064364
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x24
    moveq r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_148:
    cmp r2, #0x40
    bge .L_168
    bl func_02064364
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x24
    moveq r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_168:
    mov r0, r4
    add r1, r5, #0x68
    bl func_02060f68
    cmp r0, #0x0
    bne .L_198
    mov r0, r5
    bl func_02064364
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x24
    moveq r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_198:
    add r0, sp, #0x0
    add r1, r4, #0x20
    bl func_02060fa4
    ldr r2, [r5, #0x38]
    ldr r3, [r5, #0x3c]
    add r1, sp, #0x0
    mov r0, r5
    bl func_02062c00
    cmp r0, #0x0
    addeq sp, sp, #0x24
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    beq .L_1e0
    bl func_02045364
    mov r0, #0x0
    str r0, [r5, #0x38]
.L_1e0:
    mov r0, #0x1
    str r0, [r5, #0xc]
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, pc}
