; func_ov020_021abb2c - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov020_021ae060
        .extern func_0207e638
        .extern func_ov020_021aa8f0
        .global func_ov020_021abb2c
        .arm
func_ov020_021abb2c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r3, #0x28
    mul r3, r0, r3
    add r0, r3, #0x1a
    mov r3, r0, lsl #0xc
    mov ip, #0x3000
    ldr r0, _LIT0
    mov r5, r1
    str ip, [sp, #0x8]
    str r3, [sp, #0xc]
    ldr r0, [r0, #0x96c]
    mov r1, #0x9
    mov r4, r2
    bl func_0207e638
    mvn ip, #0x0
    mov r2, r0
    str ip, [sp]
    add r3, sp, #0x8
    mov r0, r5
    mov r1, r4
    str ip, [sp, #0x4]
    bl func_ov020_021aa8f0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov020_021ae060
