; func_ov002_021e70b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce4a8
        .extern func_ov002_0229cc60
        .global func_ov002_021e70b4
        .arm
func_ov002_021e70b4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r6, _LIT0
    mov r4, #0x0
    str r4, [r6, #0x480]
    ldr r0, [r6, #0x490]
    cmp r0, #0x0
    bls .L_3c64
    ldr r7, _LIT1
    mov r8, r6
    mov sl, r6
    mov r9, r6
    mov r5, #0x18
.L_3c28:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_ov002_0229cc60
    ldr r0, [sl, #0x480]
    add r0, r0, #0x1
    str r0, [r9, #0x480]
    cmp r0, #0x10
    bge .L_3c64
    ldr r0, [r8, #0x490]
    add r4, r4, #0x1
    cmp r4, r0
    add r6, r6, #0x18
    add r7, r7, #0x18
    bcc .L_3c28
.L_3c64:
    ldr r8, _LIT0
    ldr r0, [r8, #0x490]
    cmp r4, r0
    bcs .L_3cbc
    subs r0, r0, r4
    mov r7, #0x0
    beq .L_3cbc
    mov r5, #0x18
    mov r6, r8
    mov sl, r8
    mov r9, r5
.L_3c90:
    add r0, r4, r7
    mla r1, r0, r9, r6
    mov r0, r8
    mov r2, r5
    bl func_ov002_0229cc60
    ldr r0, [sl, #0x490]
    add r7, r7, #0x1
    sub r0, r0, r4
    cmp r7, r0
    add r8, r8, #0x18
    bcc .L_3c90
.L_3cbc:
    ldr r0, _LIT0
    ldr r1, [r0, #0x490]
    sub r1, r1, r4
    str r1, [r0, #0x490]
    ldr r0, [r0, #0x480]
    mov r1, #0x0
    cmp r0, #0x0
    movgt r2, #0x1
    ldr r0, _LIT0
    movle r2, #0x0
    str r2, [r0, #0x598]
    str r1, [r0, #0x59c]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022ce4a8
