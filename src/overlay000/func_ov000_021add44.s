; func_ov000_021add44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov000_021c75c4
        .extern func_02001cd0
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001d84
        .extern func_02001dc4
        .extern func_02001ddc
        .extern func_02001e94
        .extern func_02005298
        .extern func_02005374
        .extern func_0201d4b4
        .extern func_0201d530
        .extern func_ov000_021adbdc
        .extern func_ov000_021add24
        .global func_ov000_021add44
        .arm
func_ov000_021add44:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    movs r9, r0
    mov r8, r1
    ldr r5, _LIT0
    beq .L_1b8
    ldr r6, [r5, #0x264]
    mov r0, #0x8
    cmp r6, #0x0
    moveq r6, #0x4a0
    cmp r8, #0x0
    movne r7, #0x5
    str r9, [r5, #0x250]
    moveq r7, #0x0
    bl func_0201d530
    ldr r1, [r5, #0x26c]
    mov r4, r0
    mov r0, r1, lsl #0x17
    movs r0, r0, lsr #0x1e
    beq .L_5c
    cmp r0, #0x1
    beq .L_70
    b .L_80
.L_5c:
    add r0, r5, #0x1ac
    mov r1, #0x1c
    mov r2, #0x6
    bl func_02001d0c
    b .L_80
.L_70:
    add r0, r5, #0x1ac
    mov r1, #0x20
    mov r2, #0x6
    bl func_02001d0c
.L_80:
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    add r0, r5, #0x1ac
    mov r1, #0x0
    mov r2, #0xe
    bl func_02001d84
    mov r1, r7
    add r0, r5, #0x1ac
    bl func_02001dc4
    bl func_ov000_021adbdc
    ldr r0, [r5, #0x26c]
    mov r0, r0, lsl #0x17
    movs r0, r0, lsr #0x1e
    beq .L_d0
    cmp r0, #0x1
    beq .L_130
    b .L_198
.L_d0:
    add r0, r5, #0x1ac
    mov r1, #0xf
    mov r2, #0x5
    bl func_02001cd0
    mov r0, #0x1
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r7, _LIT2
    mov r1, r9
    add r0, r5, #0x1ac
    add r2, r6, r4
    mov r3, #0x5
    str r7, [sp, #0x8]
    bl func_02001ddc
    mov r0, #0x8
    bl func_0201d4b4
    add r0, r0, #0x82
    add r1, r0, #0x400
    mov r2, r6, asr #0x5
    add r0, r5, #0x1ac
    mov r3, #0x0
    bl func_02001e94
    b .L_198
.L_130:
    add r0, r5, #0x1ac
    mov r1, #0xf
    mov r2, #0x5
    bl func_02001cd0
    mov r0, r9
    mov r1, #0xc
    mov r2, #0x100
    bl func_ov000_021add24
    mov r1, #0x3
    str r1, [sp]
    mov r1, #0xc
    str r1, [sp, #0x4]
    ldr r2, _LIT3
    mov r3, r0
    str r2, [sp, #0x8]
    mov r1, r9
    add r2, r6, r4
    add r0, r5, #0x1ac
    bl func_02001ddc
    mov r0, #0x8
    bl func_0201d4b4
    add r1, r0, #0x580
    mov r2, r6, asr #0x5
    add r0, r5, #0x1ac
    mov r3, #0x0
    bl func_02001e94
.L_198:
    ldr r0, [r5, #0x270]
    cmp r8, #0x0
    orrne r0, r0, #0x800
    strne r0, [r5, #0x270]
    biceq r0, r0, #0x800
    add sp, sp, #0xc
    streq r0, [r5, #0x270]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_1b8:
    bl func_ov000_021adbdc
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov000_021c75c4
_LIT1: .word data_02104f4c
_LIT2: .word func_02005298
_LIT3: .word func_02005374
