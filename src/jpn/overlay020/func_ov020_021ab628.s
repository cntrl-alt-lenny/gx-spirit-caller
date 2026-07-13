; func_ov020_021ab628 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov020_021adebc
        .extern data_ov020_021adec0
        .extern data_ov020_021adf90
        .extern data_ov020_021adfa4
        .extern func_02006e00
        .extern func_0201ed58
        .extern func_0201ed90
        .extern func_0207f428
        .extern func_0207f528
        .global func_ov020_021ab628
        .arm
func_ov020_021ab628:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r4, _LIT0
    mov r8, r0
    mov r7, r1
    ldr r1, [r4, r8, lsl #0x4]
    add r0, sp, #0x4
    mov r6, r2
    mov r5, r3
    bl func_0201ed58
    mov r4, r0
    ldr r0, [sp, #0x4]
    ldr r3, _LIT1
    mov r1, r6
    mov r2, r7
    bl func_0207f528
    mov r0, r4
    bl func_02006e00
    ldr r1, _LIT2
    add r0, sp, #0x0
    ldr r1, [r1, r8, lsl #0x4]
    bl func_0201ed90
    mov r4, r0
    ldr r0, [sp]
    ldr r3, _LIT3
    mov r1, r5
    mov r2, r7
    bl func_0207f428
    mov r0, r4
    bl func_02006e00
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov020_021adebc
_LIT1: .word data_ov020_021adfa4
_LIT2: .word data_ov020_021adec0
_LIT3: .word data_ov020_021adf90
