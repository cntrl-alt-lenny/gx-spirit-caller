; func_02087c34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a485c
        .extern data_021a4868
        .extern data_021a4874
        .extern data_021a4cb4
        .extern func_0207d12c
        .extern func_0207d1b8
        .global func_02087c34
        .arm
func_02087c34:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r0, _LIT0
    mov r1, #0x14
    bl func_0207d1b8
    ldr r0, _LIT1
    mov r1, #0x14
    bl func_0207d1b8
    ldr r6, _LIT2
    mov r7, #0x0
    ldr r4, _LIT1
    mov r5, r7
.L_258:
    strb r5, [r6, #0x2c]
    mov r0, r4
    mov r1, r6
    strb r7, [r6, #0x3c]
    bl func_0207d12c
    add r7, r7, #0x1
    cmp r7, #0x10
    add r6, r6, #0x44
    blt .L_258
    ldr sl, _LIT3
    mov r9, #0x0
    mov r7, r9
    mov r4, r9
    mov r8, #0xc
    mov r6, #0x7f
    mov r5, #0x1
.L_298:
    mov r0, sl
    mov r1, r8
    bl func_0207d1b8
    mov r1, r7
    add r0, sl, #0xc
    bl func_0207d1b8
    strb r6, [sl, #0x20]
    str r5, [sl, #0x18]
    add r9, r9, #0x1
    str r4, [sl, #0x1c]
    cmp r9, #0x20
    add sl, sl, #0x24
    blt .L_298
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_021a4868
_LIT1: .word data_021a485c
_LIT2: .word data_021a4874
_LIT3: .word data_021a4cb4
