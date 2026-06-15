; func_02061578 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021014dc
        .extern data_021014e4
        .extern func_02064aa0
        .extern func_020a6d54
        .global func_02061578
        .arm
func_02061578:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r4, [sp, #0x24]
    mov r6, r2
    mov r2, #0x0
    movs r8, r0
    mov r7, r1
    mov r5, r3
    str r2, [r4]
    bne .L_70
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    bl func_020a6d54
.L_70:
    cmp r8, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r8, #0x30]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_a8
    cmp r5, #0x0
    bne .L_b0
.L_a8:
    mov r5, #0x0
    str r5, [sp, #0x20]
.L_b0:
    ldr r1, [r8, #0x1c]
    ldr r0, [sp, #0x20]
    add r1, r1, #0x1
    str r1, [r8, #0x1c]
    str r0, [sp]
    ldr ip, [r8, #0x30]
    mov r0, r8
    mov r1, r7
    mov r2, r6
    mov r3, r5
    blx ip
    str r0, [r4]
    ldr r0, [r8, #0x1c]
    sub r0, r0, #0x1
    str r0, [r8, #0x1c]
    ldr r0, [r8, #0x14]
    cmp r0, #0x0
    beq .L_118
    ldr r0, [r8, #0x1c]
    cmp r0, #0x0
    bne .L_118
    mov r0, r8
    bl func_02064aa0
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_118:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_021014dc
_LIT1: .word data_021014e4
_LIT2: .word 0x00000197
