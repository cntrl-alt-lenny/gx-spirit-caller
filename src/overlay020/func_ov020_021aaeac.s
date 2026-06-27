; func_ov020_021aaeac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_02102c90
        .extern data_02104f4c
        .extern data_ov020_021ae0a8
        .extern func_02001c98
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001e40
        .extern func_02004fb8
        .extern func_02004fe8
        .extern Vram_GetBankBaseCD
        .extern func_ov020_021aa4a0
        .extern func_ov020_021aa700
        .global func_ov020_021aaeac
        .arm
func_ov020_021aaeac:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r8, r0
    ldr r4, _LIT0
    bl Vram_GetBankBaseCD
    mov r1, #0x0
    mov r7, r0
    mov r0, r8
    mov r2, r1
    bl func_ov020_021aa700
    add r0, r0, #0x4
    bic r5, r0, #0x3
    mov r0, r5
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r2, r5
    mov r6, r0
    mov r0, #0x0
    mov r1, r6
    bl Fill32
    mov r0, r8
    mov r1, #0x0
    mov r2, r6
    bl func_ov020_021aa700
    mov r0, #0x0
    mov r1, r6
    bl func_ov020_021aa4a0
    add r0, r0, #0x4
    bic r5, r0, #0x3
    mov r0, r5
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r2, r5
    mov r5, r0
    mov r0, #0x0
    mov r1, r5
    bl Fill32
    mov r0, r5
    mov r1, r6
    bl func_ov020_021aa4a0
    ldr r0, _LIT1
    mov r1, #0x1b
    mov r2, #0x100
    bl func_02001d0c
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT1
    mov r3, #0xe
    ldr r2, [r0, #0x20]
    mov r1, r5
    bic r2, r2, #0x800000
    str r2, [r0, #0x20]
    ldr ip, [r0, #0x24]
    mov r2, #0x1
    bic ip, ip, #0xf00
    orr ip, ip, #0x100
    bic ip, ip, #0xf000
    orr ip, ip, #0x1000
    str ip, [r0, #0x24]
    str r3, [sp]
    mov r3, r2
    bl func_02004fb8
    ldr r0, _LIT1
    add r1, sp, #0xc
    add r2, sp, #0x8
    bl func_02001e40
    ldr r0, [sp, #0xc]
    cmp r0, #0x1
    ldrgt r0, [sp, #0x8]
    addgt r0, r0, #0xe
    strgt r0, [sp, #0x8]
    ldr r1, [sp, #0x8]
    ldr r0, _LIT1
    add r1, r1, #0x7
    mov r2, r1, asr #0x3
    mov r1, #0x1b
    str r2, [r4, #0x890]
    bl func_02001d0c
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    mov r0, #0xf
    mov r1, #0x1
    bl func_02001c98
    ldr r0, _LIT1
    mov r3, #0x1
    ldr r4, [r0, #0x24]
    mov r1, #0xe
    bic r4, r4, #0xf00
    bic r4, r4, #0xf000
    str r4, [r0, #0x24]
    str r3, [sp]
    str r1, [sp, #0x4]
    add r2, r7, #0xaa0
    mov r1, r5
    bl func_02004fe8
    mov r0, r5
    bl Task_InvokeLocked
    mov r0, r6
    bl Task_InvokeLocked
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov020_021ae0a8
_LIT1: .word data_02102c90
_LIT2: .word data_02104f4c
