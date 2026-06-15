; func_02056c34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fff84
        .extern data_020fffa0
        .extern data_020fffec
        .extern data_020ffff4
        .extern data_020ffff8
        .extern func_02058038
        .extern func_02058070
        .extern func_020604b0
        .global func_02056c34
        .arm
func_02056c34:
    stmdb sp!, {r4, r5, r6, r7, lr}
    ldr ip, _LIT0
    sub sp, sp, ip
    mov r7, r0
    mov r5, r2
    mov r6, r1
    ldr r2, _LIT1
    add r0, sp, #0x0
    mov r1, r3
    ldr r4, [r7]
    bl func_020604b0
    ldr r2, _LIT2
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02058070
    mov r0, r7
    mov r2, r5
    add r1, r4, #0x1f4
    bl func_02058038
    ldr r2, _LIT3
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02058070
    ldr r2, [r4, #0x198]
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02058038
    ldr r2, _LIT4
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02058070
    mov r2, r6
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02058038
    ldr r2, _LIT5
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02058070
    mov r0, r7
    add r1, r4, #0x1f4
    add r2, sp, #0x0
    bl func_02058070
    ldr r2, _LIT6
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02058070
    mov r0, #0x0
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x00000db4
_LIT1: .word 0x00000dad
_LIT2: .word data_020fffec
_LIT3: .word data_020fff84
_LIT4: .word data_020ffff4
_LIT5: .word data_020ffff8
_LIT6: .word data_020fffa0
