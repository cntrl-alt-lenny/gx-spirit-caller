; func_ov004_021d0088 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02102bb0
        .extern data_02104e6c
        .extern data_ov004_02209b9c
        .extern func_02001cec
        .extern func_02001d48
        .extern func_02001e74
        .extern func_02004f3c
        .extern func_02005488
        .extern func_02022b20
        .extern func_0202c06c
        .extern func_0202c8e8
        .extern func_0202c96c
        .extern func_0202cc50
        .extern func_0208de24
        .extern func_0208e0e4
        .extern func_02091554
        .extern func_02094410
        .extern func_020aad04
        .global func_ov004_021d0088
        .arm
func_ov004_021d0088:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x64
    movs r4, r0
    movne r5, #0x1
    moveq r5, #0x0
    bl func_0202c8e8
    ldr r0, [r0]
    cmp r5, r0
    beq .L_464
    mov r0, r5
    bl func_0202c96c
    cmp r5, #0x0
    bne .L_440
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r0, _LIT1
    mov r1, #0x20
    mov r2, #0x2
    bl func_02001cec
    ldr r0, _LIT2
    bl func_0202c06c
    mov r6, r0
    bl func_0208de24
    mov r5, r0
    bl func_0208e0e4
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x600
    bl func_02094410
    mov r0, #0x0
    add r1, r5, #0x220
    mov r2, #0x800
    bl func_02094410
    mov r0, r6
    mov r1, #0xc
    bl func_02005488
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r3, r0, #0x80
    mov r0, #0x4
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    mov r1, r6
    add r2, r5, #0x220
    bl func_02004f3c
    bl func_0208e0e4
    add r1, r0, #0x4c0
    ldr r0, _LIT1
    mov r2, #0x11
    mov r3, #0xf
    bl func_02001e74
.L_440:
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
.L_464:
    bl func_0202c8e8
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x64
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    bl func_0202c8e8
    ldr r0, [r0, #0x4]
    cmp r4, r0
    beq .L_4cc
    ldr r1, _LIT3
    add r0, sp, #0x44
    mov r2, r4
    bl func_02091554
    add r1, sp, #0x8
    mov r0, #0x0
    mov r2, #0x3c
    bl Fill32
    add r0, sp, #0xc
    add r1, sp, #0x44
    bl func_020aad04
    mov r2, #0x10000
    mov r1, #0x1000
    add r0, sp, #0x8
    str r2, [sp, #0x2c]
    str r1, [sp, #0x30]
    bl func_02022b20
.L_4cc:
    mov r0, r4
    bl func_0202cc50
    add sp, sp, #0x64
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_02102bb0
_LIT2: .word 0x000003ca
_LIT3: .word data_ov004_02209b9c
