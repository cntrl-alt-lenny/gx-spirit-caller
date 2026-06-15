; func_ov020_021aad10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02102c90
        .extern data_02104f4c
        .extern data_ov020_021ae060
        .extern data_ov020_021ae0a8
        .extern func_02001c98
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02005088
        .extern func_020054a4
        .extern func_0202c0c0
        .extern func_0208df40
        .extern func_020a6afc
        .extern func_020a978c
        .global func_ov020_021aad10
        .arm
func_ov020_021aad10:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    ldr r5, _LIT0
    bl func_0208df40
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
    bl func_0202c0c0
    mov r1, r0
    ldr r2, [r5, #0x8c8]
    add r0, sp, #0x8
    bl func_020a978c
    b .L_64
.L_50:
    ldr r0, _LIT3
    bl func_0202c0c0
    mov r1, r0
    add r0, sp, #0x8
    bl func_020a6afc
.L_64:
    ldr r0, _LIT4
    mov r1, #0x1c
    mov r2, #0x3
    bl func_02001d0c
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r2, _LIT4
    add r0, sp, #0x8
    ldr r3, [r2, #0x20]
    mov r1, #0xe
    bic r3, r3, #0x800000
    str r3, [r2, #0x20]
    bl func_020054a4
    mov r5, r0
    mov r0, #0xf
    mov r1, #0x1
    bl func_02001c98
    rsb r0, r5, #0xe0
    mov r3, r0, asr #0x1
    mov r0, #0x4
    str r0, [sp]
    mov r0, #0xe
    str r0, [sp, #0x4]
    ldr r0, _LIT4
    add r2, r4, #0x20
    add r1, sp, #0x8
    bl func_02005088
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov020_021ae0a8
_LIT1: .word data_ov020_021ae060
_LIT2: .word 0x000006eb
_LIT3: .word 0x000006ec
_LIT4: .word data_02102c90
_LIT5: .word data_02104f4c
