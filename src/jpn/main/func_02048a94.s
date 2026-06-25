; func_02048a94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba0
        .extern func_02048b4c
        .extern func_02049118
        .extern func_020535dc
        .global func_02048a94
        .arm
func_02048a94:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r1
    mov r7, r0
    mov r5, r2
    cmp r6, #0x0
    mov r4, #0x0
    ble .L_2bc
.L_234:
    mov r0, r4
    bl func_02049118
    cmp r0, #0x0
    beq .L_2b0
    cmp r0, r5
    bne .L_2b0
    mov r0, #0xc
    mla r0, r6, r0, r7
    bl func_020535dc
    cmp r0, #0x0
    beq .L_288
    mov r0, #0xc
    mla r0, r4, r0, r7
    bl func_020535dc
    cmp r0, #0x0
    bne .L_288
    mov r0, r7
    mov r1, r4
    mov r2, r6
    bl func_02048b4c
    b .L_298
.L_288:
    mov r0, r7
    mov r1, r6
    mov r2, r4
    bl func_02048b4c
.L_298:
    ldr r1, _LIT0
    mov r0, #0x1
    ldr r1, [r1]
    add sp, sp, #0x4
    strb r0, [r1, #0x1d]
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_2b0:
    add r4, r4, #0x1
    cmp r4, r6
    blt .L_234
.L_2bc:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_0219dba0
