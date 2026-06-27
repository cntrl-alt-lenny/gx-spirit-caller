; func_ov002_02287e1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf09c
        .extern data_ov002_022cf0a0
        .global func_ov002_02287e1c
        .arm
func_ov002_02287e1c:
    ldrh r1, [r0, #0x2]
    ldr r0, _LIT0
    ldr r3, _LIT1
    mov r1, r1, lsl #0x1f
    mov ip, r1, lsr #0x1f
    rsb r1, ip, #0x1
    and r2, r1, #0x1
    and r1, ip, #0x1
    mul ip, r2, r0
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r1, [r3, ip]
    ldr r0, [r0, r2]
    cmp r1, r0
    movcs r0, #0x0
    bxcs lr
    cmp r1, #0x3
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf09c
