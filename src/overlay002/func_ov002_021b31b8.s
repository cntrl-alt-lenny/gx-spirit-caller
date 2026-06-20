; func_ov002_021b31b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b878
        .extern func_ov002_021b3240
        .extern func_ov002_021c1d28
        .extern func_ov002_021c1e20
        .global func_ov002_021b31b8
        .arm
func_ov002_021b31b8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r2
    mov r7, r0
    mov r0, r5
    mov r6, r1
    mov r4, r3
    bl func_0202b878
    cmp r0, #0x17
    bne .L_4c
    cmp r7, r4
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c1e20
    cmp r0, #0x0
    beq .L_70
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_4c:
    cmp r7, r4
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r7
    mov r1, r6
    bl func_ov002_021c1d28
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_70:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_ov002_021b3240
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
