; func_ov002_0226aef0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0226acf8
        .global func_ov002_0226aef0
        .arm
func_ov002_0226aef0:
    cmp r2, #0x0
    mov r2, #0x0
    orrne r2, r2, #0x1
    movne r2, r2, lsl #0x10
    movne r2, r2, lsr #0x10
    cmp r3, #0x0
    orrne r2, r2, #0x8
    movne r2, r2, lsl #0x10
    movne r2, r2, lsr #0x10
    orr r2, r2, #0x20
    mov r3, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    ldr ip, _LIT0
    mov r3, r3, lsr #0x10
    mov r1, #0x2
    bx ip
_LIT0: .word func_ov002_0226acf8
