; func_ov002_0224a530 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf09c
        .extern func_ov002_02253370
        .global func_ov002_0224a530
        .arm
func_ov002_0224a530:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r5, r0
    ldr r0, _LIT0
    and r1, r5, #0x1
    mul sl, r1, r0
    ldr r0, _LIT1
    mov r4, r2
    ldr r0, [r0, sl]
    mov r7, #0x0
    cmp r0, #0x0
    bls .L_70
    ldr r0, _LIT2
    mov r6, #0xb
    add r9, r0, sl
    add r8, r9, #0x120
.L_3c:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    cmp r4, r0, lsr #0x13
    bne .L_5c
    mov r0, r5
    mov r1, r6
    mov r2, r7
    bl func_ov002_02253370
.L_5c:
    ldr r0, [r9, #0xc]
    add r7, r7, #0x1
    cmp r7, r0
    add r8, r8, #0x4
    bcc .L_3c
.L_70:
    ldr r0, _LIT3
    mov r8, #0x0
    ldr r0, [r0, sl]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    mov r9, #0xd
    add r7, r0, sl
    add r6, r7, #0x260
.L_94:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    cmp r4, r0, lsr #0x13
    bne .L_b4
    mov r0, r5
    mov r1, r9
    mov r2, r8
    bl func_ov002_02253370
.L_b4:
    ldr r0, [r7, #0x10]
    add r8, r8, #0x1
    cmp r8, r0
    add r6, r6, #0x4
    bcc .L_94
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf09c
