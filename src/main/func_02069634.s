; func_02069634 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054d4c
        .extern func_02055000
        .extern func_02067870
        .extern func_02069720
        .extern func_02069ec4
        .extern func_0206b258
        .global func_02069634
        .arm
func_02069634:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x4b0]
    bl func_02055000
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r4, [r6, #0x80]
    ldr r1, [r6, #0x7c]
    ldr r0, [r6, #0x4b0]
    add r1, r1, r4
    rsb r2, r4, #0x1000
    mov r3, #0x0
    bl func_02054d4c
    add r1, r0, #0x1
    cmp r1, #0x1
    bhi .L_710
    mov r0, r6
    bl func_0206b258
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_710:
    ldr r1, [r6, #0x80]
    mov r5, #0x0
    add r0, r1, r0
    str r0, [r6, #0x80]
    ldr r0, [r6]
    cmp r0, #0x2
    beq .L_738
    ldr r0, [r6, #0x5c8]
    cmp r0, #0x0
    ble .L_754
.L_738:
    ldr r1, [r6, #0x7c]
    ldr r2, [r6, #0x80]
    ldr r0, _LIT0
    add r1, r1, r4
    add r0, r6, r0
    sub r2, r2, r4
    bl func_02067870
.L_754:
    ldr r0, [r6]
    cmp r0, #0x3
    bne .L_76c
    mov r0, r6
    bl func_02069ec4
    mov r5, r0
.L_76c:
    cmp r5, #0x0
    movne r0, r5
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, [r6]
    cmp r0, #0x2
    bne .L_79c
    ldr r0, [r6, #0x80]
    cmp r0, #0x0
    ble .L_79c
    mov r0, r6
    bl func_02069720
    ldmia sp!, {r4, r5, r6, pc}
.L_79c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x000004bc
