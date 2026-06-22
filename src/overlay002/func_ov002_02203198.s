; func_ov002_02203198 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_ov002_021bbf50
        .extern func_ov002_021c93f0
        .global func_ov002_02203198
        .arm
func_ov002_02203198:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbf50
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r1, [sl, #0x2]
    ldr r4, _LIT0
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r8, r1, lsr #0x1f
    and r1, r8, #0x1
    mul r2, r1, r4
    ldr r0, [r0, r2]
    mov r6, #0x0
    cmp r0, #0x0
    bls .L_304
    ldr r5, _LIT2
    mov r7, r6
    mov fp, #0xb
.L_27c:
    ldrh r1, [sl, #0x2]
    ldrh r0, [sl, #0x4]
    mov r1, r1, lsl #0x1f
    mov r9, r1, lsr #0x1f
    and r1, r9, #0x1
    mla r2, r1, r4, r5
    add r1, r2, #0x120
    ldr r2, [r1, r7]
    mov r0, r0, lsl #0x11
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    mov r3, r0, lsr #0x17
    add r0, r1, r2, lsr #0x1f
    cmp r3, r0
    beq .L_2e8
    mov r0, r9
    mov r1, fp
    mov r2, r6
    mov r8, r9
    bl func_ov002_021c93f0
    ldr r0, [r0]
    mov r0, r0, lsl #0x12
    cmp r9, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2e8:
    and r1, r8, #0x1
    mla r0, r1, r4, r5
    ldr r0, [r0, #0xc]
    add r6, r6, #0x1
    cmp r6, r0
    add r7, r7, #0x4
    bcc .L_27c
.L_304:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022cf16c
