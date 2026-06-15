; func_02033944 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020469d0
        .extern func_02046ac4
        .extern func_02052974
        .extern func_02052bc4
        .global func_02033944
        .arm
func_02033944:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    ldr r0, [r9, #0xea0]
    mov r8, r1
    mov r7, r2
    mov r6, r3
    cmp r0, #0x0
    mov r5, #0x0
    bls .L_7c
    mov r4, #0x1
.L_28:
    bl func_02046ac4
    cmp r5, r0
    beq .L_6c
    tst r8, r4, lsl r5
    beq .L_6c
    and r0, r5, #0xff
    bl func_02052bc4
    cmp r0, #0x0
    bne .L_6c
    and r0, r5, #0xff
    bl func_020469d0
    cmp r0, #0x0
    mvneq r0, r4, lsl r5
    andeq r8, r8, r0
    beq .L_6c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_6c:
    ldr r0, [r9, #0xea0]
    add r5, r5, #0x1
    cmp r5, r0
    bcc .L_28
.L_7c:
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_02052974
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
