; func_ov016_021b22d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov016_021b2280
        .extern func_ov016_021b22c8
        .extern func_ov016_021b22d8
        .global func_ov016_021b22d8
        .arm
func_ov016_021b22d8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, r0
    mov r5, r1
    add r7, r6, #0x54
    mov r4, #0x0
    cmp r5, #0x1
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r5, #0x2
    bne .L_44
    mov r1, r7
    bl func_ov016_021b22c8
    cmp r0, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r6
    mov r1, r7
    bl func_ov016_021b2280
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_44:
    add r1, r5, r5, lsr #0x1f
    mov r2, r1, asr #0x1
    mov r1, #0x54
    mla r1, r2, r1, r6
    bl func_ov016_021b2280
    mov r8, r6
    cmp r5, #0x1
    mov r9, #0x1
    ble .L_a8
.L_68:
    mov r0, r7
    mov r1, r6
    bl func_ov016_021b22c8
    cmp r0, #0x0
    bge .L_98
    add r8, r8, #0x54
    cmp r7, r8
    add r4, r4, #0x1
    beq .L_98
    mov r0, r7
    mov r1, r8
    bl func_ov016_021b2280
.L_98:
    add r9, r9, #0x1
    cmp r9, r5
    add r7, r7, #0x54
    blt .L_68
.L_a8:
    cmp r8, r6
    beq .L_bc
    mov r0, r6
    mov r1, r8
    bl func_ov016_021b2280
.L_bc:
    mov r0, r6
    mov r1, r4
    bl func_ov016_021b22d8
    sub r1, r5, r4
    add r0, r8, #0x54
    sub r1, r1, #0x1
    bl func_ov016_021b22d8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
