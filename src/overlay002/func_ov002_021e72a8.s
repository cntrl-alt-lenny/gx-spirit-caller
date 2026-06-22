; func_ov002_021e72a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022ce588
        .extern func_ov002_021b4b64
        .extern func_ov002_0229cd70
        .global func_ov002_021e72a8
        .arm
func_ov002_021e72a8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r6, _LIT0
    mov r5, #0x0
    str r5, [r6, #0x480]
    ldr r0, [r6, #0x490]
    cmp r0, #0x0
    bls .L_1cc
    mov r4, r6
.L_124:
    ldrh r0, [r6]
    bl func_ov002_021b4b64
    cmp r0, #0x0
    beq .L_1b8
    ldr r3, _LIT0
    mov r2, #0x18
    ldr r1, [r3, #0x480]
    ldr r0, _LIT1
    mla r6, r5, r2, r3
    add r4, r1, #0x1
    mla r0, r1, r2, r0
    mov r1, r6
    str r4, [r3, #0x480]
    bl func_ov002_0229cd70
    ldr r4, _LIT0
    ldr r0, [r4, #0x490]
    sub r0, r0, #0x1
    cmp r5, r0
    bcs .L_1a4
    mov r8, #0x18
    mov r7, r8
.L_178:
    add r0, r5, #0x1
    mla r1, r0, r7, r4
    mov r0, r6
    mov r2, r8
    bl func_ov002_0229cd70
    ldr r0, [r4, #0x490]
    add r5, r5, #0x1
    sub r0, r0, #0x1
    cmp r5, r0
    add r6, r6, #0x18
    bcc .L_178
.L_1a4:
    ldr r0, _LIT0
    ldr r1, [r0, #0x490]
    sub r1, r1, #0x1
    str r1, [r0, #0x490]
    b .L_1cc
.L_1b8:
    ldr r0, [r4, #0x490]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x18
    bcc .L_124
.L_1cc:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0, #0x480]
    cmp r0, #0x0
    movgt r2, #0x1
    ldr r0, _LIT0
    movle r2, #0x0
    str r2, [r0, #0x598]
    str r1, [r0, #0x59c]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022ce588
