; func_ov002_021ba444 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a4
        .extern func_ov002_021b90e4
        .extern func_ov002_021b9118
        .global func_ov002_021ba444
        .arm
func_ov002_021ba444:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r5, r0, r2
    ldr r0, _LIT1
    mov r7, r1
    ldr r0, [r0, r5]
    mov r4, #0x0
    cmp r0, #0x0
    bls .L_a8
    ldr r0, _LIT2
    add r6, r0, r5
    add r8, r6, #0x3a0
.L_34:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b9118
    cmp r0, #0x0
    beq .L_94
    ldr r1, _LIT1
    ldr r0, [r1, r5]
    sub r0, r0, #0x1
    str r0, [r1, r5]
    cmp r4, r0
    bcs .L_8c
    add r5, r6, #0x3a0
    add r7, r5, r4, lsl #0x2
.L_68:
    add r1, r4, #0x1
    mov r0, r7
    add r1, r5, r1, lsl #0x2
    bl func_ov002_021b90e4
    ldr r0, [r6, #0x18]
    add r4, r4, #0x1
    cmp r4, r0
    add r7, r7, #0x4
    bcc .L_68
.L_8c:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_94:
    ldr r0, [r6, #0x18]
    add r4, r4, #0x1
    cmp r4, r0
    add r8, r8, #0x4
    bcc .L_34
.L_a8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a4
_LIT2: .word data_ov002_022cf08c
