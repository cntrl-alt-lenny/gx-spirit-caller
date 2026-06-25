; func_02091afc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a62e8
        .extern func_020915a8
        .extern func_020915e0
        .extern func_020918a4
        .extern func_02091924
        .extern func_02091f8c
        .extern func_0209206c
        .extern func_02092618
        .extern func_02093b08
        .global func_02091afc
        .arm
func_02091afc:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r4, [r0]
    bl func_020915e0
    mov r0, r4
    bl func_02092618
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_b8
    mov r1, r4
    bl func_0209206c
.L_b8:
    mov r0, r4
    bl func_02091f8c
    mov r1, #0x2
    add r0, r4, #0x9c
    str r1, [r4, #0x64]
    bl func_02091924
    bl func_020915a8
    bl func_020918a4
    bl func_02093b08
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a62e8
