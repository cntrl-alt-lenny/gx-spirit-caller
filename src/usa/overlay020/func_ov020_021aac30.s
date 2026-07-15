; func_ov020_021aac30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02102bb0
        .extern data_02104e6c
        .extern data_ov020_021adf80
        .extern data_ov020_021adfc8
        .extern func_02001c78
        .extern func_02001cec
        .extern func_02001d48
        .extern func_0200506c
        .extern func_02005488
        .extern func_0202c06c
        .extern func_0208de58
        .extern func_020a6a08
        .extern func_020a9698
        .global func_ov020_021aac30
        .arm
func_ov020_021aac30:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    ldr r5, _LIT0
    bl func_0208de58
    mov r4, r0
    add r1, sp, #0x8
    mov r0, #0x0
    mov r2, #0x40
    bl Fill32
    ldr r0, _LIT1
    ldr r0, [r0, #0x910]
    cmp r0, #0xa
    bgt .L_50
    ldr r0, _LIT2
    bl func_0202c06c
    mov r1, r0
    ldr r2, [r5, #0x8c8]
    add r0, sp, #0x8
    bl func_020a9698
    b .L_64
.L_50:
    ldr r0, _LIT3
    bl func_0202c06c
    mov r1, r0
    add r0, sp, #0x8
    bl func_020a6a08
.L_64:
    ldr r0, _LIT4
    mov r1, #0x1c
    mov r2, #0x3
    bl func_02001cec
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r2, _LIT4
    add r0, sp, #0x8
    ldr r3, [r2, #0x20]
    mov r1, #0xe
    bic r3, r3, #0x800000
    str r3, [r2, #0x20]
    bl func_02005488
    mov r5, r0
    mov r0, #0xf
    mov r1, #0x1
    bl func_02001c78
    rsb r0, r5, #0xe0
    mov r3, r0, asr #0x1
    mov r0, #0x4
    str r0, [sp]
    mov r0, #0xe
    str r0, [sp, #0x4]
    ldr r0, _LIT4
    add r2, r4, #0x20
    add r1, sp, #0x8
    bl func_0200506c
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov020_021adfc8
_LIT1: .word data_ov020_021adf80
_LIT2: .word 0x000006eb
_LIT3: .word 0x000006ec
_LIT4: .word data_02102bb0
_LIT5: .word data_02104e6c
