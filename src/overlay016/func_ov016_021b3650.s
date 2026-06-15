; func_ov016_021b3650 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4728
        .extern data_02102c90
        .extern data_ov016_021b8de8
        .extern data_ov016_021b9064
        .extern data_ov016_021b9084
        .extern func_02001bc8
        .extern func_02001d0c
        .extern func_02005088
        .extern func_020054a4
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0202c0c0
        .extern func_0208df60
        .extern func_0208e1cc
        .extern func_02094504
        .extern func_02094550
        .extern func_ov016_021b296c
        .extern func_ov016_021b398c
        .extern func_ov016_021b39e4
        .global func_ov016_021b3650
        .arm
func_ov016_021b3650:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x860
    mov r4, r0
    bl func_0208df60
    add r1, r0, #0x40
    mov r0, #0x0
    mov r2, #0x580
    bl func_02094504
    ldr r0, _LIT0
    mov r1, #0x16
    mov r2, #0x2
    bl func_02001d0c
    ldr r0, _LIT1
    bl func_0202c0c0
    mov r6, r0
    bl func_0208df60
    mov r5, r0
    ldr r0, _LIT1
    bl func_0202c0c0
    mov r1, #0xc
    bl func_020054a4
    rsb r0, r0, #0xb0
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r3, r0, #0x1
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, r6
    add r2, r5, #0x40
    bl func_02005088
    ldr r2, _LIT2
    add r0, sp, #0x38
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r1, r1, #0x304
    orr r1, r1, #0x4000
    strh r1, [r2]
    bl func_0201d47c
    ldr r0, _LIT3
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x38]
    mov r0, #0x1ec0
    ldrh r1, [sp, #0x4c]
    str r0, [sp, #0x44]
    bic r0, r1, #0xf
    orr r0, r0, #0x2
    strh r0, [sp, #0x4c]
    mov r0, #0x60
    strh r0, [sp, #0x48]
    add r0, sp, #0x38
    bl func_0201e5b8
    ldr r0, [sp, #0x38]
    bl func_02006e1c
    bl func_0208e1cc
    add r0, r0, #0x82
    add r5, r0, #0x100
    ldr r0, _LIT4
    mov r1, #0x5000000
    mov r2, #0x20
    ldr r6, _LIT5
    bl func_02094550
    mov r3, #0x0
    mov r2, r3
.L_110:
    mov ip, r2
.L_114:
    add r0, r6, #0x1
    mov r1, ip, lsl #0x1
    add ip, ip, #0x1
    mov r0, r0, lsl #0x10
    strh r6, [r5, r1]
    cmp ip, #0x1e
    mov r6, r0, lsr #0x10
    blt .L_114
    add r3, r3, #0x1
    cmp r3, #0xe
    add r5, r5, #0x40
    blt .L_110
    mvn r1, #0x0
    mov r0, r4
    str r1, [r4, #0x10]
    bl func_ov016_021b39e4
    ldr r2, _LIT6
    add r0, sp, #0x38
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r1, r1, #0x184
    orr r1, r1, #0x400
    strh r1, [r2]
    bl func_0201d47c
    ldr r0, _LIT7
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x38]
    mov r0, #0x5700
    ldrh r1, [sp, #0x4c]
    str r0, [sp, #0x44]
    bic r0, r1, #0xf
    orr r0, r0, #0x7
    strh r0, [sp, #0x4c]
    mov r0, #0x200
    ldrh r1, [sp, #0x4c]
    strh r0, [sp, #0x48]
    orr r0, r1, #0x10
    ldr r1, [sp, #0x50]
    strh r0, [sp, #0x4c]
    bic r1, r1, #0x1c000
    orr r1, r1, #0x8000
    add r0, sp, #0x38
    str r1, [sp, #0x50]
    bl func_0201e5b8
    ldr r0, [sp, #0x38]
    bl func_02006e1c
    ldr r0, _LIT8
    add ip, sp, #0x8
    ldmia r0, {r0, r1, r2, r3}
    stmia ip, {r0, r1, r2, r3}
    mov r0, r4
    mov r1, ip
    bl func_ov016_021b398c
    mov r0, #0x6b0
    bl func_0202c0c0
    mov r2, r0
    mov r0, #0x288
    add r1, sp, #0x60
    mov r3, #0x800
    bl func_ov016_021b296c
    ldr r0, _LIT9
    bl func_0202c0c0
    mov r2, r0
    mov r0, #0x298
    add r1, sp, #0x60
    mov r3, #0x800
    bl func_ov016_021b296c
    ldr r0, _LIT1
    bl func_0202c0c0
    mov r2, r0
    mov r0, #0x27c
    add r1, sp, #0x60
    mov r3, #0x600
    bl func_ov016_021b296c
    ldr r1, _LIT10
    ldr r2, _LIT11
    add r0, sp, #0x18
    bl func_02001bc8
    ldr r1, _LIT12
    add r0, sp, #0x18
    mov r2, #0x20
    bl func_02094550
    ldr r1, _LIT10
    ldr r2, _LIT13
    add r0, sp, #0x18
    bl func_02001bc8
    ldr r1, _LIT14
    add r0, sp, #0x18
    mov r2, #0x20
    bl func_02094550
    ldr r1, _LIT10
    ldr r2, _LIT15
    add r0, sp, #0x18
    bl func_02001bc8
    ldr r1, _LIT16
    add r0, sp, #0x18
    mov r2, #0x20
    bl func_02094550
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x7
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    add r2, r2, #0x1000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x14
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    mov r0, #0x1
    add sp, sp, #0x860
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02102c90
_LIT1: .word 0x000006b8
_LIT2: .word 0x0400000c
_LIT3: .word data_ov016_021b9064
_LIT4: .word data_020b4728
_LIT5: .word 0x00000106
_LIT6: .word 0x0400100c
_LIT7: .word data_ov016_021b9084
_LIT8: .word data_ov016_021b8de8
_LIT9: .word 0x000006af
_LIT10: .word 0x000044e1
_LIT11: .word 0x000076f4
_LIT12: .word 0x05000620
_LIT13: .word 0x00007f2a
_LIT14: .word 0x05000640
_LIT15: .word 0x00007a8e
_LIT16: .word 0x05000660
