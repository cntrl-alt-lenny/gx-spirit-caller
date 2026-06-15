; func_020557b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffcd0
        .extern data_020ffce0
        .extern data_020ffcf0
        .extern data_020ffcfc
        .extern func_0205d504
        .extern func_0205ffc0
        .extern func_020604b0
        .extern func_020a6d54
        .extern func_020a73d4
        .global func_020557b8
        .arm
func_020557b8:
    stmdb sp!, {r4, r5, r6, lr}
    movs r5, r0
    mov r4, r2
    beq .L_4a4
    ldr r3, [r5]
    cmp r3, #0x0
    bne .L_4ac
.L_4a4:
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_4ac:
    ldr r2, [r3, #0x108]
    cmp r2, #0x0
    beq .L_4d0
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x210
    bl func_020a73d4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_4d0:
    cmp r4, #0x0
    bne .L_4e8
    ldr r1, _LIT0
    bl func_0205ffc0
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_4e8:
    cmp r1, #0x0
    ldr r2, [r3, #0x430]
    blt .L_4fc
    cmp r1, r2
    blt .L_510
.L_4fc:
    ldr r1, _LIT1
    mov r0, r5
    bl func_0205ffc0
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_510:
    bl func_0205d504
    movs r6, r0
    bne .L_530
    ldr r1, _LIT1
    mov r0, r5
    bl func_0205ffc0
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_530:
    ldr r5, [r6, #0x8]
    cmp r5, #0x0
    bne .L_550
    ldr r0, _LIT2
    ldr r1, _LIT3
    ldr r3, _LIT4
    mov r2, #0x0
    bl func_020a6d54
.L_550:
    ldr r0, [r6]
    str r0, [r4]
    ldr r0, [r5, #0x4]
    str r0, [r4, #0x4]
    ldr r1, [r5, #0x8]
    cmp r1, #0x0
    moveq r0, #0x0
    streqb r0, [r1]
    beq .L_580
    add r0, r4, #0x8
    mov r2, #0x100
    bl func_020604b0
.L_580:
    ldr r1, [r5, #0xc]
    cmp r1, #0x0
    moveq r0, #0x0
    streqb r0, [r1]
    beq .L_5a0
    add r0, r4, #0x108
    mov r2, #0x100
    bl func_020604b0
.L_5a0:
    ldr r1, [r5, #0x10]
    mov r0, #0x0
    str r1, [r4, #0x208]
    ldr r1, [r5, #0x14]
    str r1, [r4, #0x20c]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020ffcd0
_LIT1: .word data_020ffce0
_LIT2: .word data_020ffcf0
_LIT3: .word data_020ffcfc
_LIT4: .word 0x000005cf
