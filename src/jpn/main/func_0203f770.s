; func_0203f770 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe4c0
        .extern data_020fe4cc
        .extern data_020fe4d4
        .extern data_020fe4dc
        .extern data_020fe4e4
        .extern data_020fe4e8
        .extern data_020fe4f0
        .extern data_0219d8ec
        .extern data_0219d8f8
        .extern data_0219d918
        .extern func_0204063c
        .extern func_02040988
        .extern func_02041578
        .extern func_020aace8
        .extern func_020aed48
        .global func_0203f770
        .arm
func_0203f770:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x98
    ldr r4, _LIT0
    mov r3, #0x0
    ldr r5, [r4, #0x4]
    ldr ip, [r4]
    cmp r5, r3
    mov r5, r0
    mov r6, r1
    mov r4, r2
    cmpeq ip, r3
    bne .L_60
    ldr r0, _LIT1
    bl func_020aace8
    mov r3, r0
    ldr r1, _LIT2
    ldr r2, _LIT1
    mov r0, r5
    bl func_02041578
    cmp r0, #0x0
    beq .L_b8
    add sp, sp, #0x98
    mov r0, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_60:
    ldr r0, _LIT3
    bl func_020aace8
    mov r3, r0
    ldr r1, _LIT2
    ldr r2, _LIT3
    mov r0, r5
    bl func_02041578
    cmp r0, #0x0
    addne sp, sp, #0x98
    movne r0, #0x8
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r6
    bl func_020aace8
    mov r3, r0
    ldr r1, _LIT4
    mov r0, r5
    mov r2, r6
    bl func_02041578
    cmp r0, #0x0
    addne sp, sp, #0x98
    movne r0, #0x8
    ldmneia sp!, {r4, r5, r6, pc}
.L_b8:
    ldr r1, _LIT0
    add r0, sp, #0x0
    bl func_02040988
    cmp r0, #0x0
    addeq sp, sp, #0x98
    moveq r0, #0x5
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT5
    add r1, sp, #0x0
    ldr r2, [r0]
    mov r0, r5
    bl func_0204063c
    cmp r0, #0x0
    addeq sp, sp, #0x98
    moveq r0, #0x8
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT6
    ldr r0, [r0]
    cmp r0, #0x1
    bne .L_134
    ldr r0, _LIT7
    bl func_020aace8
    mov r3, r0
    ldr r1, _LIT8
    ldr r2, _LIT7
    mov r0, r5
    bl func_02041578
    cmp r0, #0x0
    addne sp, sp, #0x98
    movne r0, #0x8
    ldmneia sp!, {r4, r5, r6, pc}
.L_134:
    mov r0, r4
    bl func_020aed48
    cmp r0, #0x0
    beq .L_174
    mov r0, r4
    bl func_020aed48
    mov r3, r0
    ldr r1, _LIT9
    mov r0, r5
    mov r2, r4
    mov r3, r3, lsl #0x1
    bl func_02041578
    cmp r0, #0x0
    addne sp, sp, #0x98
    movne r0, #0x8
    ldmneia sp!, {r4, r5, r6, pc}
.L_174:
    mov r0, #0x0
    add sp, sp, #0x98
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219d8f8
_LIT1: .word data_020fe4c0
_LIT2: .word data_020fe4cc
_LIT3: .word data_020fe4d4
_LIT4: .word data_020fe4dc
_LIT5: .word data_0219d918
_LIT6: .word data_0219d8ec
_LIT7: .word data_020fe4e4
_LIT8: .word data_020fe4e8
_LIT9: .word data_020fe4f0
