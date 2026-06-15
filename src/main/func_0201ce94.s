; func_0201ce94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c5db0
        .extern data_0218febc
        .extern data_0218fef4
        .extern data_0218ff4c
        .extern data_0219000c
        .extern data_02191e20
        .extern func_0201c99c
        .extern func_0201cfa0
        .extern func_02020b78
        .extern func_02092748
        .extern func_020927b8
        .extern func_02094688
        .global func_0201ce94
        .arm
func_0201ce94:
    stmdb sp!, {r3, lr}
    bl func_0201cfa0
    cmp r0, #0x0
    ldrne r1, _LIT0
    ldrne r0, [r1, #0x10]
    cmpne r0, #0x0
    ldrne r0, _LIT1
    ldrne r2, [r0]
    cmpne r2, #0x0
    ldmeqia sp!, {r3, pc}
    mov r2, #0x0
    str r2, [r0]
    ldr r3, [r1, #0x4]
    ldr r0, _LIT2
    mov r1, r3, lsl #0x1
    ldr ip, _LIT3
    ldrh r2, [r0, r1]
    ldr r1, _LIT4
    add r0, ip, r3, lsl #0x4
    bl func_02094688
    ldr r0, _LIT0
    ldr r1, _LIT2
    ldr r2, [r0, #0x4]
    ldr r0, _LIT4
    mov r2, r2, lsl #0x1
    ldrh r1, [r1, r2]
    ldr r2, _LIT5
    bl func_02020b78
    ldr r0, _LIT6
    bl func_020927b8
    ldr r1, _LIT0
    ldr r0, _LIT6
    ldr r2, [r1, #0x4]
    add r2, r2, #0x1
    and r2, r2, #0x1f
    str r2, [r1, #0x4]
    ldr r2, [r1, #0x10]
    sub r2, r2, #0x1
    str r2, [r1, #0x10]
    bl func_02092748
    ldmia sp!, {r3, pc}
_LIT0: .word data_0218febc
_LIT1: .word data_020c5db0
_LIT2: .word data_0218ff4c
_LIT3: .word data_0219000c
_LIT4: .word data_02191e20
_LIT5: .word func_0201c99c
_LIT6: .word data_0218fef4
