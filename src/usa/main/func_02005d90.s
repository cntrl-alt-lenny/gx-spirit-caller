; func_02005d90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103c8c
        .extern func_02005d38
        .global func_02005d90
        .arm
func_02005d90:
    stmdb sp!, {r4, lr}
    mov r2, r0
    cmp r2, #0x1
    beq .L_1c
    cmp r2, #0x2
    beq .L_28
    b .L_34
.L_1c:
    ldr r0, _LIT0
    ldr r4, [r0]
    b .L_38
.L_28:
    ldr r0, _LIT0
    ldr r4, [r0, #0x4]
    b .L_38
.L_34:
    mov r4, #0x0
.L_38:
    add r0, r4, #0xa00
    ldrh r0, [r0]
    cmp r0, #0x80
    movcs r0, #0x0
    ldmcsia sp!, {r4, pc}
    bl func_02005d38
    add r1, r4, #0xa00
    ldrh ip, [r1]
    add r2, r4, #0x400
    mov r0, #0xc
    mla r0, ip, r0, r2
    add r3, ip, #0x1
    strh r3, [r1]
    ldmia sp!, {r4, pc}
_LIT0: .word data_02103c8c
