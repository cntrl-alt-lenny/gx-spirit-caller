; func_02085e74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02084e0c
        .global func_02085e74
        .arm
func_02085e74:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r1, [r5]
    mov r4, #0x0
    ands r0, r1, #0x4
    moveq r4, #0x1
    ands r0, r1, #0x20
    beq .L_644
    ands r0, r1, #0x8
    bne .L_644
    cmp r4, #0x0
    beq .L_634
    add r1, r5, #0x4c
    mov r0, #0x1c
    mov r2, #0x3
    bl func_02084e0c
    mov r4, #0x0
.L_634:
    add r1, r5, #0x10
    mov r0, #0x1b
    mov r2, #0x3
    bl func_02084e0c
.L_644:
    ldr r0, [r5]
    ands r0, r0, #0x2
    bne .L_680
    cmp r4, #0x0
    beq .L_66c
    add r1, r5, #0x28
    mov r0, #0x19
    mov r2, #0xc
    bl func_02084e0c
    b .L_698
.L_66c:
    add r1, r5, #0x28
    mov r0, #0x1a
    mov r2, #0x9
    bl func_02084e0c
    b .L_698
.L_680:
    cmp r4, #0x0
    beq .L_698
    add r1, r5, #0x4c
    mov r0, #0x1c
    mov r2, #0x3
    bl func_02084e0c
.L_698:
    ldr r0, [r5]
    ands r0, r0, #0x1
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    add r1, r5, #0x4
    mov r0, #0x1b
    mov r2, #0x3
    bl func_02084e0c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
