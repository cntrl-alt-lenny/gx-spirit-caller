; func_ov002_02248d70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern func_0202b980
        .extern func_0202e234
        .extern func_ov002_021b3fd8
        .extern func_ov002_02253458
        .global func_ov002_02248d70
        .arm
func_ov002_02248d70:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, _LIT0
    and r1, sl, #0x1
    mul r2, r1, r0
    ldr r1, _LIT1
    mov r7, #0x0
    ldr r1, [r1, r2]
    cmp r1, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT2
    ldr r5, _LIT3
    add r9, r1, r2
    add r8, r9, #0x260
    sub r4, r0, #0x28c
    mov fp, #0xd
    mov r6, #0xb
.L_44:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    beq .L_b4
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b980
    cmp r0, r4
    bgt .L_b4
    ldr r2, [r8]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov ip, r1, lsl #0x1
    mov r1, r6
    mov r2, r5
    add r3, ip, r3, lsr #0x1f
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    bne .L_b4
    mov r0, sl
    mov r1, fp
    mov r2, r7
    bl func_ov002_02253458
.L_b4:
    ldr r0, [r9, #0x10]
    add r7, r7, #0x1
    cmp r7, r0
    add r8, r8, #0x4
    bcc .L_44
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x000012a1
