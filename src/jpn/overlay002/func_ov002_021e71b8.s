; func_ov002_021e71b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce4a8
        .extern func_ov002_021b4a84
        .extern func_ov002_0229cc60
        .global func_ov002_021e71b8
        .arm
func_ov002_021e71b8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r6, _LIT0
    mov r5, #0x0
    str r5, [r6, #0x480]
    ldr r0, [r6, #0x490]
    cmp r0, #0x0
    bls .L_3dc4
    mov r4, r6
.L_3d1c:
    ldrh r0, [r6]
    bl func_ov002_021b4a84
    cmp r0, #0x0
    beq .L_3db0
    ldr r3, _LIT0
    mov r2, #0x18
    ldr r1, [r3, #0x480]
    ldr r0, _LIT1
    mla r6, r5, r2, r3
    add r4, r1, #0x1
    mla r0, r1, r2, r0
    mov r1, r6
    str r4, [r3, #0x480]
    bl func_ov002_0229cc60
    ldr r4, _LIT0
    ldr r0, [r4, #0x490]
    sub r0, r0, #0x1
    cmp r5, r0
    bcs .L_3d9c
    mov r8, #0x18
    mov r7, r8
.L_3d70:
    add r0, r5, #0x1
    mla r1, r0, r7, r4
    mov r0, r6
    mov r2, r8
    bl func_ov002_0229cc60
    ldr r0, [r4, #0x490]
    add r5, r5, #0x1
    sub r0, r0, #0x1
    cmp r5, r0
    add r6, r6, #0x18
    bcc .L_3d70
.L_3d9c:
    ldr r0, _LIT0
    ldr r1, [r0, #0x490]
    sub r1, r1, #0x1
    str r1, [r0, #0x490]
    b .L_3dc4
.L_3db0:
    ldr r0, [r4, #0x490]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x18
    bcc .L_3d1c
.L_3dc4:
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
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022ce4a8
