; func_02005dac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103d6c
        .extern func_02005d54
        .global func_02005dac
        .arm
func_02005dac:
    stmdb sp!, {r4, lr}
    mov r2, r0
    cmp r2, #0x1
    beq .L_74
    cmp r2, #0x2
    beq .L_80
    b .L_8c
.L_74:
    ldr r0, _LIT0
    ldr r4, [r0]
    b .L_90
.L_80:
    ldr r0, _LIT0
    ldr r4, [r0, #0x4]
    b .L_90
.L_8c:
    mov r4, #0x0
.L_90:
    add r0, r4, #0xa00
    ldrh r0, [r0]
    cmp r0, #0x80
    movcs r0, #0x0
    ldmcsia sp!, {r4, pc}
    bl func_02005d54
    add r1, r4, #0xa00
    ldrh ip, [r1]
    add r2, r4, #0x400
    mov r0, #0xc
    mla r0, ip, r0, r2
    add r3, ip, #0x1
    strh r3, [r1]
    ldmia sp!, {r4, pc}
_LIT0: .word data_02103d6c
