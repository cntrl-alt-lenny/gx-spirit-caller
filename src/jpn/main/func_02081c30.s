; func_02081c30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02081ce4
        .extern func_0208540c
        .global func_02081c30
        .arm
func_02081c30:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    ldr r2, [r0, #0x8]
    mov sl, r1
    ldrh r1, [r0, r2]
    add r9, r0, r2
    mov fp, #0x1
    add r8, r9, r1
    ldrb r0, [r8, #0x1]
    mov r7, #0x0
    cmp r0, #0x0
    bls .L_a8
    mov r6, r7
    mov r4, r7
    add r5, sl, #0x3c
.L_3c:
    ldrh r1, [r8, #0x6]
    mov r0, r5
    add r2, r8, r1
    ldrh r1, [r2, #0x2]
    add r1, r2, r1
    add r1, r1, r6
    bl func_0208540c
    movs r3, r0
    beq .L_90
    ldrh r1, [r8, #0x6]
    ldrh r0, [r8, r1]
    add r1, r8, r1
    add r1, r1, #0x4
    mla r1, r0, r7, r1
    ldrb r0, [r1, #0x3]
    ands r0, r0, #0x1
    bne .L_94
    mov r0, r9
    mov r2, sl
    bl func_02081ce4
    b .L_94
.L_90:
    mov fp, r4
.L_94:
    ldrb r0, [r8, #0x1]
    add r7, r7, #0x1
    add r6, r6, #0x10
    cmp r7, r0
    bcc .L_3c
.L_a8:
    mov r0, fp
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
