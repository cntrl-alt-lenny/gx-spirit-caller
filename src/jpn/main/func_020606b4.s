; func_020606b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101278
        .extern data_0210127c
        .extern func_0206073c
        .extern func_02060b9c
        .extern func_02060d18
        .global func_020606b4
        .arm
func_020606b4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r9, r1
    mov sl, r0
    mov r7, r9
    bl func_02060b9c
    mov r8, r0
    ldr r5, _LIT0
    ldr r4, _LIT1
    b .L_270
.L_22c:
    sub r6, r8, sl
    mov r0, sl
    mov r1, r6
    str r5, [r4]
    bl func_02060d18
    mov r0, sl
    mov r1, r6
    bl func_0206073c
    add r0, r6, #0x7
    sub r9, r9, r0
    cmp r9, #0x0
    add sl, r8, #0x7
    ble .L_270
    mov r0, sl
    mov r1, r9
    bl func_02060b9c
    mov r8, r0
.L_270:
    cmp r9, #0x0
    ble .L_280
    cmp r8, #0x0
    bne .L_22c
.L_280:
    sub r0, r7, r9
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0210127c
_LIT1: .word data_02101278
