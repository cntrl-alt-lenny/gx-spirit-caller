; func_ov020_021ab4a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02102c90
        .extern data_ov020_021ae040
        .extern data_ov020_021ae060
        .extern data_ov020_021ae070
        .extern data_ov020_021ae084
        .extern func_02001c98
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02004fe8
        .extern func_0207f85c
        .extern func_0207f884
        .extern Vram_GetBankBaseCD
        .extern func_020a978c
        .extern func_ov020_021ab0d8
        .extern func_ov020_021ab708
        .global func_ov020_021ab4a0
        .arm
func_ov020_021ab4a0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r5, r0
    bl Vram_GetBankBaseCD
    mov r4, r0
    ldr r3, _LIT0
    mov r2, #0x12
    ldr r0, _LIT1
    mov r1, #0x1b
    str r2, [r3, #0x8d8]
    bl func_02001d0c
    mov r0, #0x0
    bl func_02001d68
    mov r0, #0xf
    mov r1, #0x1
    bl func_02001c98
    cmp r5, #0x0
    bge .L_7c
    ldr r0, _LIT2
    bl func_0207f884
    ldr r0, _LIT3
    bl func_0207f85c
    mov r0, #0x0
    mov r2, r0
    mov r3, r0
    mov r1, #0x2
    bl func_ov020_021ab708
    mov r0, #0x0
    bl func_ov020_021ab0d8
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
.L_7c:
    add r1, sp, #0x8
    cmp r5, #0xa
    mov r0, #0x0
    mov r2, #0xc
    movge r5, #0x9
    bl Fill32
    ldr r1, _LIT4
    add r0, sp, #0x8
    add r2, r5, #0x1
    bl func_020a978c
    ldr r3, _LIT5
    mov ip, r5, lsl #0x1
    mov r0, r5, lsr #0x1f
    smull r1, lr, r3, r5
    add lr, r0, lr, asr #0x1
    add r2, r4, #0xaa0
    smull r0, r4, r3, ip
    mov r0, ip, lsr #0x1f
    mov r3, #0x5
    add r4, r0, r4, asr #0x2
    smull r0, r1, r3, lr
    sub lr, r5, r0
    mov r0, #0x1c
    mul r0, lr, r0
    add r0, r0, #0x8
    str r0, [sp]
    mov r0, #0x6c
    mul r1, r4, r0
    mov r0, #0xe
    str r0, [sp, #0x4]
    add r3, r1, #0x1
    ldr r0, _LIT1
    add r1, sp, #0x8
    bl func_02004fe8
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_ov020_021ae060
_LIT1: .word data_02102c90
_LIT2: .word data_ov020_021ae084
_LIT3: .word data_ov020_021ae070
_LIT4: .word data_ov020_021ae040
_LIT5: .word 0x66666667
