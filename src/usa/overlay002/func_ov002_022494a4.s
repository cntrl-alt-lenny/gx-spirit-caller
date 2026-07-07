; func_ov002_022494a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern func_ov002_021b3ef8
        .extern func_ov002_02253370
        .global func_ov002_022494a4
        .arm
func_ov002_022494a4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov sl, r0
    cmp r2, #0x0
    ldr r0, _LIT0
    beq .L_8c
    rsb r8, sl, #0x1
    ldr r6, _LIT1
    and r1, r8, #0x1
    mla r9, r1, r0, r6
    mov r7, #0x0
    mov r4, #0xd
    mov r5, r7
.L_30:
    ldr r0, [r9, #0x10]
    mov r2, r5
    cmp r0, #0x0
    bls .L_70
    add r1, r6, r7, lsl #0x1
    add r1, r1, #0x1d00
    ldrh sl, [r1, #0xa2]
    add r3, r9, #0x260
.L_50:
    ldr r1, [r3]
    mov r1, r1, lsl #0x13
    cmp sl, r1, lsr #0x13
    beq .L_70
    add r2, r2, #0x1
    cmp r2, r0
    add r3, r3, #0x4
    bcc .L_50
.L_70:
    mov r0, r8
    mov r1, r4
    bl func_ov002_02253370
    add r7, r7, #0x1
    cmp r7, #0x5
    blt .L_30
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_8c:
    and r2, sl, #0x1
    mul r1, r2, r0
    ldr r0, _LIT2
    mov r9, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT1
    ldr r5, _LIT3
    add r8, r0, r1
    add r7, r8, #0x260
    mov r4, #0xd
    mov r6, #0xb
.L_c0:
    ldr r2, [r7]
    mov r0, sl
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov ip, r2, lsl #0x12
    mov r3, r1, lsl #0x1
    mov r1, r6
    mov r2, r5
    add r3, r3, ip, lsr #0x1f
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_100
    mov r0, sl
    mov r1, r4
    mov r2, r9
    bl func_ov002_02253370
.L_100:
    ldr r0, [r8, #0x10]
    add r9, r9, #0x1
    cmp r9, r0
    add r7, r7, #0x4
    bcc .L_c0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf09c
_LIT3: .word 0x000012a1
