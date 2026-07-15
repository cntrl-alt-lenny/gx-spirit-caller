; func_ov017_021b670c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4634
        .extern data_02102bb0
        .extern data_02104e6c
        .extern data_021058a9
        .extern data_0210596d
        .extern data_ov017_021b8128
        .extern data_ov017_021b8138
        .extern data_ov017_021b8154
        .extern data_ov017_021b8170
        .extern data_ov017_021b8190
        .extern data_ov017_021b81b0
        .extern data_ov017_021b81d0
        .extern data_ov017_021b81f0
        .extern data_ov017_021b8210
        .extern data_ov017_021b8230
        .extern data_ov017_021b8250
        .extern data_ov017_021b867c
        .extern func_02001ba8
        .extern func_02001cec
        .extern func_02001d48
        .extern func_0200506c
        .extern func_02005488
        .extern func_020057e4
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0201e78c
        .extern func_0201ef3c
        .extern func_0202c06c
        .extern func_0208de24
        .extern func_0208de78
        .extern func_0208e0e4
        .extern func_0208e138
        .extern func_02091554
        .extern func_0209372c
        .extern func_0209445c
        .extern func_ov017_021b6674
        .extern func_ov017_021b72a8
        .extern func_ov017_021b7390
        .extern func_ov017_021b7478
        .extern func_ov017_021b758c
        .global func_ov017_021b670c
        .arm
func_ov017_021b670c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x60
    mov r4, r0
    ldr r0, _LIT0
    mov r1, #0x8
    mov r2, #0x2
    bl func_02001cec
    ldr r0, _LIT1
    bl func_0202c06c
    mov r6, r0
    bl func_0208de78
    mov r3, #0x2
    add r2, r0, #0x2580
    str r3, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, r6
    bl func_0200506c
    mov r6, #0x12c
    bl func_0208e138
    mov ip, #0x0
    add r9, r0, #0x28
    mov r3, ip
.L_60:
    mov sl, r3
