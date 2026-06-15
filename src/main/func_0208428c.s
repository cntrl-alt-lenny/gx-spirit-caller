; func_0208428c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02084efc
        .global func_0208428c
        .arm
func_0208428c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x20]
    mov r5, r2
    cmp r0, #0x0
    ldrneb r4, [r6, #0x91]
    moveq r4, #0x0
    cmp r4, #0x1
    bne .L_1a30
    ldr r1, [r6, #0x8]
    mov r0, r6
    bic r1, r1, #0x40
    str r1, [r6, #0x8]
    ldr r1, [r6, #0x20]
    blx r1
    ldr r0, [r6, #0x20]
    cmp r0, #0x0
    ldrneb r4, [r6, #0x91]
    ldr r0, [r6, #0x8]
    moveq r4, #0x0
    and r0, r0, #0x40
    b .L_1a34
.L_1a30:
    mov r0, #0x0
.L_1a34:
    cmp r0, #0x0
    bne .L_1a58
    ldr r0, [r6, #0x8]
    ands r0, r0, #0x100
    bne .L_1a58
    ldr r0, [r5, #0x8]
    ldr r1, [r5, #0xc]
    add r0, r5, r0
    bl func_02084efc
.L_1a58:
    cmp r4, #0x2
    bne .L_1a88
    ldr r1, [r6, #0x8]
    mov r0, r6
    bic r1, r1, #0x40
    str r1, [r6, #0x8]
    ldr r1, [r6, #0x20]
    blx r1
    ldr r0, [r6, #0x20]
    cmp r0, #0x0
    ldrneb r4, [r6, #0x91]
    moveq r4, #0x0
.L_1a88:
    cmp r4, #0x3
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, [r6, #0x8]
    mov r0, r6
    bic r1, r1, #0x40
    str r1, [r6, #0x8]
    ldr r1, [r6, #0x20]
    blx r1
    ldmia sp!, {r4, r5, r6, pc}
