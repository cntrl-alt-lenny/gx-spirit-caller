; func_ov002_02253a84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202e1e0
        .extern func_ov002_021babc8
        .extern func_ov002_021e2ca4
        .global func_ov002_02253a84
        .arm
func_ov002_02253a84:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov sl, r0
    bl func_0202e1e0
    cmp r0, #0x0
    movne r8, #0x0
    movne r9, #0x4
    moveq r8, #0x5
    moveq r9, #0x9
    mov r6, #0x0
    mov r5, #0x5
    mov r4, #0x1
.L_2c:
    mov r7, r8
    cmp r8, r9
    bgt .L_70
.L_38:
    mov r0, r6
    mov r1, r7
    mov r2, sl
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_64
    mov r0, r6
    mov r1, r7
    mov r2, r5
    mov r3, r4
    bl func_ov002_021e2ca4
.L_64:
    add r7, r7, #0x1
    cmp r7, r9
    ble .L_38
.L_70:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
