; func_02055738 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205d6bc
        .global func_02055738
        .arm
func_02055738:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r2
    cmp r0, #0x0
    beq .L_428
    ldr r2, [r0]
    cmp r2, #0x0
    bne .L_434
.L_428:
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_434:
    ldr r2, [r2, #0x108]
    cmp r2, #0x0
    movne r0, #0x0
    addne sp, sp, #0x8
    strne r0, [r4]
    ldmneia sp!, {r4, pc}
    add r2, sp, #0x0
    bl func_0205d6bc
    cmp r0, #0x0
    beq .L_474
    ldr r0, [sp]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    ldrne r0, [r0]
    strne r0, [r4]
    bne .L_47c
.L_474:
    mvn r0, #0x0
    str r0, [r4]
.L_47c:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
