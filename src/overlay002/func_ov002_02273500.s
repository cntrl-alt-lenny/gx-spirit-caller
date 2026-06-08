; func_ov002_02273500 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern func_ov002_02271ab4
        .global func_ov002_02273500
        .arm
func_ov002_02273500:
    ldr r0, _LIT0
    ldr ip, _LIT1
    ldr r1, [r0, #0x18]
    mov r2, r1, lsl #0x18
    movs r2, r2, lsr #0x18
    biceq r1, r1, #0xff
    orreq r1, r1, #0x1e
    streq r1, [r0, #0x18]
    bx ip
_LIT0: .word data_ov002_022cd300
_LIT1: .word func_ov002_02271ab4
