; func_ov002_0226722c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_ov002_021b3ecc
        .extern func_ov002_021e30b4
        .global func_ov002_0226722c
        .arm
func_ov002_0226722c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r1
    mov r2, r9
    mov r1, #0xb
    mov r4, r0
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bne .L_d0
    ldr r0, _LIT0
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT1
    mov r5, #0x0
    ldr r0, [r0, r2]
    cmp r0, #0x0
    bls .L_d0
    ldr r1, _LIT2
    mov r0, r4, lsl #0x1f
    add r8, r1, r2
    and r1, r0, #-2147483648
    add r0, r8, #0x18
    orr r7, r1, #0x4e0000
    add r6, r0, #0x400
    orr r7, r7, #0x4000000
    mov r4, r5
.L_64:
    ldr r2, [r6]
    mov r0, r2, lsl #0x13
    cmp r9, r0, lsr #0x13
    mov r0, r0, lsr #0x13
    bne .L_bc
    mov r1, r2, lsl #0xa
    movs r1, r1, lsr #0x1f
    bne .L_bc
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r4
    orr r0, r7, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_bc:
    ldr r0, [r8, #0x14]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x4
    bcc .L_64
.L_d0:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word data_ov002_022cf16c
