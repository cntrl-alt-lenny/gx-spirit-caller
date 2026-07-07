; func_ov002_022640c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b3dec
        .extern func_ov002_021c1d40
        .extern func_ov002_021d5a90
        .extern func_ov002_021de4e4
        .global func_ov002_022640c0
        .arm
func_ov002_022640c0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r6, _LIT0
    mov sl, r0
    ldr r0, [r6, #0xd28]
    cmp r0, #0xa
    bcs .L_e8
    ldr r7, _LIT1
    ldr r4, _LIT2
    ldr fp, _LIT3
    mov r5, #0x14
.L_28:
    umull r1, r9, r0, r4
    umull r1, r2, r0, r4
    mov r9, r9, lsr #0x2
    mov r1, #0x5
    eor r8, sl, r2, lsr #0x2
    umull r2, r3, r1, r9
    and r1, r8, #0x1
    sub r9, r0, r2
    mla r0, r1, fp, r7
    mla r0, r9, r5, r0
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_d4
    ldr r2, _LIT4
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_d4
    mov r0, r8
    mov r1, r9
    mov r2, #0x0
    bl func_ov002_021c1d40
    cmp r0, #0x0
    bne .L_d4
    mov r0, r8
    mov r1, r9
    mov r2, #0x0
    bl func_ov002_021de4e4
    cmp r0, #0x0
    bne .L_bc
    ldr r2, _LIT4
    mov r0, r8
    mov r1, r9
    mov r3, #0x1
    bl func_ov002_021d5a90
.L_bc:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0xd28]
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d4:
    ldr r0, [r6, #0xd28]
    add r0, r0, #0x1
    str r0, [r6, #0xd28]
    cmp r0, #0xa
    bcc .L_28
.L_e8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0xcccccccd
_LIT3: .word 0x00000868
_LIT4: .word 0x000017be
