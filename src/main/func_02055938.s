; func_02055938 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffc10
        .extern func_020453b4
        .extern func_0205d4c0
        .extern func_0205d674
        .extern func_0205d6bc
        .extern func_0205ffc0
        .global func_02055938
        .arm
func_02055938:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r4, r0
    beq .L_624
    ldr r5, [r4]
    cmp r5, #0x0
    bne .L_630
.L_624:
    add sp, sp, #0x4
    mov r0, #0x2
    ldmia sp!, {r4, r5, pc}
.L_630:
    ldr r2, [r5, #0x108]
    cmp r2, #0x0
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, pc}
    ldr r2, [r5, #0x1d8]
    cmp r2, #0x4
    bne .L_664
    ldr r1, _LIT0
    bl func_0205ffc0
    add sp, sp, #0x4
    mov r0, #0x2
    ldmia sp!, {r4, r5, pc}
.L_664:
    add r2, sp, #0x0
    bl func_0205d6bc
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    ldr r1, [sp]
    ldr r0, [r1, #0x14]
    sub r0, r0, #0x1
    str r0, [r1, #0x14]
    ldr r0, [r5, #0x100]
    cmp r0, #0x0
    bne .L_6d8
    ldr r1, [sp]
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    bgt .L_6d8
    ldr r0, [r1, #0x10]
    bl func_020453b4
    ldr r0, [sp]
    mov r1, #0x0
    str r1, [r0, #0x10]
    ldr r0, [sp]
    bl func_0205d4c0
    cmp r0, #0x0
    beq .L_6d8
    ldr r1, [sp]
    mov r0, r4
    bl func_0205d674
.L_6d8:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020ffc10
