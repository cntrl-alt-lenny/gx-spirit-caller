; func_0200aa44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_020c4124
        .extern data_02102bb0
        .extern data_02103fcc
        .extern func_02004f3c
        .extern func_0208de24
        .global func_0200aa44
        .arm
func_0200aa44:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    ldr r0, [r0, #0x38]
    tst r0, #0x10
    beq .L_44
    bl func_0208de24
    mov r2, r0
    mov r3, #0xb0
    ldr r0, _LIT1
    ldr r1, _LIT2
    str r3, [sp]
    mov ip, #0xa
    mov r3, #0xc0
    str ip, [sp, #0x4]
    bl func_02004f3c
    b .L_6c
.L_44:
    bl func_0208de24
    add r1, r0, #0x5b00
    mov r0, #0x0
    mov r2, #0x100
    bl Fill32
    bl func_0208de24
    add r1, r0, #0x5f00
    mov r0, #0x0
    mov r2, #0x100
    bl Fill32
.L_6c:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word data_02103fcc
_LIT1: .word data_02102bb0
_LIT2: .word data_020c4124+0x2c0
