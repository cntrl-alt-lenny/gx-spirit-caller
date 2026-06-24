; func_ov002_021ca0d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf288
        .extern func_ov002_021b3ecc
        .extern func_ov002_021b3fd8
        .extern func_ov002_021b4098
        .extern func_ov002_021bae7c
        .extern func_ov002_021bb068
        .global func_ov002_021ca0d4
        .arm
func_ov002_021ca0d4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r2, [r2, #0x5c8]
    mov r4, r1
    cmp r2, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    and r2, r5, #0x1
    mul r3, r2, r1
    ldr r1, _LIT2
    ldr r1, [r1, r3]
    mov r1, r1, lsr #0x16
    tst r1, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT3
    cmp r4, r1
    beq .L_64
    sub r2, r1, #0x1400
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_64:
    ldr r2, _LIT4
    cmp r4, r2
    beq .L_88
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_88:
    ldr r2, _LIT5
    cmp r4, r2
    beq .L_ac
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_ac:
    ldr r2, _LIT6
    cmp r4, r2
    beq .L_d0
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_d0:
    ldr r2, _LIT7
    cmp r4, r2
    beq .L_f4
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_f4:
    ldr r0, _LIT8
    bl func_ov002_021bb068
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT9
    bl func_ov002_021bb068
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT10
    bl func_ov002_021bb068
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT11
    rsb r0, r5, #0x1
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r2, _LIT12
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b4098
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r2, _LIT13
    mov r0, r5
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021b3fd8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r2, _LIT14
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf288
_LIT3: .word 0x000013ff
_LIT4: .word 0x000012d2
_LIT5: .word 0x000012de
_LIT6: .word 0x00001710
_LIT7: .word 0x00001973
_LIT8: .word 0x0000147f
_LIT9: .word 0x000012b1
_LIT10: .word 0x00001ae1
_LIT11: .word 0x00001ae8
_LIT12: .word 0x000015ad
_LIT13: .word 0x00001679
_LIT14: .word 0x00001a29
