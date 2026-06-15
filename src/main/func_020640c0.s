; func_020640c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02061018
        .extern func_02061150
        .extern func_02062cfc
        .extern func_020643d8
        .global func_020640c0
        .arm
func_020640c0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x40
    mov r4, r0
    ldr r3, [r4, #0xc]
    cmp r3, #0x2
    beq .L_44c
    bl func_020643d8
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x40
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_44c:
    cmp r2, #0x20
    bge .L_46c
    bl func_020643d8
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x40
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_46c:
    add r0, sp, #0x0
    bl func_02061018
    add r0, sp, #0x20
    bl func_02061150
    add r1, sp, #0x20
    add r0, r4, #0x68
    bl func_02061018
    add r1, sp, #0x0
    add r2, sp, #0x20
    mov r0, r4
    bl func_02062cfc
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x3
    strne r0, [r4, #0xc]
    movne r0, #0x1
    add sp, sp, #0x40
    ldmia sp!, {r4, pc}
