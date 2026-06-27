; func_ov002_022537d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202e1e0
        .extern func_ov002_021babc8
        .extern func_ov002_021d900c
        .global func_ov002_022537d4
        .arm
func_ov002_022537d4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    mov r8, r0
    mov r0, r7
    mov r6, r2
    bl func_0202e1e0
    cmp r0, #0x0
    movne r4, #0x0
    movne r5, #0x4
    moveq r4, #0x5
    moveq r5, #0x9
    cmp r4, r5
    ldmgtia sp!, {r4, r5, r6, r7, r8, pc}
.L_1a8:
    mov r0, r8
    mov r1, r4
    mov r2, r7
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_1d0
    mov r0, r8
    mov r1, r4
    mov r2, r6
    bl func_ov002_021d900c
.L_1d0:
    add r4, r4, #0x1
    cmp r4, r5
    ble .L_1a8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
