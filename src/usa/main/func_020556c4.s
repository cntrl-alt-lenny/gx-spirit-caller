; func_020556c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205d648
        .global func_020556c4
        .arm
func_020556c4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r2
    cmp r0, #0x0
    beq .L_20
    ldr r2, [r0]
    cmp r2, #0x0
    bne .L_2c
.L_20:
    add sp, sp, #0x8
    mov r0, #0x2
    ldmia sp!, {r4, pc}
.L_2c:
    ldr r2, [r2, #0x108]
    cmp r2, #0x0
    movne r0, #0x0
    addne sp, sp, #0x8
    strne r0, [r4]
    ldmneia sp!, {r4, pc}
    add r2, sp, #0x0
    bl func_0205d648
    cmp r0, #0x0
    beq .L_6c
    ldr r0, [sp]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    ldrne r0, [r0]
    strne r0, [r4]
    bne .L_74
.L_6c:
    mvn r0, #0x0
    str r0, [r4]
.L_74:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
