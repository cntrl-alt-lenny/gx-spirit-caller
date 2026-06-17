; func_ov002_02253928 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202e234
        .extern func_ov002_021baca8
        .extern func_ov002_021d90fc
        .global func_ov002_02253928
        .arm
func_ov002_02253928:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    mov r8, r1
    bl func_0202e234
    cmp r0, #0x0
    movne r6, #0x0
    movne r7, #0x4
    moveq r6, #0x5
    moveq r7, #0x9
    mov r4, #0x0
.L_28:
    mov r5, r6
    cmp r6, r7
    bgt .L_68
.L_34:
    mov r0, r4
    mov r1, r5
    mov r2, r9
    bl func_ov002_021baca8
    cmp r0, #0x0
    beq .L_5c
    mov r0, r4
    mov r1, r5
    mov r2, r8
    bl func_ov002_021d90fc
.L_5c:
    add r5, r5, #0x1
    cmp r5, r7
    ble .L_34
.L_68:
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
