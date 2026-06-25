; func_02038a84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02038934
        .extern func_02091590
        .extern func_02093100
        .extern func_02093534
        .global func_02038a84
        .arm
func_02038a84:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, #0x1
    bl func_02091590
    cmp r0, #0x0
    beq .L_188
    bl func_02093100
    cmp r0, #0x0
    beq .L_188
    bl func_02093534
    cmp r0, #0x0
    bne .L_18c
.L_188:
    mov r4, #0x0
.L_18c:
    ldr r1, [r7, #0x2c]
    ldr r0, _LIT0
    str r1, [sp]
    ands r7, r1, r0
    beq .L_1f0
    rsb r7, r7, #0x200
    cmp r5, r7
    add r0, sp, #0x0
    mov r1, r6
    bgt .L_1c4
    mov r2, r5
    mov r3, r4
    bl func_02038934
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1c4:
    mov r2, r7
    mov r3, r4
    bl func_02038934
    cmp r7, r0
    movne r0, r7
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [sp]
    add r6, r6, r7
    add r0, r0, r7
    str r0, [sp]
    sub r5, r5, r7
.L_1f0:
    add r0, sp, #0x0
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_02038934
    add r0, r7, r0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x000001ff
