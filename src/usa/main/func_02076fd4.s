; func_02076fd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020770d4
        .extern func_02077940
        .extern func_02077d70
        .extern func_02077de4
        .extern func_02077ea4
        .extern func_020783b0
        .extern func_02078424
        .extern func_020784e4
        .global func_02076fd4
        .arm
func_02076fd4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrb r0, [r5, #0x5af]
    ldr r1, [r5, #0x45c]
    cmp r0, #0x0
    movne r4, #0x0
    moveq r4, #0x8000
    mvn r0, #0x0
    cmp r1, r0
    orreq r0, r4, #0x4
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldr r0, [r5, #0x458]
    cmp r0, #0x3
    beq .L_48
    cmp r0, #0x4
    beq .L_84
    b .L_c0
.L_48:
    add r6, r5, #0x3fc
    mov r0, r6
    bl func_02077ea4
    ldr r1, [r5, #0x460]
    ldr r2, [r5, #0x464]
    mov r0, r6
    sub r2, r2, r1
    bl func_02077de4
    ldr r1, _LIT0
    mov r0, r6
    add r1, r5, r1
    bl func_02077d70
    mov r0, #0x10
    str r0, [r5, #0x47c]
    b .L_cc
.L_84:
    add r6, r5, #0x348
    mov r0, r6
    bl func_020784e4
    ldr r1, [r5, #0x460]
    ldr r2, [r5, #0x464]
    mov r0, r6
    sub r2, r2, r1
    bl func_02078424
    ldr r1, _LIT0
    mov r0, r6
    add r1, r5, r1
    bl func_020783b0
    mov r0, #0x14
    str r0, [r5, #0x47c]
    b .L_cc
.L_c0:
    orr r0, r4, #0x3
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_cc:
    mov r0, r5
    add r1, r5, #0x5b0
    bl func_02077940
    movs r1, r0
    orreq r0, r4, #0x1
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    mov r0, r5
    bl func_020770d4
    orr r0, r4, r0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word 0x00000468
