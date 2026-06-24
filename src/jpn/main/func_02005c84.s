; func_02005c84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103c8c
        .extern func_02005cf0
        .global func_02005c84
        .arm
func_02005c84:
    stmdb sp!, {r3, lr}
    cmp r0, #0x1
    beq .L_18
    cmp r0, #0x2
    beq .L_24
    b .L_30
.L_18:
    ldr r1, _LIT0
    ldr ip, [r1]
    b .L_34
.L_24:
    ldr r1, _LIT0
    ldr ip, [r1, #0x4]
    b .L_34
.L_30:
    mov ip, #0x0
.L_34:
    mov r3, #0x0
    mvn r2, #0x0
.L_3c:
    add r1, ip, r3, lsl #0x1
    add r1, r1, #0xa00
    add r3, r3, #0x1
    strh r2, [r1, #0x2]
    cmp r3, #0x20
    blt .L_3c
    add r1, ip, #0xa00
    mov r2, #0x0
    strh r2, [r1]
    bl func_02005cf0
    ldmia sp!, {r3, pc}
_LIT0: .word data_02103c8c
