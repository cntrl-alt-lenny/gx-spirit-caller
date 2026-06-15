; func_020604b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101244
        .extern data_02101338
        .extern data_02101348
        .extern func_020a6d54
        .extern func_020aaec0
        .global func_020604b0
        .arm
func_020604b0:
    stmdb sp!, {r4, r5, r6, lr}
    movs r6, r0
    mov r5, r1
    mov r4, r2
    bne .L_28
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x2f
    bl func_020a6d54
.L_28:
    cmp r5, #0x0
    bne .L_44
    ldr r0, _LIT2
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x30
    bl func_020a6d54
.L_44:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_020aaec0
    add r0, r6, r4
    mov r1, #0x0
    strb r1, [r0, #-1]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02101338
_LIT1: .word data_02101244
_LIT2: .word data_02101348
