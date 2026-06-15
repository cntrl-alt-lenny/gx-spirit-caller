; func_0200aa60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_020c44c4
        .extern data_02102c90
        .extern data_021040ac
        .extern func_02004f58
        .extern func_0208df0c
        .global func_0200aa60
        .arm
func_0200aa60:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    ldr r0, [r0, #0x38]
    tst r0, #0x10
    beq .L_9c
    bl func_0208df0c
    mov r2, r0
    mov r3, #0xb0
    ldr r0, _LIT1
    ldr r1, _LIT2
    str r3, [sp]
    mov ip, #0xa
    mov r3, #0xc0
    str ip, [sp, #0x4]
    bl func_02004f58
    b .L_c4
.L_9c:
    bl func_0208df0c
    add r1, r0, #0x5b00
    mov r0, #0x0
    mov r2, #0x100
    bl Fill32
    bl func_0208df0c
    add r1, r0, #0x5f00
    mov r0, #0x0
    mov r2, #0x100
    bl Fill32
.L_c4:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_02102c90
_LIT2: .word data_020c44c4
