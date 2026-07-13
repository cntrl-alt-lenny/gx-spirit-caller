; func_ov014_021b2eb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4634
        .extern data_02102bb0
        .extern data_ov014_021b4b08
        .extern data_ov014_021b4c90
        .extern data_ov014_021b4ca4
        .extern data_ov014_021b4cc0
        .extern data_ov014_021b4ce0
        .extern data_ov014_021b4cfc
        .extern data_ov014_021b4d18
        .extern func_02001cec
        .extern func_02004f3c
        .extern func_02005488
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0201e78c
        .extern func_0201ef3c
        .extern func_0202c06c
        .extern func_0208dd64
        .extern func_0208dfb8
        .extern func_02094410
        .extern func_0209445c
        .extern func_ov014_021b3838
        .global func_ov014_021b2eb8
        .arm
func_ov014_021b2eb8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x50
    mov r5, r0
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldrh r1, [sp, #0x3c]
    mov r3, #0x0
    str r0, [sp, #0x28]
    bic r0, r1, #0xf
    orr r0, r0, #0x8
    strh r0, [sp, #0x3c]
    ldrh r2, [sp, #0x3c]
    mov r1, #0x20
    add r0, sp, #0x28
    bic r2, r2, #0x10
    str r3, [sp, #0x34]
    strh r2, [sp, #0x3c]
    strh r1, [sp, #0x38]
    str r3, [sp, #0x30]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    bl func_0208dfb8
    mov ip, #0x0
    add r3, r0, #0x42
    mov r4, #0x14
    mov r2, ip
.L_7c:
    mov lr, r2
.L_80:
    add r0, r4, #0x1
    mov r1, lr, lsl #0x1
    add lr, lr, #0x1
    mov r0, r0, lsl #0x10
    strh r4, [r3, r1]
    cmp lr, #0x14
    mov r4, r0, lsr #0x10
    blt .L_80
    add ip, ip, #0x1
    cmp ip, #0x5
    add r3, r3, #0x40
    blt .L_7c
    bl func_0208dd64
    mov r4, r0
    add r1, r4, #0x280
    mov r0, #0x0
    mov r2, #0xc80
    bl func_02094410
    ldr r0, _LIT1
    mov r1, #0x14
    mov r2, #0x5
    bl func_02001cec
    ldr r0, _LIT2
    bl func_0202c06c
    mov r1, r0
    mov r3, #0x4
    str r3, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    add r2, r4, #0x280
    bl func_02004f3c
    ldrsb r0, [r5, #0xc]
    cmp r0, #0x0
    beq .L_144
    add r0, r5, #0xc
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0xa0
    add r3, r0, r0, lsr #0x1f
    mov r1, #0x14
    str r1, [sp]
    mov ip, #0xc
    ldr r0, _LIT1
    add r1, r5, #0xc
    add r2, r4, #0x280
    mov r3, r3, asr #0x1
    str ip, [sp, #0x4]
    bl func_02004f3c
.L_144:
    bl func_0208dfb8
    add r0, r0, #0xc2
    mov r3, #0x0
    add ip, r0, #0x100
    mov lr, #0x78
    mov r2, r3
.L_15c:
    mov r4, r2
.L_160:
    add r0, lr, #0x1
    mov r1, r4, lsl #0x1
    add r4, r4, #0x1
    mov r0, r0, lsl #0x10
    strh lr, [ip, r1]
    cmp r4, #0x14
    mov lr, r0, lsr #0x10
    blt .L_160
    add r3, r3, #0x1
    cmp r3, #0x5
    add ip, ip, #0x40
    blt .L_15c
    mov r0, r5
    mov r1, #0x0
    bl func_ov014_021b3838
    bl func_0208dfb8
    add r0, r0, #0x42
    mov r3, #0x0
    add ip, r0, #0x300
    mov lr, #0xdc
    mov r2, r3
.L_1b4:
    mov r4, r2
.L_1b8:
    add r0, lr, #0x1
    mov r1, r4, lsl #0x1
    add r4, r4, #0x1
    mov r0, r0, lsl #0x10
    strh lr, [ip, r1]
    cmp r4, #0x14
    mov lr, r0, lsr #0x10
    blt .L_1b8
    add r3, r3, #0x1
    cmp r3, #0x5
    add ip, ip, #0x40
    blt .L_1b4
    mov r0, r5
    mov r1, #0x1
    bl func_ov014_021b3838
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT3
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r2, #0x40
    sub r1, r2, #0x41
    ldrh r3, [sp, #0x3c]
    str r0, [sp, #0x28]
    strh r2, [sp, #0x38]
    bic r0, r3, #0xf
    orr r0, r0, #0x6
    strh r0, [sp, #0x3c]
    mov r3, #0x2800
    ldrh r0, [sp, #0x3c]
    str r3, [sp, #0x34]
    str r1, [sp, #0x30]
    bic r3, r0, #0x10
    add r0, sp, #0x28
    strh r3, [sp, #0x3c]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x28]
    mov r0, #0x3000
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x3c]
    mov r0, #0x20
    ldrh r1, [sp, #0x3c]
    strh r0, [sp, #0x38]
    bic r0, r1, #0x10
    strh r0, [sp, #0x3c]
    add r0, sp, #0x28
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    ldr r0, _LIT5
    ldr r1, _LIT6
    mov r2, #0x20
    bl func_0209445c
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT7
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x28]
    ldrh r0, [sp, #0x3c]
    mov r1, #0x0
    str r1, [sp, #0x34]
    bic r0, r0, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x3c]
    ldrh r0, [sp, #0x3c]
    bic r0, r0, #0x10
    strh r0, [sp, #0x3c]
    add r0, sp, #0x28
    strh r1, [sp, #0x38]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT8
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x28]
    mov r0, #0x1000
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x3c]
    mvn r0, #0x0
    ldrh r1, [sp, #0x3c]
    strh r0, [sp, #0x38]
    bic r0, r1, #0x10
    strh r0, [sp, #0x3c]
    add r0, sp, #0x28
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT9
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x28]
    mov r0, #0x1800
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x3c]
    mvn r0, #0x0
    ldrh r1, [sp, #0x3c]
    strh r0, [sp, #0x38]
    bic r0, r1, #0x10
    strh r0, [sp, #0x3c]
    add r0, sp, #0x28
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    ldr r0, _LIT10
    add r4, sp, #0x18
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    bl func_0201e78c
    mov r0, #0x0
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r1, r4
    str r1, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r0, #0x200
    str r0, [sp, #0x10]
    add r0, r5, #0x44
    str r0, [sp, #0x14]
    add r0, r5, #0x38
    add r1, r5, #0x3c
    add r2, r5, #0x40
    mov r3, #0x3c00
    bl func_0201ef3c
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x10
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    add r2, r2, #0x1000
    ldr r1, [r2]
    mov r0, #0x1
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1c00
    str r1, [r2]
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov014_021b4c90
_LIT1: .word data_02102bb0
_LIT2: .word 0x000006a5
_LIT3: .word data_ov014_021b4ca4
_LIT4: .word data_ov014_021b4cc0
_LIT5: .word data_020b4634
_LIT6: .word 0x05000460
_LIT7: .word data_ov014_021b4ce0
_LIT8: .word data_ov014_021b4cfc
_LIT9: .word data_ov014_021b4d18
_LIT10: .word data_ov014_021b4b08
