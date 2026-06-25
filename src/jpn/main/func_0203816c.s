; func_0203816c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02037b08
        .extern func_02087c6c
        .extern func_02087c94
        .global func_0203816c
        .arm
func_0203816c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    mov r5, r2
    bl func_02037b08
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, [r4, #0x34]
    mov r0, r0, lsr #0x14
    and r0, r0, #0xf
    cmp r0, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r6, #0x0
    blt .L_5c
    strb r6, [r4, #0x29]
    ldrh r0, [r4, #0x68]
    tst r0, #0x6000
    bne .L_5c
    ldr r1, _LIT0
    mov r2, r6
    add r0, r4, #0x4
    bl func_02087c94
.L_5c:
    cmp r5, #0x0
    blt .L_84
    strb r5, [r4, #0x2a]
    ldrh r0, [r4, #0x68]
    tst r0, #0x6000
    bne .L_84
    ldr r1, _LIT0
    mov r2, r5
    add r0, r4, #0x4
    bl func_02087c6c
.L_84:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x0000ffff
