; func_020a71fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a7158
        .extern func_020aadcc
        .global func_020a71fc
        .arm
func_020a71fc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    movs r4, r0
    mov r9, r1
    cmpne r9, #0x0
    mov r8, r2
    mov r7, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    add r6, sp, #0x0
.L_ac:
    ldrh r1, [r9]
    cmp r1, #0x0
    moveq r0, #0x0
    streqb r0, [r4, r7]
    beq .L_f8
    mov r0, r6
    add r9, r9, #0x2
    bl func_020a7158
    mov r5, r0
    add r0, r7, r5
    cmp r0, r8
    bhi .L_f8
    mov r1, r6
    mov r2, r5
    add r0, r4, r7
    bl func_020aadcc
    add r7, r7, r5
    cmp r7, r8
    bls .L_ac
.L_f8:
    mov r0, r7
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
