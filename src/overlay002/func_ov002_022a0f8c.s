; func_ov002_022a0f8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021afaf0
        .extern func_ov002_021afb90
        .extern func_ov002_022ac028
        .global func_ov002_022a0f8c
        .arm
func_ov002_022a0f8c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_a0
    b .L_a0
    b .L_a0
    b .L_a0
    b .L_40
    b .L_a0
    b .L_58
    b .L_6c
    b .L_a0
    b .L_a0
    b .L_6c
.L_40:
    mov r0, r1
    bl func_ov002_021afb90
    ldr r0, [r0]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x1f
    ldmia sp!, {r4, pc}
.L_58:
    ldr r2, [r4, #0x8]
    add r0, r1, #0x1
    mov r0, r2, lsr r0
    and r0, r0, #0x1
    ldmia sp!, {r4, pc}
.L_6c:
    ldr r0, [r4, #0xc]
    add r1, r1, #0x1
    mov r0, r0, lsr r1
    tst r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x8]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr r1
    and r0, r0, #0x1
    ldmia sp!, {r4, pc}
.L_a0:
    cmp r0, #0x0
    bge .L_168
    bl func_ov002_021afaf0
    cmp r0, #0x1
    ble .L_168
    ldr r1, [r4, #0x14]
    cmp r1, #0x0
    beq .L_d4
    cmp r1, #0x1
    beq .L_11c
    cmp r1, #0x2
    beq .L_14c
    b .L_168
.L_d4:
    ldr r1, [r4, #0x4]
    rsb r1, r1, #0x0
    cmp r1, #0x27
    bge .L_f8
    ldr r1, [r4, #0x4c]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_f8:
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    bgt .L_10c
    cmp r1, #0x48
    bne .L_114
.L_10c:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_114:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_11c:
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022ac028
    cmp r0, #0x0
    bne .L_144
    bl func_ov002_021afaf0
    ldr r1, [r4, #0x4c]
    cmp r1, r0
    movlt r0, #0x1
    ldmltia sp!, {r4, pc}
.L_144:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_14c:
    ldr r1, [r4, #0x20]
    mov r0, r4
    bl func_ov002_022ac028
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r4, pc}
.L_168:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
