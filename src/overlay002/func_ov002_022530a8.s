; func_ov002_022530a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202e234
        .extern func_ov002_02253458
        .global func_ov002_022530a8
        .arm
func_ov002_022530a8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr fp, _LIT0
    mov sl, r0
    mov r6, #0x0
    mov r4, #0xe
.L_14:
    eor r7, sl, r6
    ldr r0, _LIT1
    and r1, r7, #0x1
    mla r9, r1, r0, fp
    ldr r0, [r9, #0x14]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_94
    add r0, r9, #0x18
    add r8, r0, #0x400
.L_3c:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    beq .L_80
    ldr r0, [r8]
    mov r1, r0, lsl #0xb
    movs r1, r1, lsr #0x1f
    bne .L_80
    mov r0, r0, lsl #0xc
    movs r0, r0, lsr #0x1f
    beq .L_80
    mov r0, r7
    mov r1, r4
    mov r2, r5
    bl func_ov002_02253458
.L_80:
    ldr r0, [r9, #0x14]
    add r5, r5, #0x1
    cmp r5, r0
    add r8, r8, #0x4
    bcc .L_3c
.L_94:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_14
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
