; func_02010f68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218fc30
        .extern func_02010e9c
        .extern func_020110a8
        .global func_02010f68
        .arm
func_02010f68:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    cmp r1, #0x0
    blt .L_18
    cmp r1, #0x2
    blt .L_20
.L_18:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_20:
    ldr r2, _LIT0
    mov r0, #0xb8
    mla r4, r1, r0, r2
    mov r1, #0x1
    mov r0, r4
    str r1, [r4, #0xa8]
    bl func_020110a8
    add r0, r4, #0x30
    bl func_020110a8
    mov r1, #0x0
    str r1, [r4, #0x60]
    str r1, [r4, #0x64]
    mov r0, #0xa000
    str r0, [r4, #0x68]
    str r1, [r4, #0x6c]
    str r1, [r4, #0x70]
    str r1, [r4, #0x74]
    str r1, [r4, #0x78]
    mov r0, #0x1000
    str r0, [r4, #0x7c]
    str r1, [r4, #0x80]
    str r1, [r4, #0x90]
    cmp r5, #0x0
    beq .L_8c
    cmp r5, #0x1
    beq .L_e8
    b .L_fc
.L_8c:
    mov r0, #0x7500
    str r0, [r4, #0x9c]
    strh r1, [r4, #0x94]
    strh r1, [r4, #0x96]
    strh r1, [r4, #0x98]
    mov r0, #0x8000
    strh r0, [r4, #0x9a]
    str r1, [r4, #0x84]
    str r1, [r4, #0x88]
    str r1, [r4, #0x8c]
    str r1, [r4, #0x60]
    ldr r0, _LIT1
    str r1, [r4, #0x64]
    str r0, [r4, #0x68]
    str r1, [r4, #0x6c]
    str r1, [r4, #0x70]
    ldr r0, _LIT2
    str r1, [r4, #0x74]
    str r0, [r4, #0xa0]
    str r1, [r4, #0xb4]
    str r1, [r4, #0xac]
    str r1, [r4, #0xb0]
    b .L_fc
.L_e8:
    mov r0, #0x1
    str r0, [r4, #0xb4]
    ldr r0, _LIT3
    str r1, [r4, #0xac]
    str r0, [r4, #0xb0]
.L_fc:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_0218fc30
_LIT1: .word 0x00008fb2
_LIT2: .word 0x41c80000
_LIT3: .word func_02010e9c
