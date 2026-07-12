; func_ov016_021b2a2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov016_021b8ec0
        .extern data_ov016_021b8ee0
        .extern data_ov016_021ba9e4
        .extern func_02001ba8
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0208c79c
        .extern func_0208e138
        .extern func_02094410
        .extern func_0209445c
        .extern func_ov016_021b3550
        .global func_ov016_021b2a2c
        .arm
func_ov016_021b2a2c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    ldr r1, _LIT0
    mov r4, r0
    mov r0, #0x0
    mov r2, #0x9c
    bl func_02094410
    add r0, sp, #0x20
    bl func_0201d428
    ldr r0, _LIT1
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldrh r2, [sp, #0x34]
    str r0, [sp, #0x20]
    ldr r1, [sp, #0x38]
    bic r0, r2, #0xf
    orr r0, r0, #0x3
    strh r0, [sp, #0x34]
    bic r0, r1, #0x1c000
    orr r1, r0, #0xc000
    ldrh r2, [sp, #0x34]
    str r1, [sp, #0x38]
    orr r0, r2, #0x10
    mov r2, #0x5c0
    str r2, [sp, #0x2c]
    mov r2, #0x0
    strh r0, [sp, #0x34]
    add r0, sp, #0x20
    strh r2, [sp, #0x30]
    bl func_0201e564
    ldr r0, [sp, #0x20]
    bl func_02006e00
    ldr r2, _LIT2
    add r0, sp, #0x0
    mov r1, #0x0
    bl func_02001ba8
    ldr r1, _LIT3
    add r0, sp, #0x0
    mov r2, #0x20
    bl func_0209445c
    bl func_0208e138
    mov lr, #0x0
    add ip, r0, #0x14
    mov r2, #0x2
    mov r3, lr
.L_b8:
    mov r5, r3
.L_bc:
    add r0, r2, #0x1
    mov r1, r5, lsl #0x1
    orr r2, r2, #0x2000
    mov r0, r0, lsl #0x10
    add r5, r5, #0x1
    strh r2, [ip, r1]
    cmp r5, #0x16
    mov r2, r0, lsr #0x10
    blt .L_bc
    add lr, lr, #0x1
    cmp lr, #0x2
    add ip, ip, #0x40
    blt .L_b8
    add r0, sp, #0x20
    bl func_0201d428
    ldr r0, _LIT4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldrh r2, [sp, #0x34]
    str r0, [sp, #0x20]
    mov ip, #0x40
    bic r0, r2, #0xf
    orr r0, r0, #0x8
    strh r0, [sp, #0x34]
    ldr r1, [sp, #0x38]
    ldrh r2, [sp, #0x34]
    bic r0, r1, #0x1c000
    orr r1, r0, #0xc000
    orr r3, r2, #0x10
    mov r2, #0x0
    add r0, sp, #0x20
    str ip, [sp, #0x2c]
    strh r3, [sp, #0x34]
    strh r2, [sp, #0x30]
    str r1, [sp, #0x38]
    bl func_0201e564
    ldr r0, [sp, #0x20]
    bl func_02006e00
    ldr r0, _LIT5
    mvn r1, #0xf
    bl func_0208c79c
    ldr r0, _LIT6
    mvn r1, #0xf
    bl func_0208c79c
    mov r3, #0x4000000
    ldr r1, [r3]
    add r2, r3, #0x1000
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1800
    str r1, [r3]
    ldr r1, [r2]
    mov r0, r4
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1800
    str r1, [r2]
    bl func_ov016_021b3550
    mov r0, #0x1
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov016_021ba9e4
_LIT1: .word data_ov016_021b8ec0
_LIT2: .word 0x00007fff
_LIT3: .word 0x05000040
_LIT4: .word data_ov016_021b8ee0
_LIT5: .word 0x0400006c
_LIT6: .word 0x0400106c
