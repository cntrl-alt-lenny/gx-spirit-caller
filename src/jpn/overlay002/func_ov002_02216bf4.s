; func_ov002_02216bf4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021b3dec
        .extern func_ov002_021debbc
        .global func_ov002_02216bf4
        .arm
func_ov002_02216bf4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r5, r0
    ldrh r1, [r5, #0x4]
    mov r0, r1, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r5, #0x2]
    mov r2, r1, lsl #0x11
    ldr r4, _LIT0
    mov r1, r0, lsl #0x1f
    mov r3, r1, lsr #0x1f
    mov r1, r0, lsl #0x1a
    ldr r0, _LIT1
    and r3, r3, #0x1
    mla r4, r3, r0, r4
    mov r1, r1, lsr #0x1b
    mov r0, #0x14
    mul r0, r1, r0
    add r1, r4, #0x30
    ldr r1, [r1, r0]
    mov r2, r2, lsr #0x17
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r9, #0x0
    ldr r7, _LIT2
    ldr r6, _LIT3
    mov r8, r9
.L_364:
    ldr r0, [r6, #0xcec]
    mov r4, r8
    eor sl, r0, r9
.L_370:
    mov r0, sl
    mov r1, r4
    mov r2, r7
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_398
    mov r0, r5
    mov r1, sl
    mov r2, r4
    bl func_ov002_021debbc
.L_398:
    add r4, r4, #0x1
    cmp r4, #0x5
    blt .L_370
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_364
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word 0x000012ea
_LIT3: .word data_ov002_022d008c
