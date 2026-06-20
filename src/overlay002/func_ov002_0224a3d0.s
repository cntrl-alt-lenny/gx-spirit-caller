; func_ov002_0224a3d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202df78
        .extern func_ov002_021ca3f0
        .extern func_ov002_02253458
        .global func_ov002_0224a3d0
        .arm
func_ov002_0224a3d0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r3, _LIT0
    ldr r0, _LIT1
    and r5, r6, #0x1
    mla r0, r5, r3, r0
    mov r5, r2
    add r0, r0, r5, lsl #0x2
    ldr r0, [r0, #0x120]
    ldr ip, _LIT2
    mov r0, r0, lsl #0x13
    cmp r1, ip
    mov r0, r0, lsr #0x13
    bgt .L_88
    cmp r1, ip
    bge .L_c0
    ldr r3, _LIT3
    cmp r1, r3
    bgt .L_78
    sub r2, r3, #0x4
    cmp r1, r2
    blt .L_68
    beq .L_b8
    cmp r1, r3
    addeq r4, r3, #0x1
    b .L_cc
.L_68:
    ldr r2, _LIT4
    cmp r1, r2
    ldreq r4, _LIT5
    b .L_cc
.L_78:
    add r2, r3, #0x87
    cmp r1, r2
    addeq r4, r3, #0x71
    b .L_cc
.L_88:
    add r2, ip, #0x124
    cmp r1, r2
    bgt .L_a8
    bge .L_c8
    add r2, ip, #0xe0
    cmp r1, r2
    addeq r4, r3, #0x790
    b .L_cc
.L_a8:
    ldr r2, _LIT6
    cmp r1, r2
    ldreq r4, _LIT7
    b .L_cc
.L_b8:
    sub r4, r3, #0x3
    b .L_cc
.L_c0:
    mov r4, r1
    b .L_cc
.L_c8:
    ldr r4, _LIT8
.L_cc:
    mov r1, r4
    bl func_0202df78
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r4
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r2, r5
    mov r1, #0xb
    bl func_ov002_02253458
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x000016fd
_LIT3: .word 0x000015d4
_LIT4: .word 0x00001476
_LIT5: .word 0x00001121
_LIT6: .word 0x0000189a
_LIT7: .word 0x00000fa7
_LIT8: .word 0x00001820
