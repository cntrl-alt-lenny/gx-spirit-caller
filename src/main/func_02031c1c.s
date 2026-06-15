; func_02031c1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219adcc
        .extern func_02031ab0
        .extern func_02031b38
        .global func_02031c1c
        .arm
func_02031c1c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    str r1, [r4, #0x2c]
    movs r0, r2, lsr #0x18
    moveq ip, #0x6
    subne ip, r0, #0x1
    and r0, r2, #0x1
    cmp r0, #0x0
    and r1, r1, #0x0
    ldr r2, [sp, #0x8]
    str r3, [r4, #0x8]
    str r2, [r4, #0xc]
    cmpeq r1, #0x0
    mov r0, #0x64
    beq .L_cc
    ldr r1, _LIT0
    mla r0, ip, r0, r1
    mov r1, r4
    bl func_02031ab0
    b .L_dc
.L_cc:
    ldr r1, _LIT0
    mla r0, ip, r0, r1
    mov r1, r4
    bl func_02031b38
.L_dc:
    ldr r0, [r4, #0x10]
    ldr r1, [r4, #0x14]
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219adcc
