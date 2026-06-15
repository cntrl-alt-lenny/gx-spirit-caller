; func_0205aecc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021007bc
        .extern data_021009ac
        .extern data_021009c4
        .extern func_02058038
        .extern func_02058070
        .global func_0205aecc
        .arm
func_0205aecc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r4, [r6]
    mov r5, r1
    ldr r2, [r4, #0x448]
    cmp r2, #0x0
    ble .L_5c
    ldr r2, _LIT0
    bl func_02058070
    ldr r2, [r4, #0x198]
    mov r0, r6
    mov r1, r5
    bl func_02058038
    ldr r2, [r4, #0x440]
    mov r0, r6
    mov r1, r5
    bl func_02058070
    ldr r2, _LIT1
    mov r0, r6
    mov r1, r5
    bl func_02058070
    mov r0, #0x0
    str r0, [r4, #0x448]
.L_5c:
    ldr r0, [r4, #0x458]
    cmp r0, #0x0
    ble .L_b0
    ldr r2, _LIT2
    mov r0, r6
    mov r1, r5
    bl func_02058070
    ldr r2, [r4, #0x198]
    mov r0, r6
    mov r1, r5
    bl func_02058038
    ldr r2, [r4, #0x450]
    mov r0, r6
    mov r1, r5
    bl func_02058070
    ldr r2, _LIT1
    mov r0, r6
    mov r1, r5
    bl func_02058070
    mov r0, #0x0
    str r0, [r4, #0x458]
.L_b0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021009ac
_LIT1: .word data_021007bc
_LIT2: .word data_021009c4
