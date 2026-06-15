; func_02001540 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c60
        .extern data_021040ac
        .extern func_02000c4c
        .extern func_02000cc4
        .extern func_02000d4c
        .extern func_02000e34
        .extern func_02000e70
        .extern func_02000f84
        .extern func_0200127c
        .extern func_02001448
        .extern func_02009758
        .extern func_0200a26c
        .extern func_02018b70
        .extern func_02018e88
        .extern func_02019160
        .extern func_0201a32c
        .global func_02001540
        .arm
func_02001540:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_8e0
    blx r0
    cmp r0, #0x0
    beq .L_8d8
    ldr r0, [r4, #0xb64]
    cmp r0, #0x38
    addls pc, pc, r0, lsl #0x2
    b .L_8d4
    b .L_8d4
    b .L_8d4
    b .L_690
    b .L_8d4
    b .L_6e8
    b .L_8d4
    b .L_6e0
    b .L_8d4
    b .L_700
    b .L_8d4
    b .L_71c
    b .L_8d4
    b .L_72c
    b .L_8d4
    b .L_73c
    b .L_8d4
    b .L_74c
    b .L_8d4
    b .L_75c
    b .L_8d4
    b .L_76c
    b .L_8d4
    b .L_77c
    b .L_8d4
    b .L_78c
    b .L_8d4
    b .L_79c
    b .L_8d4
    b .L_7ac
    b .L_8d4
    b .L_7bc
    b .L_8d4
    b .L_7cc
    b .L_8d4
    b .L_7dc
    b .L_8d4
    b .L_844
    b .L_8d4
    b .L_83c
    b .L_8d4
    b .L_8d4
    b .L_8d4
    b .L_84c
    b .L_8d4
    b .L_86c
    b .L_8d4
    b .L_85c
    b .L_8d4
    b .L_888
    b .L_8d4
    b .L_898
    b .L_8d4
    b .L_8a8
    b .L_8d4
    b .L_8b8
    b .L_8d4
    b .L_8c8
.L_690:
    bl func_02000e70
    mov r1, r4
    ldr r0, _LIT0
    ldr r3, [r1, #0x38]
    ldr r2, _LIT2
    str r3, [r0, #0x4]
    mov r3, r3, asr #0x1f
    str r3, [r0, #0x8]
    str r2, [r0, #0xc]
    ldr r3, _LIT3
    ldr r2, _LIT4
    str r3, [r0, #0x10]
    str r2, [r0, #0x14]
    mov r2, #0x0
    str r2, [r0, #0x18]
    str r2, [r1, #0x3c]
    str r2, [r1, #0x40]
    str r2, [r1, #0x44]
    str r2, [r1, #0x48]
    b .L_8d4
.L_6e0:
    bl func_0200127c
    b .L_8d4
.L_6e8:
    bl func_0200127c
    cmp r0, #0x0
    beq .L_8d4
    bl func_02000f84
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_700:
    bl func_02001448
    cmp r0, #0x0
    beq .L_8d4
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_71c:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_72c:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_73c:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_74c:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_75c:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_76c:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_77c:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_78c:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_79c:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_7ac:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_7bc:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_7cc:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_7dc:
    mov r0, #0x21
    bl func_02009758
    mov r0, #0x1
    bl func_02018b70
    mov r0, #0x7
    bl func_0200a26c
    mov r0, #0xa
    bl func_0200a26c
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    mov r0, #0x0
    mov r1, #0xd8000
    mov r2, #0xe4000
    bl func_02018e88
    mov r0, #0x2
    bl func_02019160
    bl func_02000cc4
    mov r0, #0x25
    str r0, [r4, #0xb64]
    b .L_8d4
.L_83c:
    bl func_02000e34
    b .L_8d4
.L_844:
    bl func_02000e34
    b .L_8d4
.L_84c:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_85c:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_86c:
    mov r0, r4
    ldr r0, [r0, #0x3c]
    bl func_0201a32c
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_888:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_898:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_8a8:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_8b8:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
    b .L_8d4
.L_8c8:
    bl func_02000d4c
    sub r0, r0, #0x1
    str r0, [r4, #0xb64]
.L_8d4:
    bl func_02000f84
.L_8d8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_8e0:
    ldr r0, [r4, #0xb64]
    bl func_02000c4c
    ldr r1, _LIT0
    str r0, [r1]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_02102c60
_LIT1: .word data_021040ac
_LIT2: .word 0x6c078965
_LIT3: .word 0x5d588b65
_LIT4: .word 0x00269ec3
