; func_ov002_022563f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021b9e00
        .extern func_ov002_021de480
        .global func_ov002_022563f0
        .arm
func_ov002_022563f0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r6, #0x0
.L_108:
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r1, [r0, #0xcec]
    ldr r0, _LIT2
    eor r4, r1, r6
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    ldr sl, _LIT3
    ldr r9, _LIT4
    add r7, r0, #0x94
    add r8, r0, #0x64
    mov r5, #0x5
.L_138:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    cmp r9, r0, lsr #0x13
    bne .L_1b0
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    beq .L_1b0
    ldr r1, [r8, #0x40]
    mov r0, r1, lsr #0x6
    tst r0, #0x1
    bne .L_1b0
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    beq .L_180
    ldr r0, [sl, #0x484]
    cmp r0, #0x0
    beq .L_1b0
.L_180:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9e00
    cmp r0, #0x0
    bne .L_1b0
    mov r2, #0x0
    mov r0, r4
    mov r1, r5
    mov r3, r2
    bl func_ov002_021de480
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1b0:
    add r5, r5, #0x1
    cmp r5, #0xa
    add r7, r7, #0x14
    add r8, r8, #0x14
    blt .L_138
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_108
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022ce288
_LIT4: .word 0x00001624
