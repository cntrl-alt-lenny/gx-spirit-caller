; func_ov004_021cbf34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104b9a
        .extern data_02104e6c
        .extern data_021058a9
        .extern data_ov004_0220b2a0
        .extern func_0201cfdc
        .extern func_0201d028
        .extern func_0201d0e0
        .extern func_02020cac
        .extern func_020371b8
        .extern func_020aad04
        .global func_ov004_021cbf34
        .arm
func_ov004_021cbf34:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
    ldr r4, _LIT0
    bl func_0201cfdc
    cmp r0, #0x4
    bne .L_24
    bl func_0201d028
    mov r0, #0x1
    b .L_98
.L_24:
    ldr r0, _LIT1
    mov r2, #0x6
    ldrb r1, [r0, #0xa3c]
    ldr r0, _LIT2
    str r2, [sp]
    mov r1, r1, lsl #0x1d
    mov r1, r1, lsr #0x1d
    strb r1, [r0, #0xbcc]
    add r0, r0, #0xb00
    ldrsb r2, [r0, #0xcc]
    ldr r0, _LIT3
    ldr r1, _LIT4
    strb r2, [sp, #0x8]
    bl func_020aad04
    ldr r1, _LIT3
    add r0, sp, #0x9
    bl func_020aad04
    ldr r1, _LIT1
    add r0, sp, #0x0
    ldr r2, [r1, #0xa64]
    mov r1, #0x1
    str r2, [sp, #0x4]
    bl func_02020cac
    bl func_0201d0e0
    mov r1, #0x0
    mov r0, #0x2
    str r1, [r4, #0x74]
    str r1, [r4, #0x7c]
    str r1, [r4, #0x78]
.L_98:
    str r0, [r4, #0x54]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_02104e6c
_LIT2: .word data_02103fcc
_LIT3: .word data_02104b9a
_LIT4: .word data_021058a9
