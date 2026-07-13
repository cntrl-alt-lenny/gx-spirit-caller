; func_ov019_021b4560 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4634
        .extern data_02102bb0
        .extern data_02104e6c
        .extern func_02001ba8
        .extern func_02001cec
        .extern func_0200506c
        .extern func_020057e4
        .extern func_0202c06c
        .extern func_0208de24
        .extern func_0208de78
        .extern func_0208e0e4
        .extern func_0208e138
        .extern func_02094410
        .extern func_0209445c
        .extern func_ov019_021b4460
        .extern func_ov019_021b44fc
        .extern func_ov019_021b4b60
        .extern func_ov019_021b4ec8
        .global func_ov019_021b4560
        .arm
func_ov019_021b4560:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x28
    mov r6, r0
    ldr r0, _LIT0
    mov r1, #0x5000000
    mov r2, #0x20
    bl func_0209445c
    ldr r1, _LIT1
    add r0, sp, #0x8
    mov r2, #0x0
    bl func_02001ba8
    ldr r1, _LIT2
    add r0, sp, #0x8
    mov r2, #0x20
    bl func_0209445c
    ldr r2, _LIT3
    add r0, sp, #0x8
    mov r1, #0x0
    bl func_02001ba8
    ldr r1, _LIT4
    add r0, sp, #0x8
    mov r2, #0x20
    bl func_0209445c
    bl func_0208e138
    mov r5, r0
    ldr r0, _LIT5
    mov r1, #0xe
    mov r2, #0x2
    bl func_02001cec
    bl func_0208de78
    add r1, r0, #0x1340
    mov r0, #0x0
    mov r2, #0x380
    bl func_02094410
    ldr r0, _LIT6
    bl func_0202c06c
    mov r4, r0
    bl func_0208de78
    add r2, r0, #0x1340
    mov r0, #0x1
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT5
    mov r1, r4
    mov r3, #0x2
    bl func_0200506c
    mov r3, #0x2
    add r0, r5, #0x24
    str r3, [sp]
    mov r1, #0x9a
    mov r2, #0xe
    bl func_ov019_021b44fc
    ldr r0, [r6, #0xc0]
    cmp r0, #0x0
    ble .L_310
    bl func_0208e0e4
    mov r5, r0
    ldr r0, _LIT5
    mov r1, #0x6
    mov r2, #0x2
    bl func_02001cec
    bl func_0208de24
    add r1, r0, #0x40
    mov r0, #0x0
    mov r2, #0x180
    bl func_02094410
    ldr r0, _LIT7
    bl func_0202c06c
    mov r4, r0
    bl func_0208de24
    add r2, r0, #0x40
    mov r0, #0x3
    str r0, [sp]
    mov r0, #0xa
    str r0, [sp, #0x4]
    ldr r0, _LIT5
    mov r1, r4
    mov r3, #0x2
    bl func_0200506c
    mov r1, #0x1
    str r1, [sp]
    mov r1, #0x2
    add r0, r5, #0xde
    mov r2, #0x6
    mov r3, r1
    bl func_ov019_021b44fc
    bl func_0208e0e4
    add r4, r0, #0x1e
    ldr r0, _LIT5
    mov r1, #0x6
    mov r2, #0x2
    bl func_02001cec
    bl func_0208de24
    add r1, r0, #0x1c0
    mov r0, #0x0
    mov r2, #0x180
    bl func_02094410
    ldr r0, _LIT8
    bl func_0202c06c
    mov r5, r0
    bl func_0208de24
    add r2, r0, #0x1c0
    mov r0, #0x3
    str r0, [sp]
    mov r0, #0xa
    str r0, [sp, #0x4]
    ldr r0, _LIT5
    mov r1, r5
    mov r3, #0x2
    bl func_0200506c
    mov r1, #0x1
    str r1, [sp]
    add r0, r4, #0x200
    mov r1, #0xe
    mov r2, #0x6
    mov r3, #0x2
    bl func_ov019_021b44fc
    mov r5, #0x2
    bl func_0208e0e4
    mov r4, r0
    ldr r0, _LIT5
    mov r1, #0x6
    mov r2, #0x3
    bl func_02001cec
    bl func_0208de24
    add r1, r0, #0x340
    mov r0, #0x0
    mov r2, #0x240
    bl func_02094410
    ldr r0, _LIT9
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    mov r0, #0x6d0
    addeq r5, r5, #0x8
    bl func_0202c06c
    mov r7, r0
    bl func_0208de24
    mov ip, #0xa
    add r2, r0, #0x340
    str ip, [sp]
    ldr r0, _LIT5
    mov r1, r7
    mov r3, r5
    str ip, [sp, #0x4]
    bl func_0200506c
    mov r1, #0x1
    str r1, [sp]
    add r0, r4, #0x35c
    mov r1, #0x1a
    mov r2, #0x6
    mov r3, #0x3
    bl func_ov019_021b44fc
    bl func_0208e0e4
    add r0, r0, #0x5a
    mov r1, #0x0
    str r1, [sp]
    add r0, r0, #0x100
    mov r1, #0x2c
    mov r2, #0x14
    mov r3, #0x2
    bl func_ov019_021b44fc
    bl func_0208e0e4
    add r0, r0, #0x9a
    mov r1, #0x0
    str r1, [sp]
    add r0, r0, #0x200
    mov r1, #0x54
    mov r2, #0x14
    mov r3, #0x2
    bl func_ov019_021b44fc
    bl func_0208e0e4
    add r0, r0, #0x6a
    mov r1, #0x0
    str r1, [sp]
    add r0, r0, #0x300
    mov r1, #0x7c
    mov r2, #0xa
    mov r3, #0x3
    bl func_ov019_021b44fc
    mov r0, r6
    bl func_ov019_021b4b60
    mov r0, r6
    bl func_ov019_021b4ec8
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x13
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    ldr r0, _LIT10
    bl func_020057e4
.L_310:
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_020b4634
_LIT1: .word 0x000003ff
_LIT2: .word 0x05000020
_LIT3: .word 0x00007fff
_LIT4: .word 0x05000040
_LIT5: .word data_02102bb0
_LIT6: .word 0x000006cf
_LIT7: .word 0x000006cc
_LIT8: .word 0x000006cd
_LIT9: .word data_02104e6c
_LIT10: .word func_ov019_021b4460
