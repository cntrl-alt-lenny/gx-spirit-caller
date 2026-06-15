; func_020380dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02037b58
        .extern func_020386f4
        .extern func_02087dcc
        .global func_020380dc
        .arm
func_020380dc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r1
    mov r6, r2
    mov r5, r3
    bl func_02037b58
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r0, #0x34]
    mov r1, r1, lsr #0x14
    and r1, r1, #0xf
    cmp r1, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r5, #0x0
    ldrnesh r1, [r0, #0x18]
    addne r4, r4, r1
    cmp r6, #0x0
    beq .L_49c
    mov r1, r4
    mov r2, r6
    add r0, r0, #0xc
    bl func_020386f4
    b .L_4bc
.L_49c:
    strh r4, [r0, #0x18]
    ldrh r1, [r0, #0x68]
    tst r1, #0x6000
    bne .L_4bc
    ldr r1, _LIT0
    mov r2, r4
    add r0, r0, #0x4
    bl func_02087dcc
.L_4bc:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x0000ffff
