; func_ov002_022005e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf09c
        .global func_ov002_022005e0
        .arm
func_ov002_022005e0:
    ldrh r2, [r0]
    ldr r1, _LIT0
    cmp r2, r1
    beq .L_20
    add r1, r1, #0x20
    cmp r2, r1
    beq .L_28
    b .L_30
.L_20:
    mov ip, #0x3
    b .L_34
.L_28:
    mov ip, #0x2
    b .L_34
.L_30:
    mov ip, #0x1
.L_34:
    ldrh r3, [r0, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r3, lsl #0x11
    mov r3, r3, lsl #0x1f
    mov r2, r2, lsr #0x1f
    eor r2, r2, r3, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, ip
    movcs r0, #0x1
    movcc r0, #0x0
    bx lr
_LIT0: .word 0x000012cc
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf09c
