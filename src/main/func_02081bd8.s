; func_02081bd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02081c84
        .extern func_020854f4
        .global func_02081bd8
        .arm
func_02081bd8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r2, [r0, #0x8]
    mov sl, r1
    add r9, r0, r2
    ldrh r0, [r9, #0x2]
    mov r6, #0x1
    mov r7, #0x0
    add r8, r9, r0
    ldrb r0, [r8, #0x1]
    cmp r0, #0x0
    bls .L_120
    mov r5, r7
    mov r4, r7
.L_b0:
    ldrh r1, [r8, #0x6]
    ldrh r0, [sl, #0x34]
    add r2, r8, r1
    ldrh r1, [r2, #0x2]
    add r0, sl, r0
    add r1, r2, r1
    add r1, r1, r5
    bl func_020854f4
    movs r3, r0
    beq .L_108
    ldrh r1, [r8, #0x6]
    ldrh r0, [r8, r1]
    add r1, r8, r1
    add r1, r1, #0x4
    mla r1, r0, r7, r1
    ldrb r0, [r1, #0x3]
    ands r0, r0, #0x1
    bne .L_10c
    mov r0, r9
    mov r2, sl
    bl func_02081c84
    b .L_10c
.L_108:
    mov r6, r4
.L_10c:
    ldrb r0, [r8, #0x1]
    add r7, r7, #0x1
    add r5, r5, #0x10
    cmp r7, r0
    bcc .L_b0
.L_120:
    mov r0, r6
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
