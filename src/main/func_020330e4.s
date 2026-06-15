; func_020330e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe468
        .extern func_02032624
        .extern func_0203267c
        .extern func_0203269c
        .extern func_020326bc
        .extern func_020326d4
        .extern func_02033054
        .extern func_020454f0
        .extern func_020945f4
        .global func_020330e4
        .arm
func_020330e4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    movs r7, r0
    mov r4, r1
    mov r6, r2
    mov r5, r3
    bne .L_c0
    ldr r0, _LIT0
    mov r1, #0x4
    blx r6
    movs r7, r0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT0
    mov r1, #0x0
    bl func_020945f4
    str r6, [r7, #0xebc]
    cmp r4, #0x40
    movgt r4, #0x40
    ldr r0, _LIT1
    str r5, [r7, #0xec0]
    str r0, [r7, #0xeb0]
    mov r0, r7
    mov r1, r4
    str r4, [r7, #0xeac]
    bl func_020326d4
    cmp r0, #0x0
    mvnlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    bl func_0203267c
.L_c0:
    mov r0, #0x2
    bl func_02032624
    ldr r0, _LIT2
    ldr r4, [r0]
    cmp r4, #0x0
    bge .L_ec
    mov r0, r6
    mov r1, r5
    mov r2, #0x0
    bl func_02033054
    mov r4, r0
.L_ec:
    ldr r0, _LIT3
    ldr r1, _LIT4
    bl func_020454f0
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000fa4
_LIT1: .word 0x00007530
_LIT2: .word data_020fe468
_LIT3: .word func_0203269c
_LIT4: .word func_020326bc
