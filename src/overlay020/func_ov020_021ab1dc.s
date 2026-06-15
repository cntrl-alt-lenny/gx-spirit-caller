; func_ov020_021ab1dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_02102c90
        .extern data_02104f4c
        .extern func_02001c98
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001e5c
        .extern func_02004fb8
        .extern func_02005088
        .extern func_020054a4
        .extern func_0208df0c
        .extern func_ov020_021aa4a0
        .extern func_ov020_021aa700
        .global func_ov020_021ab1dc
        .arm
func_ov020_021ab1dc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8
    mov r8, r1
    mov r7, r2
    mov r6, r0
    bl func_0208df0c
    add r5, r0, #0x20
    mov r3, #0xc80
    mov r0, r8
    add r1, r7, #0x1
    mov r2, #0x0
    mul r4, r6, r3
    bl func_ov020_021aa700
    add r0, r0, #0x4
    bic r6, r0, #0x3
    mov r0, r6
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r2, r6
    mov r6, r0
    mov r0, #0x0
    mov r1, r6
    bl Fill32
    mov r0, r8
    add r1, r7, #0x1
    mov r2, r6
    bl func_ov020_021aa700
    mov r0, #0x0
    mov r1, r6
    bl func_ov020_021aa4a0
    add r0, r0, #0x4
    bic r7, r0, #0x3
    mov r0, r7
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r2, r7
    mov r7, r0
    mov r0, #0x0
    mov r1, r7
    bl Fill32
    mov r0, r7
    mov r1, r6
    bl func_ov020_021aa4a0
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r2, _LIT1
    mov r0, r7
    ldr r3, [r2, #0x20]
    mov r1, #0xe
    bic r3, r3, #0x800000
    str r3, [r2, #0x20]
    bl func_020054a4
    add r0, r0, #0x2
    cmp r0, #0xc8
    movle r8, #0x9
    ldr r0, _LIT1
    mov r1, #0x19
    mov r2, #0x4
    movgt r8, #0x1
    bl func_02001d0c
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    mov r0, #0xf
    mov r1, #0x1
    bl func_02001c98
    mov r9, #0xe
    ldr r0, _LIT1
    mov r1, r7
    mov r2, #0x2
    mov r3, r8
    str r9, [sp]
    bl func_02004fb8
    ldr r0, _LIT1
    bl func_02001e5c
    cmp r0, #0x0
    moveq r9, #0xc
    ldr r0, _LIT1
    mov r1, r7
    add r2, r5, r4
    mov r3, #0x1
    stmia sp, {r8, r9}
    bl func_02005088
    mov r0, r7
    bl Task_InvokeLocked
    mov r0, r6
    bl Task_InvokeLocked
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_02102c90
