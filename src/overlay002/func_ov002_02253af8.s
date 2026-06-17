; func_ov002_02253af8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202e234
        .extern func_ov002_021baca8
        .extern func_ov002_021e2d94
        .global func_ov002_02253af8
        .arm
func_ov002_02253af8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r1
    mov r9, r0
    mov r0, r8
    bl func_0202e234
    cmp r0, #0x0
    movne r6, #0x0
    movne r7, #0x4
    moveq r6, #0x5
    moveq r7, #0x9
    cmp r6, r7
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r5, #0x5
    mov r4, #0x1
.L_208:
    mov r0, r9
    mov r1, r6
    mov r2, r8
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_234
    mov r0, r9
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_ov002_021e2d94
.L_234:
    add r6, r6, #0x1
    cmp r6, r7
    ble .L_208
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
