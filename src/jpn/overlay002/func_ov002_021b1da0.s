; func_ov002_021b1da0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0570
        .extern func_ov002_021b1ca4
        .global func_ov002_021b1da0
        .arm
func_ov002_021b1da0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    and r2, r0, #0xff
    and r0, r1, #0xff
    orr r0, r2, r0, lsl #0x8
    ldr r5, _LIT0
    ldr r6, _LIT1
    ldr fp, _LIT2
    mov r7, #0x0
    mov r4, r0, lsl #0x10
.L_120:
    and r0, r7, #0x1
    mla sl, r0, fp, r6
    mov r8, #0x0
.L_12c:
    ldrh r0, [sl, #0x3a]
    cmp r0, #0x0
    beq .L_170
.L_138:
    add r2, r5, r0, lsl #0x3
    ldrh r1, [r2, #0x2]
    ldrh r9, [r2, #0x6]
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x6
    bcc .L_164
    ldrh r1, [r2]
    cmp r1, r4, lsr #0x10
    bne .L_164
    bl func_ov002_021b1ca4
.L_164:
    mov r0, r9
    cmp r9, #0x0
    bne .L_138
.L_170:
    add r8, r8, #0x1
    cmp r8, #0xb
    add sl, sl, #0x14
    ble .L_12c
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_120
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d0570
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
