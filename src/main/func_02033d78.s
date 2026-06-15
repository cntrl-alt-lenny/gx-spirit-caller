; func_02033d78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02051b10
        .extern func_02051c4c
        .global func_02033d78
        .arm
func_02033d78:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    mov r4, #0x0
    cmp r5, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
.L_54:
    ldr r0, [r6]
    cmp r0, #0x0
    beq .L_98
    ldrb r0, [r6, #0x5]
    add r1, r6, #0x6
    cmp r0, #0x0
    ldrb r0, [r6, #0x4]
    bne .L_80
    add r2, r6, #0x18
    bl func_02051c4c
    b .L_88
.L_80:
    add r2, r6, #0x18
    bl func_02051b10
.L_88:
    strb r0, [r6, #0x4]
    ldrb r0, [r6, #0x4]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_98:
    add r4, r4, #0x1
    cmp r4, r5
    add r6, r6, #0x28
    blt .L_54
    ldmia sp!, {r4, r5, r6, pc}
