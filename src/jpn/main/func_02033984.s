; func_02033984 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02046964
        .extern func_02046a58
        .extern func_020527fc
        .global func_02033984
        .arm
func_02033984:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    ldr r0, [r9, #0xe98]
    mov r8, r1
    mov r7, r2
    mov r6, r3
    cmp r0, #0x0
    mov r5, #0x0
    bls .L_f0
    mov r4, #0x1
.L_b8:
    bl func_02046a58
    cmp r5, r0
    beq .L_e0
    tst r8, r4, lsl r5
    beq .L_e0
    and r0, r5, #0xff
    bl func_02046964
    cmp r0, #0x0
    mvneq r0, r4, lsl r5
    andeq r8, r8, r0
.L_e0:
    ldr r0, [r9, #0xe98]
    add r5, r5, #0x1
    cmp r5, r0
    bcc .L_b8
.L_f0:
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_020527fc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
