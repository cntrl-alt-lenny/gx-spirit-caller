; func_02020684 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6718
        .extern data_02191e60
        .extern func_0201f0e4
        .extern func_020206e4
        .extern func_02093b08
        .global func_02020684
        .arm
func_02020684:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x30]
    cmp r0, #0x7
    beq .L_18
    bl func_02093b08
.L_18:
    mov r0, #0x1
    bl func_0201f0e4
    ldr r0, _LIT0
    ldrh r0, [r0, #0x6]
    bl func_020206e4
    ldr r1, _LIT0
    strh r0, [r1, #0xc]
    ldr r2, [r1, #0x38]
    cmp r2, #0x0
    beq .L_4c
    ldrh r1, [r1, #0xc]
    ldr r0, _LIT1
    blx r2
.L_4c:
    ldr r0, _LIT0
    ldrh r0, [r0, #0xc]
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191e60
_LIT1: .word data_020c6718