.L_64:
    add r0, r6, #0x1
    mov r1, sl, lsl #0x1
    orr r2, r6, #0x2000
    mov r0, r0, lsl #0x10
    add sl, sl, #0x1
    strh r2, [r9, r1]
    cmp sl, #0x8
    mov r6, r0, lsr #0x10
    blt .L_64
    add ip, ip, #0x1
    cmp ip, #0x2
    add r9, r9, #0x40
    blt .L_60
    ldr r2, _LIT2
    add r0, sp, #0x18
    mov r1, #0x0
    bl func_02001ba8
    ldr r1, _LIT3
    add r0, sp, #0x18
    mov r2, #0x20
    bl func_0209445c
    add r0, sp, #0x38
    bl func_0201d428
    ldr r0, _LIT4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x38]
    mov r0, #0x6c00
    ldrh r1, [sp, #0x4c]
    str r0, [sp, #0x44]
    bic r0, r1, #0xf
    orr r0, r0, #0x2
    strh r0, [sp, #0x4c]
    mov r0, #0x200
    ldrh r1, [sp, #0x4c]
    strh r0, [sp, #0x48]
    orr r0, r1, #0x10
    ldr r1, [sp, #0x50]
    strh r0, [sp, #0x4c]
    bic r1, r1, #0x1c000
    orr r1, r1, #0x8000
    bic r1, r1, #0x7f
    orr r1, r1, #0xd
    bic r1, r1, #0x3f80
    orr r1, r1, #0x180
    add r0, sp, #0x38
    str r1, [sp, #0x50]
    bl func_0201e564
    ldr r1, [sp, #0x50]
    ldrh r2, [sp, #0x4e]
    bic r1, r1, #0x1c000
    orr r1, r1, #0x1c000
    bic r1, r1, #0x3f80
    orr r1, r1, #0x400
    orr r2, r2, #0x8000
    add r0, sp, #0x38
    str r1, [sp, #0x50]
    strh r2, [sp, #0x4e]
    bl func_0201e564
    ldr r1, [sp, #0x50]
    add r0, sp, #0x38
    bic r1, r1, #0x3f80
    orr r1, r1, #0x680
    str r1, [sp, #0x50]
    bl func_0201e564
    ldr r0, [sp, #0x38]
    bl func_02006e00
    mov r6, #0x0
.L_178:
    cmp r6, #0x0
    beq .L_19c
    cmp r6, #0x1
    beq .L_1ac
    cmp r6, #0x2
    ldreq r7, _LIT5
    moveq r8, #0xc
    moveq r5, #0x1a
    b .L_1b8
.L_19c:
    mov r7, #0x6f
    mov r8, #0xa
    mov r5, #0x2
    b .L_1b8
.L_1ac:
    ldr r7, _LIT6
    mov r8, #0xb
    mov r5, #0xe
.L_1b8:
    bl func_0208e0e4
    add r9, r0, r7, lsl #0x1
    ldr r0, _LIT0
    mov r1, #0x6
    mov r2, #0x2
    bl func_02001cec
    add r0, r8, #0xc2
    add r0, r0, #0x600
    bl func_0202c06c
    mov sl, r0
    bl func_0208de24
    add r2, r0, r5, lsl #0x5
    mov r0, #0x3
    str r0, [sp]
    mov r0, #0xa
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, sl
    mov r3, #0x2
    bl func_0200506c
    mov r1, #0x0
    mov sl, r5
    mov lr, r1
.L_214:
    mov r0, lr
.L_218:
    add r2, sl, #0x1
    mov r3, r0, lsl #0x1
    orr ip, sl, #0x1000
    mov r2, r2, lsl #0x10
    add r0, r0, #0x1
    strh ip, [r9, r3]
    cmp r0, #0x6
    mov sl, r2, lsr #0x10
    blt .L_218
    add r1, r1, #0x1
    cmp r1, #0x2
    add r9, r9, #0x40
    blt .L_214
    add r6, r6, #0x1
    cmp r6, #0x3
    blt .L_178
    ldr r0, _LIT7
    mov r1, #0x5000000
    mov r2, #0x20
    bl func_0209445c
    ldr r0, _LIT7
    ldr r1, _LIT8
    mov r2, #0x20
    bl func_0209445c
    ldr r1, _LIT9
    add r0, sp, #0x18
    mov r2, #0x0
    bl func_02001ba8
    ldr r1, _LIT10
    add r0, sp, #0x18
    mov r2, #0x20
    bl func_0209445c
    bl func_0208e0e4
    add r5, r0, #0x160
    ldr r0, _LIT11
    ldrb r0, [r0, #0xa3c]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r0, _LIT0
    mov r1, #0x10
    mov r2, #0x2
    bl func_02001cec
    bl func_0208de24
    add r2, r0, #0x4c0
    mov r0, #0x1
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    ldr r1, _LIT12
    mov r3, #0x2
    bl func_0200506c
    mov r7, #0x0
    mov r3, #0x26
    mov r2, r7
.L_2f8:
    mov r6, r2
.L_2fc:
    add r0, r3, #0x1
    mov r1, r6, lsl #0x1
    add r6, r6, #0x1
    mov r0, r0, lsl #0x10
    strh r3, [r5, r1]
    cmp r6, #0x10
    mov r3, r0, lsr #0x10
    blt .L_2fc
    add r7, r7, #0x1
    cmp r7, #0x2
    add r5, r5, #0x40
    blt .L_2f8
    mov r5, #0x0
    bl func_0208e0e4
    add r0, r0, #0x9a
    ldr r1, _LIT11
    add r6, r0, #0x200
    ldrb r0, [r1, #0xb00]
    bl func_02001d48
    ldr r0, _LIT0
    mov r1, #0x14
    mov r2, #0x2
    bl func_02001cec
    ldr r0, _LIT13
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0x90
    cmp r0, #0x14
    addge r5, r5, #0x14
    addlt r5, r5, r0
    bl func_0208de24
    mov r3, r0
    mov r2, #0x1
    str r2, [sp]
    mov r7, #0xc
    add r2, r3, #0x8c0
    ldr r0, _LIT0
    ldr r1, _LIT13
    add r3, r5, #0x6
    str r7, [sp, #0x4]
    bl func_0200506c
    mov r7, #0x0
    mov r3, #0x46
    mov r2, r7
.L_3ac:
    mov r5, r2
.L_3b0:
    add r0, r3, #0x1
    mov r1, r5, lsl #0x1
    add r5, r5, #0x1
    mov r0, r0, lsl #0x10
    strh r3, [r6, r1]
    cmp r5, #0x14
    mov r3, r0, lsr #0x10
    blt .L_3b0
    add r7, r7, #0x1
    cmp r7, #0x2
    add r6, r6, #0x40
    blt .L_3ac
    add r0, sp, #0x38
    bl func_0201d428
    ldr r0, _LIT14
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldrh r2, [sp, #0x4c]
    mov r6, #0x40
    ldr r1, [sp, #0x50]
    bic r2, r2, #0xf
    orr r2, r2, #0x2
    strh r2, [sp, #0x4c]
    ldrh r2, [sp, #0x4c]
    str r0, [sp, #0x38]
    bic r0, r1, #0x1c000
    orr r5, r2, #0x10
    orr r3, r0, #0x8000
    sub r1, r6, #0x41
    mov r2, #0x400
    add r0, sp, #0x38
    str r6, [sp, #0x44]
    strh r5, [sp, #0x4c]
    str r3, [sp, #0x50]
    strh r2, [sp, #0x48]
    str r1, [sp, #0x40]
    bl func_0201e564
    ldr r0, [sp, #0x38]
    bl func_02006e00
    ldr r1, _LIT11
    ldr r0, _LIT15
    ldr r7, [r1, #0xa64]
    mov r6, #0x0
    str r6, [r0, #0x8]
    str r6, [r0, #0x4]
    str r6, [r0]
    and r5, r7, #0x3e0
    and r6, r7, #0x1f
    and r3, r7, #0x7c00
    and r2, r7, #0xf8000
    and r1, r7, #0x7e000000
    strb r6, [r4, #0x1cc]
    mov r5, r5, lsr #0x5
    strb r5, [r4, #0x1cd]
    mov r3, r3, lsr #0xa
    strb r3, [r4, #0x1ce]
    mov r2, r2, lsr #0xf
    and r0, r7, #0x1f00000
    strb r2, [r4, #0x1cf]
    mov r1, r1, lsr #0x19
    str r1, [r4, #0x1d4]
    mov r1, r0, lsr #0x14
    add r0, r4, #0x100
    strh r1, [r0, #0xd0]
    bl func_0208e0e4
    ldr r1, _LIT11
    add r0, r0, #0xda
    ldr r1, [r1, #0x4]
    add r5, r0, #0x300
    mov r0, r1, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    mov r0, r4
    bl func_ov017_021b758c
    mov r7, #0x0
    mov r3, #0x6e
    mov r2, r7
.L_4e8:
    mov r6, r2
.L_4ec:
    add r0, r3, #0x1
    mov r1, r6, lsl #0x1
    add r6, r6, #0x1
    mov r0, r0, lsl #0x10
    strh r3, [r5, r1]
    cmp r6, #0x14
    mov r3, r0, lsr #0x10
    blt .L_4ec
    add r7, r7, #0x1
    cmp r7, #0x2
    add r5, r5, #0x40
    blt .L_4e8
    ldr r0, _LIT16
    ldrb r2, [r4, #0x1cc]
    ldr r0, [r0]
    ldr r1, _LIT17
    bl func_02091554
    ldr r0, _LIT16
    ldrb r2, [r4, #0x1cc]
    ldr r0, [r0, #0x4]
    ldr r1, _LIT18
    bl func_02091554
    ldr r0, _LIT16
    ldrb r2, [r4, #0x1cc]
    ldr r0, [r0, #0x8]
    ldr r1, _LIT19
    bl func_02091554
    ldr r0, _LIT16
    ldr r1, _LIT20
    ldr r0, [r0, #0xc]
    ldrb r2, [r4, #0x1cc]
    bl func_02091554
    bl func_0201e78c
    bl func_0209372c
    mov r3, #0x0
    str r3, [sp]
    mov r2, #0x1
    str r2, [sp, #0x4]
    ldr r1, _LIT21
    mov r0, #0x200
    str r1, [sp, #0x8]
    str r2, [sp, #0xc]
    str r0, [sp, #0x10]
    add r0, r4, #0x54
    str r0, [sp, #0x14]
    mov r0, r4
    add r1, r4, #0x4
    add r2, r4, #0x8
    bl func_0201ef3c
    ldr r0, _LIT16
    ldr r1, _LIT22
    ldr r0, [r0]
    ldrb r2, [r4, #0x1cd]
    bl func_02091554
    ldr r0, _LIT16
    ldr r1, _LIT23
    ldr r0, [r0, #0x4]
    ldrb r2, [r4, #0x1cd]
    bl func_02091554
    ldr r0, _LIT16
    ldr r1, _LIT24
    ldr r0, [r0, #0x8]
    ldrb r2, [r4, #0x1cd]
    bl func_02091554
    ldr r0, _LIT16
    ldr r1, _LIT25
    ldr r0, [r0, #0xc]
    ldrb r2, [r4, #0x1cd]
    bl func_02091554
    bl func_0201e78c
    bl func_0209372c
    mov r3, #0x200
    str r3, [sp]
    mov r2, #0x1
    str r2, [sp, #0x4]
    ldr r1, _LIT21
    add r0, r4, #0xb0
    str r1, [sp, #0x8]
    str r2, [sp, #0xc]
    str r3, [sp, #0x10]
    str r0, [sp, #0x14]
    add r0, r4, #0x5c
    add r1, r4, #0x60
    add r2, r4, #0x64
    mov r3, #0x6000
    bl func_0201ef3c
    ldr r1, _LIT21
    mov r0, r4
    bl func_ov017_021b72a8
    ldr r1, _LIT21
    mov r0, r4
    bl func_ov017_021b7390
    ldr r1, _LIT21
    mov r0, r4
    bl func_ov017_021b7478
    mov r1, #0x50
    str r1, [r4, #0x1e4]
    str r1, [r4, #0x1dc]
    mov r1, #0x60
    mov r0, #0x18
    str r1, [r4, #0x1e0]
    str r0, [r4, #0x1f4]
    str r0, [r4, #0x1ec]
    mov r0, #0x40
    str r0, [r4, #0x1f0]
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x17
    orr r1, r1, r0, lsl #0x8
    ldr r0, _LIT26
    str r1, [r2]
    bl func_020057e4
    mov r0, #0x1
    add sp, sp, #0x60
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_02102bb0
_LIT1: .word 0x000006c3
_LIT2: .word 0x00007fff
_LIT3: .word 0x05000040
_LIT4: .word data_ov017_021b8138
_LIT5: .word 0x000001af
_LIT6: .word 0x0000010f
_LIT7: .word data_020b4634
_LIT8: .word 0x05000060
_LIT9: .word 0x000003ff
_LIT10: .word 0x05000020
_LIT11: .word data_02104e6c
_LIT12: .word data_021058a9
_LIT13: .word data_0210596d
_LIT14: .word data_ov017_021b8154
_LIT15: .word data_ov017_021b867c
_LIT16: .word data_ov017_021b8128
_LIT17: .word data_ov017_021b8170
_LIT18: .word data_ov017_021b8190
_LIT19: .word data_ov017_021b81b0
_LIT20: .word data_ov017_021b81d0
_LIT21: .word data_ov017_021b8128
_LIT22: .word data_ov017_021b81f0
_LIT23: .word data_ov017_021b8210
_LIT24: .word data_ov017_021b8230
_LIT25: .word data_ov017_021b8250
_LIT26: .word func_ov017_021b6674
