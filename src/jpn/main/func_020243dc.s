; func_020243dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_PostLocked
        .extern data_020be660
        .extern data_0219a80c
        .extern data_0219a814
        .extern func_02026f24
        .global func_020243dc
        .arm
func_020243dc:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    ldr r4, _LIT0
    ldr r1, _LIT1
    mov r6, r0
    add r3, sp, #0x0
    ldmia r1, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x38
    ldr r5, _LIT2
    bl Fill32
    ldr r0, _LIT3
    str r6, [r0, #0x4]
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_140
    ldr r1, [r4, #0x4]
    mov r0, #0x16c
    mul r6, r1, r0
    mov r0, r6
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r0
    mov r2, r6
    mov r0, #0x0
    str r1, [r4]
    bl Fill32
.L_140:
    mov r2, #0x80
    mov r3, #0x5
    mov r1, #0x0
    add r0, sp, #0x0
    strb r3, [r5]
    strh r2, [r5, #0x4]
    strh r2, [r5, #0x6]
    str r1, [r5, #0x1c]
    bl func_02026f24
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_0219a80c
_LIT1: .word data_020be660
_LIT2: .word data_0219a814
_LIT3: .word data_0219a80c
