; func_0203f7c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe5a0
        .extern data_020fe5ac
        .extern data_020fe5b4
        .extern data_020fe5bc
        .extern data_020fe5c4
        .extern data_020fe5c8
        .extern data_020fe5d0
        .extern data_0219d9cc
        .extern data_0219d9d8
        .extern data_0219d9f8
        .extern func_0204068c
        .extern func_020409d8
        .extern func_020415c8
        .extern func_020aaddc
        .extern func_020aee3c
        .global func_0203f7c0
        .arm
func_0203f7c0:
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
    bne .L_154
    ldr r0, _LIT1
    bl func_020aaddc
    mov r3, r0
    ldr r1, _LIT2
    ldr r2, _LIT1
    mov r0, r5
    bl func_020415c8
    cmp r0, #0x0
    beq .L_1ac
    add sp, sp, #0x98
    mov r0, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_154:
    ldr r0, _LIT3
    bl func_020aaddc
    mov r3, r0
    ldr r1, _LIT2
    ldr r2, _LIT3
    mov r0, r5
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x98
    movne r0, #0x8
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r6
    bl func_020aaddc
    mov r3, r0
    ldr r1, _LIT4
    mov r0, r5
    mov r2, r6
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x98
    movne r0, #0x8
    ldmneia sp!, {r4, r5, r6, pc}
.L_1ac:
    ldr r1, _LIT0
    add r0, sp, #0x0
    bl func_020409d8
    cmp r0, #0x0
    addeq sp, sp, #0x98
    moveq r0, #0x5
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT5
    add r1, sp, #0x0
    ldr r2, [r0]
    mov r0, r5
    bl func_0204068c
    cmp r0, #0x0
    addeq sp, sp, #0x98
    moveq r0, #0x8
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT6
    ldr r0, [r0]
    cmp r0, #0x1
    bne .L_228
    ldr r0, _LIT7
    bl func_020aaddc
    mov r3, r0
    ldr r1, _LIT8
    ldr r2, _LIT7
    mov r0, r5
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x98
    movne r0, #0x8
    ldmneia sp!, {r4, r5, r6, pc}
.L_228:
    mov r0, r4
    bl func_020aee3c
    cmp r0, #0x0
    beq .L_268
    mov r0, r4
    bl func_020aee3c
    mov r3, r0
    ldr r1, _LIT9
    mov r0, r5
    mov r2, r4
    mov r3, r3, lsl #0x1
    bl func_020415c8
    cmp r0, #0x0
    addne sp, sp, #0x98
    movne r0, #0x8
    ldmneia sp!, {r4, r5, r6, pc}
.L_268:
    mov r0, #0x0
    add sp, sp, #0x98
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219d9d8
_LIT1: .word data_020fe5a0
_LIT2: .word data_020fe5ac
_LIT3: .word data_020fe5b4
_LIT4: .word data_020fe5bc
_LIT5: .word data_0219d9f8
_LIT6: .word data_0219d9cc
_LIT7: .word data_020fe5c4
_LIT8: .word data_020fe5c8
_LIT9: .word data_020fe5d0
