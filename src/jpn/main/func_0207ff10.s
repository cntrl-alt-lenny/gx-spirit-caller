; func_0207ff10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207ffd0
        .extern func_0208002c
        .global func_0207ff10
        .arm
func_0207ff10:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    mov r8, r0
    str r2, [sp]
    ldr r4, [r8, #0x4]
    add r0, sp, #0x0
    mov r7, r1
    mov r6, r3
    mov r5, #0x0
    blx r4
    movs r1, r0
    beq .L_90
    ldr r9, _LIT0
    add sl, sp, #0x0
.L_38:
    cmp r1, #0xa
    beq .L_90
    mov r0, r8
    bl func_0208002c
    mov r1, r0
    cmp r1, r9
    ldreq r0, [r8]
    ldreqh r1, [r0, #0x2]
    mov r0, r8
    bl func_0207ffd0
    ldrh r1, [r8, #0x8]
    cmp r1, #0x0
    ldrnesb r1, [r0]
    ldrneb r0, [r0, #0x1]
    addne r0, r1, r0
    ldreqsb r0, [r0, #0x2]
    add r1, r7, r0
    mov r0, sl
    add r5, r5, r1
    blx r4
    movs r1, r0
    bne .L_38
.L_90:
    cmp r6, #0x0
    beq .L_a8
    cmp r1, #0xa
    ldreq r0, [sp]
    movne r0, #0x0
    str r0, [r6]
.L_a8:
    cmp r5, #0x0
    subgt r5, r5, r7
    mov r0, r5
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x0000ffff
