; func_ov002_02293e00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_ov002_021bad9c
        .extern func_ov002_0227c588
        .extern func_ov002_0227da20
        .global func_ov002_02293e00
        .arm
func_ov002_02293e00:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r3, r0, #0x1
    and r3, r3, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    mov r7, #0x0
    cmp r1, #0x3
    movcc r0, r7
    ldmccia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT2
    sub r2, r7, #0x1
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [sl, #0x2]
    ldr r4, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r4
    ldr r2, [r2, r1]
    mov r6, r7
    cmp r2, #0x0
    bls .L_100
    ldr r5, _LIT3
    mov r9, r6
    mov fp, #0x1
.L_8c:
    add r1, r5, r1
    add r1, r1, r9
    ldr r2, [r1, #0x120]
    mov r1, fp
    mov r2, r2, lsl #0x13
    mov r8, r2, lsr #0x13
    mov r2, r8, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_0227c588
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    bl func_ov002_0227da20
    cmp r0, #0x0
    ldrh r0, [sl, #0x2]
    add r6, r6, #0x1
    addne r7, r7, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r1, r2, r4
    add r2, r5, r1
    ldr r2, [r2, #0xc]
    add r9, r9, #0x4
    cmp r6, r2
    bcc .L_8c
.L_100:
    rsb r1, r0, #0x1
    ldr r0, _LIT0
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT1
    ldr r0, [r0, r2]
    cmp r0, #0x5
    movcs r0, #0x1
    ldmcsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r7, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word 0x00001306
_LIT3: .word data_ov002_022cf08c
