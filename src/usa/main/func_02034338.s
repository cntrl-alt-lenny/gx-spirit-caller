; func_02034338 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02031e58
        .extern func_0203215c
        .extern func_020325f0
        .extern func_02032638
        .extern func_02033808
        .extern func_020338a8
        .extern func_020338f4
        .global func_02034338
        .arm
func_02034338:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r0, #0x0
    mov r5, r1
    str r0, [r4, #0x34]
    bl func_02032638
    bl func_020338a8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    bne .L_6c
    bl func_02031e58
    mov r2, r5
    add r1, r4, #0x40
    bl func_0203215c
    str r0, [r4, #0x38]
    cmp r0, #0x0
    beq .L_6c
    bl func_020325f0
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x3c]
    bne .L_6c
    bl func_02032638
    bl func_02033808
    str r0, [r4, #0x3c]
.L_6c:
    ldr r5, [r4, #0x38]
    cmp r5, #0x0
    beq .L_9c
    bl func_02032638
    ldr r1, [r4, #0x3c]
    mov r3, r5
    add r2, r4, #0x40
    bl func_020338f4
    ldr r1, [r4, #0x3c]
    mvn r0, r0
    and r0, r1, r0
    str r0, [r4, #0x3c]
.L_9c:
    mov r0, #0x1
    str r0, [r4, #0x34]
    ldmia sp!, {r3, r4, r5, pc}
