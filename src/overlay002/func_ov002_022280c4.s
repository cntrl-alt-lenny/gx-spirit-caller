; func_ov002_022280c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022cf17c
        .extern func_ov002_021af9d0
        .global func_ov002_022280c4
        .arm
func_ov002_022280c4:
    stmdb sp!, {r3, lr}
    mov ip, r0
    ldrh r0, [ip, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r3, r0, #0x1
    and r3, r3, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    beq .L_378
    ldr r1, _LIT2
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x0
    bne .L_378
    ldrh r2, [ip]
    mov r1, #0x5
    mov r3, #0x0
    bl func_ov002_021af9d0
.L_378:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022cd744
