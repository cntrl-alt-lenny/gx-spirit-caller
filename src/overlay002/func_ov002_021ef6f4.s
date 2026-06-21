; func_ov002_021ef6f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a4
        .extern func_0202e5ac
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bc8c8
        .global func_ov002_021ef6f4
        .arm
func_ov002_021ef6f4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r1
    mov r4, r2
    mov r7, r0
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9ecc
    mov r6, r0
    cmp r4, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_0202e5ac
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    cmp r6, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r7, #0x2]
    mov r1, r5
    mov r2, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    beq .L_ac
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r5
    beq .L_a4
    ldr r0, _LIT1
    mov r1, #0x14
    ldr r2, _LIT2
    and r3, r5, #0x1
    mul r1, r4, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_ac
.L_a4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_ac:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x0000158c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
