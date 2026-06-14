; func_ov019_021b3f7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern func_02018dcc
        .extern func_020195b8
        .extern func_0201b690
        .extern func_ov019_021b43a8
        .global func_ov019_021b3f7c
        .arm
func_ov019_021b3f7c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r5, #0x0
    ldr r4, _LIT0
    add r9, sl, #0x14
    mov r6, #0x1
    mov fp, r5
.L_1c:
    cmp r6, #0x7
    mov r7, r6
    bgt .L_54
    cmp r6, #0x0
    addge pc, pc, r6, lsl #0x2
    b .L_c4
    b .L_c4
    b .L_c4
    b .L_60
    b .L_70
    b .L_c4
    b .L_80
    b .L_c4
    b .L_a4
.L_54:
    cmp r6, #0x2d
    moveq r7, #0x49
    b .L_c4
.L_60:
    ldr r0, [r4, #0x928]
    cmp r0, #0x24
    movcs r7, #0x4a
    b .L_c4
.L_70:
    ldr r0, [r4, #0x928]
    cmp r0, #0x29
    movcs r7, #0x5e
    b .L_c4
.L_80:
    ldr r0, [r4, #0x928]
    cmp r0, #0x17
    movhi r7, #0x4b
    bhi .L_c4
    bne .L_c4
    ldr r0, [r4, #0x92c]
    cmp r0, #0x4
    movcs r7, #0x4b
    b .L_c4
.L_a4:
    ldr r0, [r4, #0x928]
    cmp r0, #0x2b
    movhi r7, #0x3f
    bhi .L_c4
    bne .L_c4
    ldr r0, [r4, #0x92c]
    cmp r0, #0x3
    movcs r7, #0x3f
.L_c4:
    mov r0, r7
    mov r1, fp
    bl func_020195b8
    add r8, fp, r0
    mov r0, r7
    mov r1, #0x1
    bl func_020195b8
    add r8, r8, r0
    mov r0, r7
    mov r1, #0x2
    bl func_020195b8
    add r0, r8, r0
    cmp r0, #0x0
    movgt r8, #0x1
    movle r8, #0x0
    mov r0, sl
    mov r1, r7
    add r2, r5, #0x1
    bl func_ov019_021b43a8
    cmp r0, #0x0
    cmpne r8, #0x0
    beq .L_140
    strh r7, [r9]
    mov r0, r7
    bl func_02018dcc
    str r0, [r9, #0x4]
    mov r0, r6
    bl func_0201b690
    strh r0, [r9, #0x8]
    add r9, r9, #0xc
    add r5, r5, #0x1
.L_140:
    add r6, r6, #0x1
    cmp r6, #0x60
    blt .L_1c
    str r5, [sl, #0x8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104f4c
