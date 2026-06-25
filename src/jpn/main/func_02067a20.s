; func_02067a20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b3988
        .global func_02067a20
        .arm
func_02067a20:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    ldr r8, [sp, #0x28]
    ldr r7, [sp, #0x2c]
    movs sl, r1
    mov fp, r0
    str r2, [sp]
    mov r9, r3
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp sl, #0x1
    mov r6, #0x0
    mov r5, #0x1
    bls .L_4c
.L_3c:
    mov r0, r5, lsl #0x1
    add r5, r0, #0x1
    cmp r5, sl
    bcc .L_3c
.L_4c:
    mov r4, #0x0
.L_50:
    ldr r2, [r7]
    add r6, r6, #0x1
    add r0, r2, #0x1
    str r0, [r7]
    ldrb r1, [r8]
    ldr r0, [sp]
    ldrb r0, [r0, r2]
    ldrb r1, [fp, r1]
    add r0, r1, r0
    strb r0, [r8]
    ldr r0, [r7]
    cmp r0, r9
    strcs r4, [r7]
    ldrcsb r0, [r8]
    addcs r0, r0, r9
    strcsb r0, [r8]
    ldrb r0, [r8]
    cmp r6, #0xb
    and r0, r5, r0
    bls .L_ac
    mov r1, sl
    bl func_020b3988
    mov r0, r1
.L_ac:
    cmp r0, sl
    bhi .L_50
    and r0, r0, #0xff
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
