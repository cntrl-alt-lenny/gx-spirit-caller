; func_ov011_021cbc1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d4000
        .extern data_ov011_021d403c
        .extern data_ov011_021d426c
        .extern func_02018b48
        .extern func_02036590
        .extern func_02037208
        .extern func_02037be4
        .extern func_020380dc
        .extern func_0208c66c
        .extern func_ov011_021cf2dc
        .extern func_ov011_021d0cac
        .extern func_ov011_021d0ffc
        .extern func_ov011_021d1080
        .extern func_ov011_021d1230
        .extern func_ov011_021d129c
        .global func_ov011_021cbc1c
        .arm
func_ov011_021cbc1c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    add r2, sp, #0x8
    ldmia r0, {r0, r1}
    ldr r5, _LIT1
    bl func_ov011_021d0cac
    mov r4, r0
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_1f0
    add r1, sp, #0x4
    add r2, sp, #0x0
    bl func_ov011_021d1080
    ldr r3, [sp]
    ldr r0, [r5, #0x234]
    ldr r2, [sp, #0x4]
    ldr r1, [r5, #0x230]
    sub r0, r3, r0
    sub r1, r2, r1
    bl func_0208c66c
    mov r2, #0x10000
    rsb r2, r2, #0x0
    ldr ip, [r5, #0x248]
    mov r1, r0, lsl #0x10
    and ip, ip, r2
    orr r1, ip, r1, lsr #0x10
    mov r3, r2, lsr #0x16
    ldr ip, [r5, #0x258]
    add r2, r2, #0xfc00
    and ip, ip, r2
    and r2, r3, r4, asr #0xc
    orr r2, ip, r2
    ldr r0, [sp, #0x8]
    bic r3, r2, #0x3fc00
    mov r2, r0, lsl #0x18
    orr r2, r3, r2, lsr #0xe
    str r1, [r5, #0x248]
    str r2, [r5, #0x258]
    bl func_ov011_021d0ffc
    cmp r0, #0x1
    bne .L_d4
    ldr r0, [r5, #0x270]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    ldr r0, [r5, #0x240]
    biceq r0, r0, #0x7
    streq r0, [r5, #0x240]
    beq .L_1f0
    bic r0, r0, #0x7
    orr r0, r0, #0x3
    str r0, [r5, #0x240]
    b .L_1f0
.L_d4:
    ldr r0, [sp, #0x8]
    bl func_ov011_021d129c
    cmp r0, #0x0
    beq .L_114
    ldr r0, [r5, #0x258]
    mov r0, r0, lsl #0x16
    mov r0, r0, lsr #0x16
    cmp r0, #0x19
    ldr r0, [r5, #0x240]
    bichi r0, r0, #0x7
    strhi r0, [r5, #0x240]
    bhi .L_1f0
    bic r0, r0, #0x7
    orr r0, r0, #0x3
    str r0, [r5, #0x240]
    b .L_1f0
.L_114:
    ldr r1, [r5, #0x240]
    ldr r0, [r5, #0x258]
    bic r1, r1, #0x7
    mov r0, r0, lsl #0x16
    orr r2, r1, #0x3
    mov r0, r0, lsr #0x16
    str r2, [r5, #0x240]
    cmp r0, #0x64
    bls .L_154
    ldr r1, [r5, #0x25c]
    ldr r0, _LIT2
    bic r2, r2, #0x7
    and r0, r1, r0
    str r2, [r5, #0x240]
    str r0, [r5, #0x25c]
    b .L_1f0
.L_154:
    cmp r0, #0x32
    bls .L_17c
    ldr r1, [r5, #0x25c]
    ldr r0, _LIT2
    bic r2, r2, #0x7
    orr r2, r2, #0x1
    and r0, r1, r0
    str r2, [r5, #0x240]
    str r0, [r5, #0x25c]
    b .L_1f0
.L_17c:
    cmp r0, #0x19
    ldr r0, _LIT2
    bls .L_1a4
    ldr r1, [r5, #0x25c]
    bic r2, r2, #0x7
    orr r2, r2, #0x2
    and r0, r1, r0
    str r2, [r5, #0x240]
    str r0, [r5, #0x25c]
    b .L_1f0
.L_1a4:
    ldr r2, [r5, #0x25c]
    mov r1, r2, lsl #0x11
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    and r2, r2, r0
    mov r0, r1, lsl #0x18
    orr r1, r2, r0, lsr #0x11
    mov r0, r1, lsl #0x11
    mov r0, r0, lsr #0x18
    str r1, [r5, #0x25c]
    cmp r0, #0x1e
    bcc .L_1f0
    ldr r0, [sp, #0x8]
    mov r1, #0x1
    bl func_ov011_021d1230
    ldr r1, [r5, #0x25c]
    ldr r0, _LIT2
    and r0, r1, r0
    str r0, [r5, #0x25c]
.L_1f0:
    ldr r0, [r5, #0x240]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_2f0
    b .L_2b8
    b .L_218
    b .L_218
    b .L_2b8
.L_218:
    ldr r0, [r5, #0x278]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, pc}
    bl func_02018b48
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, pc}
    bl func_ov011_021cf2dc
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, pc}
    mov r0, #0x86
    bl func_02037be4
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, pc}
    mov r0, #0x86
    sub r1, r0, #0x87
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r1, [r5, #0x258]
    ldr r0, _LIT3
    mov r1, r1, lsl #0x16
    mov r1, r1, lsr #0x16
    mov r1, r1, lsl #0xa
    umull r0, r2, r1, r0
    mov r2, r2, lsr #0x5
    rsb r1, r2, #0x400
    mov r0, #0x86
    mov r2, #0x1
    mov r3, #0x0
    bl func_020380dc
    ldr r0, [r5, #0x240]
    add sp, sp, #0xc
    orr r0, r0, #0x40
    str r0, [r5, #0x240]
    ldmia sp!, {r4, r5, pc}
.L_2b8:
    ldr r0, _LIT4
    ldr r4, _LIT1
    ldr r0, [r0, #0x27c]
    mov r0, r0, lsl #0x19
    movs r0, r0, lsr #0x1f
    beq .L_2e8
    mov r0, #0x86
    mov r1, #0x0
    bl func_02036590
    ldr r0, [r4, #0x240]
    bic r0, r0, #0x40
    str r0, [r4, #0x240]
.L_2e8:
    mov r0, #0x0
    str r0, [r4, #0x244]
.L_2f0:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_ov011_021d426c
_LIT1: .word data_ov011_021d403c
_LIT2: .word 0xffff807f
_LIT3: .word 0x51eb851f
_LIT4: .word data_ov011_021d4000
