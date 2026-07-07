; func_ov002_021e1a34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern func_0202df24
        .extern func_ov002_021d8324
        .global func_ov002_021e1a34
        .arm
func_ov002_021e1a34:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r9, r0
    ldr r0, _LIT0
    and r4, r9, #0x1
    mul r3, r4, r0
    ldr r0, _LIT1
    mov r8, r1
    ldr r0, [r0, r3]
    mov r7, r2
    cmp r0, #0x0
    mov r4, #0x0
    bls .L_bc
    ldr r0, _LIT2
    add r6, r0, r3
    add r5, r6, #0x260
.L_40:
    ldr r0, [r5]
    mov r1, r8
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df24
    cmp r0, #0x0
    beq .L_a8
    str r7, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    add r0, r6, #0x260
    ldr r2, [r0, r4, lsl #0x2]
    mov r0, r9
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r2, r1, r2, lsr #0x1f
    mov r3, r9
    mov r1, #0xd
    bl func_ov002_021d8324
    add sp, sp, #0xc
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_a8:
    ldr r0, [r6, #0x10]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_40
.L_bc:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf08c
