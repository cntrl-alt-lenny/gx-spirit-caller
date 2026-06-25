; func_020841a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02084e14
        .global func_020841a4
        .arm
func_020841a4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6, #0x20]
    mov r5, r2
    cmp r0, #0x0
    ldrneb r4, [r6, #0x91]
    moveq r4, #0x0
    cmp r4, #0x1
    bne .L_58
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
    b .L_5c
.L_58:
    mov r0, #0x0
.L_5c:
    cmp r0, #0x0
    bne .L_80
    ldr r0, [r6, #0x8]
    ands r0, r0, #0x100
    bne .L_80
    ldr r0, [r5, #0x8]
    ldr r1, [r5, #0xc]
    add r0, r5, r0
    bl func_02084e14
.L_80:
    cmp r4, #0x2
    bne .L_b0
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
.L_b0:
    cmp r4, #0x3
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, [r6, #0x8]
    mov r0, r6
    bic r1, r1, #0x40
    str r1, [r6, #0x8]
    ldr r1, [r6, #0x20]
    blx r1
    ldmia sp!, {r4, r5, r6, pc}
