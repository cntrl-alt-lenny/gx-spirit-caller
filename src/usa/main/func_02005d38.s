; func_02005d38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103c8c
        .global func_02005d38
        .arm
func_02005d38:
    cmp r2, #0x1
    beq .L_14
    cmp r2, #0x2
    beq .L_20
    b .L_2c
.L_14:
    ldr r2, _LIT0
    ldr ip, [r2]
    b .L_30
.L_20:
    ldr r2, _LIT0
    ldr ip, [r2, #0x4]
    b .L_30
.L_2c:
    mov ip, #0x0
.L_30:
    mov r2, #0xc
    mla r3, r0, r2, ip
    add r1, ip, r1, lsl #0x1
    add r2, r1, #0xa00
    ldrsh ip, [r2, #0x2]
    add r1, r3, #0x400
    strh ip, [r1, #0x8]
    strh r0, [r2, #0x2]
    bx lr
_LIT0: .word data_02103c8c
