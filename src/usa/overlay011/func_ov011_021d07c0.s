; func_ov011_021d07c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3fe4
        .extern data_ov011_021d4000
        .extern data_ov011_021d4030
        .extern data_ov011_021d4040
        .extern data_ov011_021d4098
        .extern data_ov011_021d40a0
        .extern func_02001b84
        .extern func_02005898
        .extern func_02005c44
        .extern func_0201eee8
        .extern func_0202c158
        .extern func_ov000_021aad90
        .extern func_ov000_021b3724_unk
        .extern func_ov011_021ca2f4
        .extern func_ov011_021d2cc8
        .global func_ov011_021d07c0
        .arm
func_ov011_021d07c0:
    stmdb sp!, {r3, lr}
    bl func_02005898
    bl func_ov000_021aad90
    bl func_ov011_021ca2f4
    ldr r0, _LIT0
    ldr r0, [r0, #0x250]
    bl func_ov000_021b3724_unk
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0xe8]
    ldr r2, _LIT2
    bl func_0201eee8
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldr r0, [r0, #0xec]
    ldr r2, _LIT4
    bl func_0201eee8
    ldr r0, _LIT0
    ldr r1, _LIT5
    ldr r0, [r0, #0xbc]
    ldr r2, _LIT6
    bl func_0201eee8
    .word 0xebff8143
    bl func_ov011_021d2cc8
    bl func_0202c158
    bl func_02001b84
    mov r0, #0x1
    bl func_02005c44
    mov r0, #0x2
    bl func_02005c44
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d4030
_LIT2: .word data_ov011_021d4098
_LIT3: .word data_ov011_021d4040
_LIT4: .word data_ov011_021d40a0
_LIT5: .word data_ov011_021d3fe4
_LIT6: .word data_ov011_021d4000
