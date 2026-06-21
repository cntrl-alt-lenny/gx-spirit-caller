; func_ov002_021c1010 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1ac
        .extern func_ov002_021b1f20
        .extern func_ov002_021b9ecc
        .global func_ov002_021c1010
        .arm
func_ov002_021c1010:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    mov r1, #0x14
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r3, r5, #0x1
    mla r2, r3, r0, r2
    mul ip, r4, r1
    ldr r0, [r2, ip]
    orr r1, r0, #0x200000
    mov r0, r1, lsr #0x16
    tst r0, #0x1
    str r1, [r2, ip]
    movne r3, #0x17
    ldr r1, [r2, ip]
    moveq r3, #0x16
    mov r0, #0x1
    orr r3, r1, r0, lsl r3
    mov r0, r5
    mov r1, r4
    str r3, [r2, ip]
    bl func_ov002_021b9ecc
    ldr r1, _LIT2
    cmp r0, r1
    bgt .L_d40
    bge .L_d60
    sub r1, r1, #0x3a
    cmp r0, r1
    beq .L_d60
    ldmia sp!, {r3, r4, r5, pc}
.L_d40:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_d54
    beq .L_d60
    ldmia sp!, {r3, r4, r5, pc}
.L_d54:
    add r1, r1, #0x8d
    cmp r0, r1
    ldmneia sp!, {r3, r4, r5, pc}
.L_d60:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9ecc
    mov r3, r0
    mov ip, #0x0
    mov r0, r5
    mov r1, r4
    mov r2, #0x1
    str ip, [sp]
    bl func_ov002_021b1f20
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cf1ac
_LIT1: .word 0x00000868
_LIT2: .word 0x000018a6
_LIT3: .word 0x000019c1
