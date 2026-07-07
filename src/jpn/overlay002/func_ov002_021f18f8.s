; func_ov002_021f18f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern func_0202e1e0
        .extern func_ov002_021b7ad8
        .extern func_ov002_021b9dec
        .extern func_ov002_021c1d64
        .extern func_ov002_021c1e10
        .extern func_ov002_021c1fa4
        .global func_ov002_021f18f8
        .arm
func_ov002_021f18f8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r5, r2
    mov r7, r0
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b9dec
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT0
    mov r2, #0x14
    ldr r3, _LIT1
    and ip, r6, #0x1
    mul r2, r5, r2
    mla r1, ip, r1, r3
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_ov002_021b7ad8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_80
    cmp r5, #0x5
    blt .L_8c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_80:
    cmp r5, #0x5
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
.L_8c:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_ov002_021c1e10
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_ov002_021c1d64
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, #0x1
    bl func_ov002_021c1fa4
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
