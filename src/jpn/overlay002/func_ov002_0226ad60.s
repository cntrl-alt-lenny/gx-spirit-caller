; func_ov002_0226ad60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0226ac08
        .global func_ov002_0226ad60
        .arm
func_ov002_0226ad60:
    mov r3, #0x0
    cmp r2, #0x1
    orreq r3, r3, #0x1
    moveq r3, r3, lsl #0x10
    moveq r3, r3, lsr #0x10
    cmp r2, #0x8
    orreq r3, r3, #0x4
    moveq r3, r3, lsl #0x10
    moveq r3, r3, lsr #0x10
    cmp r2, #0x7
    orreq r2, r3, #0x8
    moveq r2, r2, lsl #0x10
    moveq r3, r2, lsr #0x10
    orr r2, r3, #0x10
    mov r3, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    ldr ip, _LIT0
    mov r3, r3, lsr #0x10
    mov r1, #0x2
    bx ip
_LIT0: .word func_ov002_0226ac08
