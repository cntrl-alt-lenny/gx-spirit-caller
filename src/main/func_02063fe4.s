; func_02063fe4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020453b4
        .extern func_02060fdc
        .extern func_02061018
        .extern func_02062c74
        .extern func_020643d8
        .global func_02063fe4
        .arm
func_02063fe4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x24
    mov r5, r0
    ldr r3, [r5, #0xc]
    mov r4, r1
    cmp r3, #0x0
    beq .L_374
    bl func_020643d8
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x24
    moveq r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_374:
    cmp r2, #0x40
    bge .L_394
    bl func_020643d8
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x24
    moveq r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_394:
    mov r0, r4
    add r1, r5, #0x68
    bl func_02060fdc
    cmp r0, #0x0
    bne .L_3c4
    mov r0, r5
    bl func_020643d8
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x24
    moveq r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_3c4:
    add r0, sp, #0x0
    add r1, r4, #0x20
    bl func_02061018
    ldr r2, [r5, #0x38]
    ldr r3, [r5, #0x3c]
    add r1, sp, #0x0
    mov r0, r5
    bl func_02062c74
    cmp r0, #0x0
    addeq sp, sp, #0x24
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    ldr r0, [r5, #0x38]
    cmp r0, #0x0
    beq .L_40c
    bl func_020453b4
    mov r0, #0x0
    str r0, [r5, #0x38]
.L_40c:
    mov r0, #0x1
    str r0, [r5, #0xc]
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, pc}
