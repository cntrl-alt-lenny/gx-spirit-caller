; func_ov002_02249e80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0172
        .extern data_ov002_022d0570
        .extern func_ov002_021b98d4
        .extern func_ov002_021c3304
        .extern func_ov002_02253370
        .global func_ov002_02249e80
        .arm
func_ov002_02249e80:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r1, _LIT0
    mov r2, r2, lsl #0x2
    ldrh r6, [r1, r2]
    mov r8, r0
    cmp r6, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, r8, #0x1
    mla r7, r1, r0, r2
    ldr r5, _LIT3
    ldr r9, _LIT4
    mov sl, #0xe
.L_38:
    add r1, r5, r6, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r6, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x6
    bcs .L_b0
    ldrh r0, [r1]
    cmp r0, r9
    bne .L_b0
    ldrh r1, [r1, #0x4]
    mov r0, r8
    bl func_ov002_021b98d4
    movs r4, r0
    bmi .L_b0
    mov r0, r8
    mov r1, r8
    mov r2, r4
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_b0
    add r0, r7, r4, lsl #0x2
    ldr r0, [r0, #0x418]
    mov r0, r0, lsl #0xf
    movs r0, r0, lsr #0x1e
    beq .L_b0
    mov r0, r8
    mov r1, sl
    mov r2, r4
    bl func_ov002_02253370
.L_b0:
    cmp r6, #0x0
    bne .L_38
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d0172
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022d0570
_LIT4: .word 0x000012e5
