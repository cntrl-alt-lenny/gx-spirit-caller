; func_ov002_021fef30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_0202b824
        .extern func_0202e1e0
        .extern func_ov002_021b3ef8
        .global func_ov002_021fef30
        .arm
func_ov002_021fef30:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov fp, r0
    ldr r0, _LIT0
    and r4, fp, #0x1
    mul r5, r4, r0
    ldr r0, _LIT1
    mov sl, r1
    ldr r0, [r0, r5]
    mov r9, r2
    mov r8, r3
    cmp r0, #0x0
    mov r4, #0x0
    bls .L_1804
    ldr r0, _LIT2
    add r6, r0, r5
    add r5, r6, #0x120
.L_1738:
    ldr r0, [r5]
    ldr r2, [r5]
    mov r0, r0, lsl #0x13
    mov r1, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r0, r0, lsr #0x13
    mov r2, r2, lsr #0x18
    cmp r0, #0x0
    movgt r7, #0x1
    mov r2, r2, lsl #0x1
    movle r7, #0x0
    add r1, r2, r1, lsr #0x1f
    cmp r9, r1
    moveq r7, #0x0
    cmp r8, #0x0
    beq .L_17b8
    cmp r8, #0x7
    beq .L_178c
    cmp r8, #0x8
    beq .L_179c
    b .L_17ac
.L_178c:
    bl func_0202b824
    cmp r0, #0x16
    movne r7, #0x0
    b .L_17b8
.L_179c:
    bl func_0202b824
    cmp r0, #0x17
    movne r7, #0x0
    b .L_17b8
.L_17ac:
    bl func_0202e1e0
    cmp r0, #0x0
    moveq r7, #0x0
.L_17b8:
    ldr ip, [r5]
    ldr r2, _LIT3
    mov r3, ip, lsl #0x12
    mov ip, ip, lsl #0x2
    mov ip, ip, lsr #0x18
    mov ip, ip, lsl #0x1
    mov r0, fp
    mov r1, #0xb
    add r3, ip, r3, lsr #0x1f
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    movne r7, #0x0
    cmp r7, #0x0
    ldr r0, [r6, #0xc]
    add r4, r4, #0x1
    subne sl, sl, #0x1
    add r5, r5, #0x4
    cmp r4, r0
    bcc .L_1738
.L_1804:
    cmp sl, #0x0
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x000012a1
